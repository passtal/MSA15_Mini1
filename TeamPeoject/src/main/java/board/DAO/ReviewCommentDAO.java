package board.DAO;

import java.util.ArrayList;
import java.util.List;

import com.alohaclass.jdbc.dao.BaseDAOImpl;
import board.DTO.ReviewComment;

public class ReviewCommentDAO extends BaseDAOImpl<ReviewComment> {

    public List<ReviewComment> list(int boardNo) {
        String sql = "SELECT c.*, u.username "
                   + "FROM review_comment c "
                   + "LEFT JOIN users u ON c.user_no = u.no "
                   + "WHERE c.board_no = ? "
                   + "ORDER BY c.no ASC";
        
        List<ReviewComment> list = new ArrayList<>();
        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, boardNo);
            rs = psmt.executeQuery();
            
            while(rs.next()) {
                ReviewComment comment = new ReviewComment();
                comment.setNo(rs.getInt("no"));
                comment.setBoard_no(rs.getInt("board_no"));
                comment.setUser_no(rs.getInt("user_no"));
                comment.setContent(rs.getString("content"));
                comment.setCreated_at(rs.getTimestamp("created_at"));
                comment.setUsername(rs.getString("username")); // 닉네임 담기
                list.add(comment);
            }
        } catch (Exception e) {
            System.err.println("댓글 목록 조회 실패");
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public int insert(ReviewComment comment) {
        String sql = "INSERT INTO review_comment (board_no, user_no, content) VALUES (?, ?, ?)";
        int result = 0;
        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, comment.getBoard_no());
            psmt.setInt(2, comment.getUser_no());
            psmt.setString(3, comment.getContent());
            result = psmt.executeUpdate();
        } catch (Exception e) {
            System.err.println("댓글 등록 실패");
            e.printStackTrace();
        }
        return result;
    }
}