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
		BoardDTO board = null;
		board.setNo(Integer.parseInt(request.getParameter("no")));
		board.setContent(request.getParameter("content"));
		board.setRating(Double.parseDouble(request.getParameter("rating")));
		
		try {
			boardDAO.update(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect(request.getContextPath() + "/board/list");
	}

}
