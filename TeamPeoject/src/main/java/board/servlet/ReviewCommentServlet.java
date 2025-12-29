package board.servlet;

import java.io.IOException;
import board.DAO.ReviewCommentDAO;
import board.DTO.ReviewComment;
import board.DTO.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/board/comment")
public class ReviewCommentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private ReviewCommentDAO commentDAO = new ReviewCommentDAO();

    @Override
    protected void doPost(
    		HttpServletRequest request, 
    		HttpServletResponse response
    		) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        
        if (loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/page/login.jsp");
            return;
        }
        
        try {
            int boardNo = Integer.parseInt(request.getParameter("board_no"));
            String content = request.getParameter("content");

            ReviewComment comment = new ReviewComment();
            comment.setBoard_no(boardNo);
            comment.setContent(content);
            comment.setUser_no(loginUser.getNo());
            
            commentDAO.insert(comment);
            
            response.sendRedirect(request.getContextPath() + "/board/view?no=" + boardNo);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}