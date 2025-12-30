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

@WebServlet("/board/write")
public class BoardWriteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BoardDAO boardDAO = new BoardDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("loginUser") == null) {
            response.sendRedirect(request.getContextPath() + "/page/login.jsp");
            return;
        }
        request.getRequestDispatcher("/page/board/write.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        if(loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/page/login.jsp");
            return;
        }

        try {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String ratingStr = request.getParameter("rating");
            String placeNoStr = request.getParameter("place_no");
            
            
            BoardDTO board = new BoardDTO();
            board.setTitle(title);
            board.setContent(content);
            board.setUser_no(loginUser.getNo()); 
            
            if (placeNoStr != null && !placeNoStr.isEmpty()) {
            	board.setPlace_no(Integer.parseInt(placeNoStr));
            }
            
            if(ratingStr != null && !ratingStr.isEmpty()) {
                board.setRating((int) Double.parseDouble(ratingStr));
            } else {
                board.setRating(0.0);
            }
            
            int result = boardDAO.insert(board);
            
            if(result > 0) {
                System.out.println("글쓰기 성공!");
                response.setContentType("text/html; charset=UTF-8");
                response.getWriter().println(
                    "<script>" +
            		"alert('리뷰가 등록되었습니다');" +
                    "parent.location.href='" + request.getContextPath() + "/place/view?no=" + placeNoStr + "';" +
                    "</script>"
                );

            } else {
                System.out.println("글쓰기 실패 ㅠㅠ");
                response.sendRedirect(request.getContextPath() + "/board/write?error=fail");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}