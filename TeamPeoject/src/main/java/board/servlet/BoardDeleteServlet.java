package board.servlet;

import java.io.IOException;
import board.DAO.BoardDAO;
import board.DTO.BoardDTO;
import board.DTO.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/board/delete")
public class BoardDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BoardDAO boardDAO = new BoardDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        String noStr = request.getParameter("no");

        if(loginUser == null || noStr == null) {
            response.sendRedirect(request.getContextPath() + "/page/login.jsp");
            return;
        }

        int no = Integer.parseInt(noStr);

        BoardDTO board = boardDAO.selectWithUser(no);
        if(board != null && board.getUser_no() == loginUser.getNo()) {
            
            try {
				boardDAO.delete(no);
			} catch (Exception e) {
				e.printStackTrace();
			}
            response.sendRedirect(request.getContextPath() + "/board/list");
            
        } else {
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().write("<script>alert('삭제 권한이 없습니다.'); history.back();</script>");
        }
    }
}