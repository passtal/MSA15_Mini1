package board.servlet;

import java.io.IOException;
import board.DAO.PlaceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/place/delete")
public class PlaceDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PlaceDAO placeDAO = new PlaceDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String role = (String) session.getAttribute("role");

        // role이 'ROLE_ADMIN' 인지 확인
        boolean isAdmin = "ROLE_ADMIN".equals(role); 

        // 관리자가 아니면 차단
        if (!isAdmin) {
            response.setContentType("text/html; charset=UTF-8");
            response.setCharacterEncoding("UTF-8"); 
            response.getWriter().write("<script>alert('관리자만 삭제할 수 있습니다.'); history.back();</script>");
            return;
        }

        try {
            // no 파라미터 받기 (숫자 변환)
            String noStr = request.getParameter("no");
            int no = Integer.parseInt(noStr);
            
            int result = placeDAO.delete(no);

            if (result > 0) {
                // 성공 시 지도로 복귀
                response.sendRedirect(request.getContextPath() + "/page/map");
            } else {
                response.setContentType("text/html; charset=UTF-8");
                response.getWriter().write("<script>alert('삭제 실패 (DB 오류)'); history.back();</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().write("<script>alert('삭제 처리 중 에러 발생'); history.back();</script>");
        }
    }
}