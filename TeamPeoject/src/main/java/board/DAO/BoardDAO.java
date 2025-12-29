package board.DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.alohaclass.jdbc.dao.BaseDAOImpl;
import board.DTO.BoardDTO;

public class BoardDAO extends BaseDAOImpl<BoardDTO> {

    public List<BoardDTO> listWithUser() {
        String sql = "SELECT b.*, u.username "
                   + "FROM board b LEFT JOIN users u ON b.user_no = u.no "
                   + "ORDER BY b.no DESC";
        
        List<BoardDTO> list = new ArrayList<>();
        
        try {
            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();
            
            while(rs.next()) {
                BoardDTO board = new BoardDTO();
                board.setNo(rs.getInt("no"));
                board.setTitle(rs.getString("title"));
                board.setRating(rs.getDouble("rating"));
                board.setUser_no(rs.getInt("user_no"));
                board.setGroup_no(rs.getInt("group_no"));
                board.setCreated_at(rs.getTimestamp("created_at"));
                board.setUpdated_at(rs.getTimestamp("updated_at"));
                
                board.setUsername(rs.getString("username")); 
                
                list.add(board);
            }
        } catch (Exception e) {
            System.err.println("BoardDAO : listWithUser 에러");
            e.printStackTrace();
        }
        return list;
    }

    public BoardDTO selectWithUser(int no) {
        String sql = "SELECT b.*, u.username "
                   + "FROM board b LEFT JOIN users u ON b.user_no = u.no "
                   + "WHERE b.no = ?";
        
        BoardDTO board = null;
        
        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, no);
            rs = psmt.executeQuery();
            
            if(rs.next()) {
                board = new BoardDTO();
                board.setNo(rs.getInt("no"));
                board.setTitle(rs.getString("title"));
                board.setContent(rs.getString("content"));
                board.setRating(rs.getDouble("rating"));
                board.setUser_no(rs.getInt("user_no"));
                board.setGroup_no(rs.getInt("group_no"));
                board.setCreated_at(rs.getTimestamp("created_at"));
                board.setUpdated_at(rs.getTimestamp("updated_at"));
                
                board.setUsername(rs.getString("username"));
            }
        } catch (Exception e) {
             System.err.println("BoardDAO : selectWithUser 에러");
             e.printStackTrace();
        }
        return board;
    }

    public BoardDTO selectForEdit(int no, int userNo) {
        String sql = "SELECT * FROM board WHERE no = ? AND user_no = ?";
        
        BoardDTO board = null;
        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, no);
            psmt.setInt(2, userNo);
            rs = psmt.executeQuery();
            
            if(rs.next()) {
                board = new BoardDTO();
                board.setNo(rs.getInt("no"));
                board.setTitle(rs.getString("title"));
                board.setContent(rs.getString("content"));
                board.setUser_no(rs.getInt("user_no"));
            }
        } catch (Exception e) {
            System.err.println("BoardDAO : selectForEdit 에러");
            e.printStackTrace();
        }
        return board;
    }
    
    @Override
    public int update(BoardDTO board) {
        String sql = "UPDATE board "
                   + "SET title = ?, content = ?, rating = ?, updated_at = NOW() "
                   + "WHERE no = ?";
        
        int result = 0;
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, board.getTitle());
            psmt.setString(2, board.getContent());
            psmt.setDouble(3, board.getRating());
            psmt.setInt(4, board.getNo());
            
            result = psmt.executeUpdate();
            
        } catch (Exception e) {
            System.err.println("BoardDAO : update 에러 발생");
            e.printStackTrace();
        }
        return result;
    }
    
    
}