package board.DAO;

import com.alohaclass.jdbc.dao.BaseDAOImpl;
import board.DTO.User;

public class UserDAO extends BaseDAOImpl<User> {
	
	public User login(String userId, String password) {
		
        // users 테이블과 user_auth 테이블을 조인하지 않고, 일단 User 정보만 가져옴
        String sql = "SELECT * FROM users WHERE user_id = ? AND password = ?";
        
        User user = null;
        
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, userId);
            psmt.setString(2, password);
            
            rs = psmt.executeQuery();
            
            if (rs.next()) {
                user = new User();
                user.setNo(rs.getInt("no"));
                user.setId(rs.getString("id"));         // UUID
                user.setUserId(rs.getString("user_id")); // 아이디
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
	
    // 회원 번호로 권한(Role) 가져오기 (loginUser 사용안함)
    public String getAuth(int userNo) {
        String sql = "SELECT auth FROM user_auth WHERE user_no = ?";
        String auth = "ROLE_USER"; // 권한이 없으면 기본값은 일반 유저
        
        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, userNo);
            rs = psmt.executeQuery();
            
            if(rs.next()) {
                auth = rs.getString("auth");
            }
        } catch (Exception e) {
            System.err.println("권한 조회 중 에러");
            e.printStackTrace();
        }
        return auth;
    }
}