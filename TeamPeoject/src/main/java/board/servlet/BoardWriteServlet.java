package board.servlet;

import java.io.IOException;
import java.util.UUID;

import board.DAO.BoardDAO;
import board.DAO.BoardImageDAO;
import board.DTO.BoardDTO;
import board.DTO.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@MultipartConfig
@WebServlet("/board/write")
public class BoardWriteServlet extends HttpServlet {
	
	private BoardDAO boardDAO = new BoardDAO();
	private BoardImageDAO imageDAO = new BoardImageDAO();
	
    protected void doGet(
    		HttpServletRequest request, 
    		HttpServletResponse response
    		) throws ServletException, IOException {
        request.getRequestDispatcher("/page/board/write.jsp").forward(request, response);
    }

    protected void doPost(
    		HttpServletRequest request, 
    		HttpServletResponse response
    		) throws ServletException, IOException {
    	
        request.setCharacterEncoding("UTF-8");

        BoardDTO board = new BoardDTO();
        
        board.setId(UUID.randomUUID().toString());
        board.setTitle(request.getParameter("title"));
        board.setContent(request.getParameter("content"));
        board.setRating(Double.parseDouble(request.getParameter("rating")));
        
        board.setGroup_no(1);
        
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        if (loginUser != null) {
			board.setUser_no(loginUser.getNo());
		} else {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
			return;
		}

        try {
			boardDAO.insert(board);
		} catch (Exception e) {
			e.printStackTrace();
		}

        response.sendRedirect(request.getContextPath() + "/board/list");
    }
}