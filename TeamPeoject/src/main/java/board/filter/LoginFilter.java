package board.filter;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import board.DAO.UserAuthDAO;
import board.DTO.PersistenceLogins;
import board.DTO.User;
import board.service.PersistenceLoginsService;
import board.service.PersistenceLoginsServiceImpl;
import board.service.UserService;
import board.service.UserServiceImpl;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(description = "자동 로그인 등, 인증 처리 필터", urlPatterns = { "/*" })
public class LoginFilter extends HttpFilter implements Filter {
	
	private static final long serialVersionUID = 6470731114379833406L;
	
	PersistenceLoginsService persistenceLoginsService;
	UserService userService;
       
    public LoginFilter() {
        super();
    }

    public void init(FilterConfig fConfig) throws ServletException {
    	persistenceLoginsService = new PersistenceLoginsServiceImpl();
    	userService = new UserServiceImpl();
    }
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 쿠키 확인
		// 1. 자동 로그인 여부
		// 2. 인증 토큰
		
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		Cookie[] cookies = httpRequest.getCookies();
		
		String uri = httpRequest.getRequestURI();
		String root = httpRequest.getContextPath();
		
		String rememberMe = null;		// 자동 로그인 여부
		String token = null;			// 인증 토큰
		
		if( cookies != null ) {
			for (Cookie cookie : cookies) {
				String cookieName = cookie.getName();
				String cookieValue = URLDecoder.decode( cookie.getValue(), "UTF-8") ;
				switch (cookieName) {
					case "rememberMe"	: rememberMe = cookieValue; break;
					case "token"		: token = cookieValue; break;
				}
			}
		}
		System.out.println("LoginFilter...");
		System.out.println("rememberMe : " + rememberMe);
		System.out.println("token : " + token);
		
		// 로그인 여부 확인
		HttpSession session = httpRequest.getSession();
		String loginId = (String) session.getAttribute("loginId");
		User loginUser = (User) session.getAttribute("loginUser");
		
		// 자동 로그인 & 토큰 ok
		if( "on".equals(rememberMe) && token != null && !token.isBlank() && loginUser == null ) {
			System.out.println("rememberMe : " + rememberMe);
			System.out.println("token : " + token);
			PersistenceLogins persistenceLogins = persistenceLoginsService.selectByToken(token);
			System.out.println("persistenceLogins : " + persistenceLogins);
			boolean isValid = persistenceLoginsService.isValid(token);
			// 토큰이 존재, 유효
			if( persistenceLogins != null && isValid ) {
				loginId = persistenceLogins.getUserId();
				loginUser = userService.selectByUserId(loginId);
				System.out.println("loginId : " + loginId);
				System.out.println("loginUser : " + loginUser);
				// 로그인 처리
				session.setAttribute("loginId", loginId);
				session.setAttribute("loginUser", loginUser);
				System.out.println("자동 로그인 성공 : " + loginUser);
			}
		}
		
		if ( loginUser != null && session.getAttribute("authList") == null ) {
			try {
				UserAuthDAO userAuthDAO = new UserAuthDAO();
				
				List<String> authList = userAuthDAO.selectAuthListByUserNo(loginUser.getNo());
				session.setAttribute("authList", authList);
				
			} catch (Exception e) {
				e.printStackTrace();
				httpResponse.sendRedirect(root + "/");
				return;
			}
		}
		
		boolean owner = uri.startsWith(root + "/owner/");
		
		if(owner) {
			@SuppressWarnings("unchecked")
			List<String> authList = (List<String>) session.getAttribute("authList");
			
			boolean isOwner = authList != null && authList.contains("ROLE_OWNER");
			
			if(!isOwner) {
				if(loginUser == null ) {
					httpResponse.sendRedirect(root + "/login");
					return;
				}
				else {
					httpResponse.sendRedirect(root + "/");
					return;
				}
			}
			
		}
		
		
		chain.doFilter(request, response);
	}

	public void destroy() {
		
	}
}