package board.servlet;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import board.DAO.UserAuthDAO;
import board.DTO.PersistenceLogins;
import board.DTO.User;
import board.exception.AppException;
import board.exception.ErrorCode;
import board.service.PersistenceLoginsService;
import board.service.PersistenceLoginsServiceImpl;
import board.service.UserService;
import board.service.UserServiceImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet({"/login", "/login.jsp"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserService userService = new UserServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("loginUser") != null) {
		    response.sendRedirect(request.getContextPath() + "/");
		    return;
		}
		
		String page = "";
		// 아이디 저장 쿠키 확인
		System.out.println("아이디 저장 쿠키 확인 ...");
		String rememberId = "";
		String userId = "";
		Cookie[] cookies = request.getCookies();
		if( cookies != null ) {
			for( Cookie cookie : cookies ) {
				String cookieName = cookie.getName();
				String cookieValue = URLDecoder.decode( cookie.getValue(), "UTF-8" );
				switch(cookieName) {
					case "user_id" : userId = cookieValue; break;
					case "rememberId" : rememberId = cookieValue; break;
				}
				
			}
		}
		request.setAttribute("user_id", userId);
		request.setAttribute("rememberId", rememberId);
		
		page = "/page/login.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();			// /Board
		
		// /login - 로그인
		String userId = request.getParameter("user_id");
		String password = request.getParameter("password");
		
		try {
			User user = userService.loginOrThrow(userId, password);
			
			// 아이디 저장 ---------------------------------------------------
			String rememberId = request.getParameter("rememberId");
			Cookie cookieRememberId = new Cookie("rememberId", "");
			Cookie cookieUserId = new Cookie("user_id", "");
			cookieRememberId.setPath(root);
			cookieUserId.setPath(root);
			
			
			System.out.println("rememberId : " + rememberId);
			
			// 아이디 저장 체크 시 - 값 : on
			if( rememberId != null && rememberId.equals("on") ) {
				// 쿠키 생성
				cookieRememberId.setValue( URLEncoder.encode(rememberId, "UTF-8") );
				cookieUserId.setValue( URLEncoder.encode(userId, "UTF-8") );
				// 쿠키 만료시간 설정 - 7일 (/초)
				cookieRememberId.setMaxAge(60*60*24*7); 
				cookieUserId.setMaxAge(60*60*24*7);
			}
			// 아이디 저장 체크 해제 시
			else {
				// 쿠키 삭제 - 쿠키 유효시간을 0으로 하고 응답
				cookieRememberId.setMaxAge(0);
				cookieUserId.setMaxAge(0);
			}
			// 응답에 쿠키 등록
			response.addCookie(cookieRememberId);
			response.addCookie(cookieUserId);
			// 아이디 저장 끝 ---------------------------------------------------
			
			// 로그인 성공
			// 세션에 사용자 정보 등록
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", user);
			session.setAttribute("loginId", user.getUserId());
			
			try {
				UserAuthDAO userAuthDAO = new UserAuthDAO();
				
				List<String> authList = userAuthDAO.selectAuthListByUserNo(user.getNo());
				session.setAttribute("authList", authList);
				
			} catch (Exception e) {
				throw new AppException(ErrorCode.AUTH_LOAD_AUTHORITIES_FAILED, e);
			}
		
			// 자동 로그인 ---------------------------------------------------
			String rememberMe = request.getParameter("rememberMe");
			Cookie cookieRememberMe = new Cookie("rememberMe", "");
			Cookie cookieToken = new Cookie("token", "");
			
			// 쿠키 설정
			cookieRememberMe.setPath(root);
			cookieToken.setPath(root);
			// 쿠키 만료시간 설정 - 7일 (/초)
			cookieRememberMe.setMaxAge(60*60*24*7); 
			cookieToken.setMaxAge(60*60*24*7);		
			// 자동 로그인 체크 여부 
			if( rememberMe != null && rememberMe.equals("on") ) {
				// 자동 로그인 체크 시
				// - 토큰 발행
				PersistenceLoginsService persistenceLoginsService = new PersistenceLoginsServiceImpl();
				PersistenceLogins persistenceLogins = persistenceLoginsService.refresh(userId);
				String token = null;
				if( persistenceLogins != null ) {
					token = persistenceLogins.getToken();
				}
				// - 쿠키 생성
				cookieRememberMe.setValue( URLEncoder.encode(rememberMe, "UTF-8") );
				cookieToken.setValue( URLEncoder.encode(token, "UTF-8") );
			} 
			else {
				// 자동 로그인 미체크 시
				// 쿠키 삭제
				cookieRememberMe.setMaxAge(0);
				cookieToken.setMaxAge(0);
			}
			response.addCookie(cookieRememberMe);
			response.addCookie(cookieToken);
			// 자동 로그인 끝 ---------------------------------------------------
			
			response.sendRedirect(root + "/");
			return;
		} catch (AppException e) {
			request.setAttribute("errorCode", e.getErrorCode().getCode());
			request.setAttribute("errorMessage", e.getErrorCode().getDefaultMessage());
			request.getRequestDispatcher("/page/login.jsp").forward(request, response);
			return;
		}
		
	}
	
}
