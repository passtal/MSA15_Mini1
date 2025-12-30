package board.servlet;

import java.io.IOException;
import java.util.List;

import board.DAO.BoardDAO;
import board.DAO.PlaceDAO;
import board.DTO.BoardDTO;
import board.DTO.Place;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/main")
public class MainServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private PlaceDAO placeDAO = new PlaceDAO();
    private BoardDAO boardDAO = new BoardDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1) 신규 맛집: place 최신순
        List<Place> placeList = placeDAO.selectList(); // 현재 프로젝트에 이미 있음

        // 2) 리얼 리뷰: board 최신순(유저 조인)
        List<BoardDTO> reviewList = boardDAO.listWithUser(); // 이미 있음

        request.setAttribute("placeList", placeList);
        request.setAttribute("reviewList", reviewList);
        

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
