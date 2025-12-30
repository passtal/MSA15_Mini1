package board.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import board.DAO.PlaceDAO;
import board.DTO.Place;

@WebServlet("/shop/list")
public class ShopListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PlaceDAO placeDAO = new PlaceDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Place> placeList = placeDAO.selectList();
        request.setAttribute("placeList", placeList);

        request.getRequestDispatcher("/page/shop/shop_list.jsp")
               .forward(request, response);
    }
}

