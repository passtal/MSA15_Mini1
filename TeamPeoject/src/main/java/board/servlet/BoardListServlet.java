package board.servlet;

import java.io.IOException;
import java.util.List;

import board.DAO.BoardDAO;
import board.DTO.BoardDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/board/list")
public class BoardListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private BoardDAO boardDAO = new BoardDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        List<BoardDTO> boardList = boardDAO.listWithUser();

        if (boardList == null || boardList.isEmpty()) {
            System.out.println("=== [BoardListServlet] 게시글 목록이 비어있습니다 (0건) ===");
        } else {
            System.out.println("=== [BoardListServlet] 게시글 조회 성공! 개수: " + boardList.size() + " ===");
        }
        
        request.setAttribute("boardList", boardList);
        
        request.getRequestDispatcher("/page/shop/shop_list.jsp").forward(request, response);
    }
}