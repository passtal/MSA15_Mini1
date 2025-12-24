package board.servlet;

import java.io.IOException;
import java.util.List;

import board.DAO.BoardDAO;
import board.DTO.BoardDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/board/list")
public class BoardListServlet extends HttpServlet {
    private BoardDAO boardDAO = new BoardDAO();

    protected void doGet(
    		HttpServletRequest request, 
    		HttpServletResponse response
    		) throws ServletException, IOException {
        
    	List<BoardDTO> boardList = null;
		try {
			boardList = boardDAO.list();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
        request.setAttribute("boardList", boardList);
        
        request.getRequestDispatcher("/page/board/list.jsp").forward(request, response);
    }
}
