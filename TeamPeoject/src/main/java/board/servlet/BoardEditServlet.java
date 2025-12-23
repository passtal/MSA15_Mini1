package board.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import board.DAO.BoardDAO;
import board.DTO.BoardDTO;


@WebServlet("/board/edit")
public class BoardEditServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private BoardDAO boardDAO = new BoardDAO();
	
	@Override
	protected void doGet(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		BoardDTO board = null;
		try {
			board = boardDAO.select(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("board", board);
		request.getRequestDispatcher("/page/board/edit.jsp").forward(request, response);
	}

	@Override
	protected void doPost(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		BoardDTO board = new BoardDTO();
		
		try {
			int no = Integer.parseInt(request.getParameter("no"));
			int userNo = Integer.parseInt(request.getParameter("user_no"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			double rating = Double.parseDouble(request.getParameter("rating"));
			
			board.setNo(no);
			board.setUser_no(userNo);
			board.setGroup_no(1);
			board.setTitle(title);
			board.setContent(content);
			board.setRating(rating);
			
			boardDAO.update(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect(request.getContextPath() + "/board/list");
	}

}