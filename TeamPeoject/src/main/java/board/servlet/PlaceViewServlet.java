package board.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import board.DAO.BoardDAO;
import board.DAO.MenuDAO;
import board.DAO.PlaceDAO;
import board.DTO.BoardDTO;
import board.DTO.Menu;
import board.DTO.Place;

@WebServlet("/place/view")
public class PlaceViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PlaceDAO placeDAO = new PlaceDAO();
	private MenuDAO menuDAO = new MenuDAO();
	private BoardDAO boardDAO = new BoardDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noStr = request.getParameter("no");
		
		if (noStr == null || noStr.isBlank()) {
		  response.sendRedirect(request.getContextPath() + "/main?error=true");
		  return;
		}
		
		int no = Integer.parseInt(noStr);
	
		try {
			Place place = placeDAO.select(no);

			if(place == null) {
				response.sendRedirect(request.getContextPath() + "/main?error=true");
				return;
			}
			
			int placeNo = place.getNo();
	
			Map<String, Object> placeMap = new LinkedHashMap<>();
			placeMap.put("place_no", placeNo);
			List<Menu> menuList = menuDAO.listBy(placeMap);
			
			Map<String, Object> boardMap = new LinkedHashMap<>();
			boardMap.put("place_no", placeNo);
			List<BoardDTO> reviewList = boardDAO.listWithUser(boardMap);
			
			int reviewTotal = reviewList.size();

			int star1 = 0;
			int star2 = 0;
			int star3 = 0;
			int star4 = 0;
			int star5 = 0;

			int sum = 0;

			for (BoardDTO r : reviewList) {
			    int rating = (int) r.getRating();
			    sum += rating;

			    switch (rating) {
				case 1: star1++; break;
				case 2: star2++; break;
				case 3: star3++; break;
				case 4: star4++; break;
				case 5: star5++; break;
				} 
			}

			double reviewAvg = (reviewTotal == 0) ? 0.0 : (double) sum / reviewTotal;
			double reviewAvgPer = reviewAvg * 20;
			double star1Per = (reviewTotal == 0) ? 0 : (star1 * 100.0 / reviewTotal);
			double star2Per = (reviewTotal == 0) ? 0 : (star2 * 100.0 / reviewTotal);
			double star3Per = (reviewTotal == 0) ? 0 : (star3 * 100.0 / reviewTotal);
			double star4Per = (reviewTotal == 0) ? 0 : (star4 * 100.0 / reviewTotal);
			double star5Per = (reviewTotal == 0) ? 0 : (star5 * 100.0 / reviewTotal);


			request.setAttribute("place", place);
			request.setAttribute("menuList", menuList);
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("reviewTotal", reviewTotal);
			request.setAttribute("reviewAvg", reviewAvg);
			request.setAttribute("reviewAvgPer", reviewAvgPer);
			request.setAttribute("star1", star1);
			request.setAttribute("star2", star2);
			request.setAttribute("star3", star3);
			request.setAttribute("star4", star4);
			request.setAttribute("star5", star5);
			request.setAttribute("star1Per", star1Per);
			request.setAttribute("star2Per", star2Per);
			request.setAttribute("star3Per", star3Per);
			request.setAttribute("star4Per", star4Per);
			request.setAttribute("star5Per", star5Per);

			request.getRequestDispatcher("/page/shop/shop_view.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/main?error=true");
	    }
	  }
}
