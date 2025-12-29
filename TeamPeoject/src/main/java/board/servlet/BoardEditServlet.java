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

@WebServlet("/board/edit")
public class BoardEditServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    private BoardDAO boardDAO = new BoardDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String noStr = request.getParameter("no");
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        if (noStr == null || loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/page/login.jsp");
            return;
        }

        int no = Integer.parseInt(noStr);
        
        BoardDTO board = boardDAO.selectForEdit(no, loginUser.getNo());

        if (board == null) {
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().write("<script>alert('수정 권한이 없거나 존재하지 않는 게시글입니다.'); location.href='" + request.getContextPath() + "/board/list';</script>");
            return;
        }

        request.setAttribute("board", board);
        request.getRequestDispatcher("/page/board/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        if(loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/page/login.jsp");
            return;
        }

        BoardDTO board = new BoardDTO();
        
        try {
            int no = Integer.parseInt(request.getParameter("no"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            double rating = Double.parseDouble(request.getParameter("rating"));
            
            board.setNo(no);
            board.setUser_no(loginUser.getNo());
            board.setTitle(title);
            board.setContent(content);
            board.setRating(rating);
            
            int result = boardDAO.update(board);
            
            if(result > 0) {
                response.sendRedirect(request.getContextPath() + "/board/list");
            } else {
                response.sendRedirect(request.getContextPath() + "/board/edit?no=" + no + "&error=fail");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}