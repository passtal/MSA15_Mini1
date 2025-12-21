package board.service;

import java.util.HashMap;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;

import board.DAO.UserDAO;
import board.DTO.User;

public class UserServiceImpl implements UserService {
	
	private UserDAO userDAO = new UserDAO();

	@Override
	public int signup(User user) {
		try {
			// 비밀번호 암호화
			String password = user.getPassword();
			String encodedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
			user.setPassword(encodedPassword);
			
			// 회원등록
			int result = userDAO.insert(user);
			
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public boolean idCheck(String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", userId);
		
		Object user = null;
		try {
			user = userDAO.selectBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 아이디 중복X
		if( user == null ) {
			return false;
		}
		return true;
	}

	@Override
	public boolean userNameCheck(String userName) {
		Map<String, Object> map = new HashMap<>();
		map.put("username", userName);
		
		Object user = null;
		try {
			user = userDAO.selectBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 닉네임 중복X
		if( user == null ) {
			return false;
		}
		return true;
	}
	
	@Override
	public boolean login(User user) {
		String userId = user.getUserId();
		String password = user.getPassword();
		
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", userId);
		
		User joinedUser = null;
		try {
			joinedUser = userDAO.selectBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 아이디가 존재 하지 않는 경우
		if( joinedUser == null ) 
			return false;
		// 비밀번호 일치 여부 확인
		String joinedPasswword = joinedUser.getPassword();
		boolean result = BCrypt.checkpw(password, joinedPasswword);
		return result;
	}

	@Override
	public User selectByUserId(String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", userId);
		User user = null;
		try {
			user = userDAO.selectBy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

}
