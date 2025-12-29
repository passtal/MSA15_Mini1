package board.servlet;

import java.io.IOException;
import java.util.List;

import board.DAO.BoardDAO;
import board.DAO.ReviewCommentDAO;
import board.DTO.BoardDTO;
import board.DTO.ReviewComment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/board/view")
public class BoardViewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private BoardDAO boardDAO = new BoardDAO();
    private ReviewCommentDAO commentDAO = new ReviewCommentDAO();

    @Override
    protected void doGet(
    		HttpServletRequest request, 
    		HttpServletResponse response
    		) throws ServletException, IOException {
        String noStr = request.getParameter("no");
        if (noStr == null || noStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/board/list");
            return;
        }

        int no = Integer.parseInt(noStr);

        BoardDTO board = boardDAO.selectWithUser(no);
        if (board == null) {
            response.sendRedirect(request.getContextPath() + "/board/list");
            return;
        }

        List<ReviewComment> commentList = commentDAO.list(no);

        request.setAttribute("board", board);
        request.setAttribute("commentList", commentList);
        
        request.getRequestDispatcher("/page/board/view.jsp").forward(request, response);
    }
}