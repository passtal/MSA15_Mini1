package board.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import board.DAO.MenuDAO;
import board.DTO.Menu;
import board.DTO.User;

@WebServlet("/menu/write")
public class MenuWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MenuDAO menuDAO = new MenuDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginUser");
		List<String> authList = (List<String>) session.getAttribute("authList");
		String placeNoStr = request.getParameter("place_no");
		String root = request.getContextPath();
		
		if (placeNoStr == null || placeNoStr.isBlank()) {
		    response.sendRedirect(root + "/main");
		    return;
		}


		boolean isOwnerOrAdmin = authList != null &&
		    (authList.contains("ROLE_OWNER") || authList.contains("ROLE_ADMIN"));

		if (loginUser == null || !isOwnerOrAdmin) {
		    response.sendRedirect(root + "/main");
		    return;
		}

		request.setAttribute("place_no", placeNoStr);
		
		request.getRequestDispatcher("/page/menu/write.jsp")
			   .forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String placeNoStr = request.getParameter("place_no");
		String menuname = request.getParameter("menuname");
		String content = request.getParameter("content");
		String price = request.getParameter("price");
		String root = request.getContextPath();
		
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginUser");
		List<String> authList = (List<String>) session.getAttribute("authList");

		boolean isOwnerOrAdmin = authList != null &&
		    (authList.contains("ROLE_OWNER") || authList.contains("ROLE_ADMIN"));

		boolean placeT = placeNoStr == null || placeNoStr.isBlank();
		boolean menuT = menuname == null || menuname.isBlank();
		boolean priceT = price == null || price.isBlank();
		
		if (placeT || menuT || priceT) {
		    response.sendRedirect(root + "/main");
		    return;
		}
		
		if (loginUser == null || !isOwnerOrAdmin) {
		    response.sendRedirect(root + "/main");
		    return;
		}
		
		int priceInt = Integer.parseInt(price);
		
		Menu menu = new Menu();
		menu.setPlace_no(Integer.parseInt(placeNoStr));
		menu.setMenuname(menuname);
		menu.setContent(content);
		menu.setPrice(priceInt);

		try {
			menuDAO.insert(menu);
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.getWriter().println(
		    "<script>" +
		    "alert('메뉴가 추가되었습니다.');" +
		    "parent.location.href='" + root + "/place/view?no=" + placeNoStr + "';" +
		    "</script>"
		);

	}

}
