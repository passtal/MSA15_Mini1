package board.servlet;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import board.DAO.BoardDAO;
import board.DAO.ReviewCommentDAO;
import board.DTO.BoardDTO;
import board.DTO.ReviewCommentDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/board")
public class BoardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private BoardDAO boardDAO = new BoardDAO();
    private ReviewCommentDAO commentDAO = new ReviewCommentDAO();

    @Override
    protected void doGet(
    		HttpServletRequest request, 
    		HttpServletResponse response
    		) throws ServletException, IOException {

        String action = request.getParameter("action");

        // 이 밑 부분으로는 기능 관련하여 메모 적어둡니다! 혹시라도 제가 잘못체크하거나 이상한 부분이 있다면 말씀해주세요! (by최영우)
        try {

        	// 글쓰기 화면으로 이동
            if ("write".equals(action)) {
                request.getRequestDispatcher("/page/board/write.jsp").forward(request, response);

            } else if ("view".equals(action)) {
                // [상세보기] + [댓글목록]
                int no = Integer.parseInt(request.getParameter("no"));
                BoardDTO board = boardDAO.select(no); // 게시글 조회 기능

                // 댓글 조회 (board_no가 일치하는 것만 조회하도록 하기 .. 사실 이 부분은 수정을 좀 해야할 듯 합니다)
                ReviewCommentDTO criteria = new ReviewCommentDTO();
                criteria.setBoard_no(no);
                List<ReviewCommentDTO> commentList = commentDAO.list();

                request.setAttribute("board", board);
                request.setAttribute("commentList", commentList);
                request.getRequestDispatcher("/page/board/view.jsp").forward(request, response);

            } else if ("edit".equals(action)) {
                // [수정 화면] 이동 (기존 데이터 채워서)
                int no = Integer.parseInt(request.getParameter("no"));
                BoardDTO board = boardDAO.select(no);
                request.setAttribute("board", board);
                request.getRequestDispatcher("/page/board/edit.jsp").forward(request, response);

            } else {
                // [목록 보기] (기본 .. 이건 나중에 index.jsp 까지 나와서 한번에 합치는 식으로 해야할 듯 합니다)
            	// 음.. 아무래도 일단 login.jsp 와 join.jsp 를 받고 index.jsp까지 한번에 진행하는것이 좋겠다 싶어서 했는데 
            	// 혹시 먼저 index.jsp 를 만들고 반영하셨다면 그거에 맞춰서 수정해서 올리겠습니다!!
                List<BoardDTO> boardList = boardDAO.list();
                request.setAttribute("boardList", boardList);
                request.getRequestDispatcher("/page/board/list.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500, "서버 오류 발생");
        }
    }

    @Override
    protected void doPost(
    		HttpServletRequest request, 
    		HttpServletResponse response
    		) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action"); // hidden으로 넘겨받은 동작 구분값

        try {
            if ("insert".equals(action)) {
                // [글 등록]
                BoardDTO board = new BoardDTO();
                board.setId(UUID.randomUUID().toString());
                board.setTitle(request.getParameter("title"));
                board.setContent(request.getParameter("content"));
                board.setRating(Double.parseDouble(request.getParameter("rating")));

                board.setUser_no(1);   // 임시 사용자 번호 (일단은..) - 이거 로그인/회원가입(login.jsp, join.jsp) 되면 수정할게요 (by최영우)
                board.setGroup_no(1);  // 이것도 임시로 일단

                // 밑에 임시 코드 붙여넣습니다! 확인해보시고 connecting error 가 발생한다면 수정하거나 저에게 말씀해주세요! (by최영우)

                /* 
                   HttpSession session = request.getSession();
                   UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
                   if (loginUser != null) {
                	    board.setUser_no(loginUser.getNo());
                	} else {
                	    response.sendRedirect(request.getContextPath() + "/login.jsp");
                	    return;
                	}
                 */

                boardDAO.insert(board);
                response.sendRedirect("board"); 

            } else if ("update".equals(action)) {
                // [글 수정]
                BoardDTO board = new BoardDTO();
                board.setNo(Integer.parseInt(request.getParameter("no"))); // 수정할 글 번호
                board.setTitle(request.getParameter("title"));
                board.setContent(request.getParameter("content"));
                board.setRating(Double.parseDouble(request.getParameter("rating")));

                boardDAO.update(board);
                response.sendRedirect("board?action=view&no=" + board.getNo()); // 수정 후 상세페이지로

            } else if ("delete".equals(action)) {
                // [글 삭제]
                int no = Integer.parseInt(request.getParameter("no"));
                boardDAO.delete(no);
                response.sendRedirect("board");

            } else if ("commentInsert".equals(action)) {
                // [댓글 등록]
                ReviewCommentDTO comment = new ReviewCommentDTO();

                // 이 부분 너무 헷갈려서 전에 강사님과 실습했던 코드 유사하게 베낀건데.. 혹시라도 문제 있으면 말씀해주세요 수정하겠습니다! (by최영우)
                comment.setId(UUID.randomUUID().toString());
                comment.setBoard_no(Integer.parseInt(request.getParameter("board_no")));
                comment.setContent(request.getParameter("content"));

                // 추후 로그인 연동 시 수정하겠습니다 .. 이것도 위에 거와 유사하게 돌리면 될 것 같습니다!
                comment.setUser_no(1); 

                commentDAO.insert(comment);
                // 댓글 작성 후 다시 해당 글의 상세페이지로 돌아가기
                response.sendRedirect("board?action=view&no=" + comment.getBoard_no());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}