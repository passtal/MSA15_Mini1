package board.servlet;

import java.io.IOException;
import java.util.UUID;

import board.DAO.ReviewCommentDAO;
import board.DTO.ReviewCommentDTO;
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
	protected void doGet(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws ServletException, IOException {
	}

	@Override
	protected void doPost(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        
        ReviewCommentDTO comment = new ReviewCommentDTO();
        int board_no = 1;
        
        comment.setId(UUID.randomUUID().toString());
		comment.setBoard_no(board_no);
        comment.setContent(request.getParameter("content"));
        comment.setUser_no(loginUser.getNo());
        
        try {
			commentDAO.insert(comment);
		} catch (Exception e) {
			e.printStackTrace();
		}
        response.sendRedirect(request.getContextPath() + "/board/view?no=" + board_no);
	}
	
}
