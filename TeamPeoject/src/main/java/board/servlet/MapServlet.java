package board.servlet;

import java.io.IOException;
import java.util.List;

import board.DAO.PlaceDAO;
import board.DTO.Place;
import board.DTO.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/page/map")
public class MapServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PlaceDAO placeDAO = new PlaceDAO();

    // 지도 화면 보여주기
    protected void doGet(
    		HttpServletRequest request, 
    		HttpServletResponse response
    		) throws ServletException, IOException {
        // DB에서 목록 가져오기
        List<Place> placeList = placeDAO.selectList();
        request.setAttribute("placeList", placeList);
        
        request.getRequestDispatcher("/page/map.jsp").forward(request, response);
    }

    // 맛집 저장하기
    protected void doPost(
    		HttpServletRequest request, 
    		HttpServletResponse response
    		) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");

        if(role == null || "ROLE_USER".equals(role)) {
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().write("<script>alert('가게 사장님만 등록할 수 있습니다.'); location.href='" + request.getContextPath() + "/page/map';</script>");
            return;
       }

        try {
        	User loginUser = (User) session.getAttribute("loginUser");
            Place place = Place.builder()
                    .user_no(loginUser.getNo())
                    .placename(request.getParameter("placename"))
                    .address(request.getParameter("address"))
                    .phone(request.getParameter("phone"))
                    .content(request.getParameter("content"))
                    .lat(Double.parseDouble(request.getParameter("lat")))
                    .lng(Double.parseDouble(request.getParameter("lng")))
                    .region("인천")
                    .amenities("주차 2시간 무료")
                    .thumbnail_img("/static/img/bupyeong.png")
                    .build();

            placeDAO.insert(place);
            
            // 저장 후 다시 /page/map 주소로 이동
            response.sendRedirect(request.getContextPath() + "/page/map");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/page/map");
        }
    }
}