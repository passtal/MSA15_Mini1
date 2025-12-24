package board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.mindrot.jbcrypt.BCrypt;

import board.DAO.UserAuthDAO;
import board.DAO.UserDAO;
import board.DTO.User;
import board.DTO.UserAuth;
import board.exception.AppException;
import board.exception.ErrorCode;

public class UserServiceImpl implements UserService {
	
	private UserDAO userDAO = new UserDAO();
	private UserAuthDAO userAuthDAO = new UserAuthDAO();

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

	@Override
	public User signupWithAuth(User user, String role) {
		
		if( user == null || role == null || role.isBlank() ) {
			return null;
		}
		
		role = role.trim().toUpperCase();
		
		String auth = null;
		switch (role) {
		case "ROLE_USER" : auth = role; break;
		case "ROLE_OWNER" : auth = role; break;
		case "USER": auth = "ROLE_USER"; break;
		case "OWNER": auth = "ROLE_OWNER"; break;
		default: return null;
		}
		
		try {
			
			// 비밀번호 암호화
			String password = user.getPassword();
			String encodedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
			user.setPassword(encodedPassword);
			
			int inserted = userDAO.insert(user);
			
			if( inserted <= 0 ) {
				return null;
			}
			
			Map<String, Object> map = new HashMap<>();
			map.put("user_id", user.getUserId());

			User signup = (User) userDAO.selectBy(map);

			if (signup == null) {
			    System.out.println("[signupWithAuth] selectBy(user_id) returned null: " + user.getUserId());
			    return null;
			}

			int userNo = signup.getNo();
			if (userNo <= 0) {
			    System.out.println("[signupWithAuth] invalid userNo after select: " + userNo);
			    return null;
			}

			
			UserAuth ua = new UserAuth();
			ua.setId(UUID.randomUUID().toString());
			ua.setUserNo(userNo);
			ua.setAuth(auth);
			
			int authInserted = userAuthDAO.insert(ua);
			System.out.println("[signupWithAuth] inserted(users) = " + inserted);
			System.out.println("[signupWithAuth] userNo = " + userNo);
			System.out.println("[signupWithAuth] auth = " + auth);
			System.out.println("[signupWithAuth] authInserted(user_auth) = " + authInserted);

			if( authInserted <= 0 ) {
				System.out.println(userNo);
				System.out.println(auth);
				return null;
			}
			
		} catch (Exception e) {
			System.out.println("[signupWithAuth] exception on user_auth insert");
			e.printStackTrace();
			return null;
		}
		
		return user;
		
	}

	@Override
	public User selectByNo(int userNo) {
		
		if( userNo <= 0 ) {
			throw new AppException(ErrorCode.COMMON_BAD_REQUEST);
		}
		
		try {
			User user = userDAO.select(userNo);
			return user;
			
		} catch (Exception e) {
			throw new AppException(ErrorCode.COMMON_INTERNAL_ERROR, e);
		}
		
	}

	@Override
	public User updateMyPage(User user) {
		
		if( user == null || user.getNo() <= 0 ) {
			throw new AppException(ErrorCode.COMMON_BAD_REQUEST);
		}
		
		List<String> updateList = new ArrayList<>();
		
		String username = user.getUsername();
		int age = user.getAge();
		String sex = user.getSex();
		String profileImg = user.getProfileImg();
		
		try {
	        if (username != null && !username.isBlank()) {
	            if (username.length() > 20) {
	                throw new AppException(ErrorCode.COMMON_BAD_REQUEST);
	            }
	            
				Map<String, Object> map = new LinkedHashMap<>();
				map.put("username", username);
				
				User updateUser = userDAO.selectBy(map);
				
				// 닉네임 중복X
				if( updateUser != null && updateUser.getNo() != user.getNo() ) {
					throw new AppException(ErrorCode.USER_USERNAME_DUPLICATE);
				}
				updateList.add("username");
	        }
			
			if( age > 0 ) {
				
				if( age >= 120 ) {
					throw new AppException(ErrorCode.COMMON_BAD_REQUEST);
				}
				
				
				updateList.add("age");
			} 
			
			if( sex != null && !sex.isBlank() ) {
				
				if( !sex.equals("male")  && !sex.equals("female") && !sex.equals("undisclosed")) {
					throw new AppException(ErrorCode.COMMON_BAD_REQUEST);
				}
				
				updateList.add("sex");
				
			} 
			
			if( profileImg != null && !profileImg.isBlank() ) {
				
				updateList.add("profileImg");
				
			}
			
			if (updateList.isEmpty()) {
	            return user;
	        }
			
			String[] update = updateList.toArray(new String[0]);
			userDAO.update(user, update);
			
			return user;
			
		} catch(AppException e) {
			throw e;
		} catch (Exception e) {
			throw new AppException(ErrorCode.COMMON_INTERNAL_ERROR, e);
		}
		
	}

	@Override
	public boolean changePassword(int userNo, String oldPassword, String newPassword) {
		
		boolean passwordCheck = oldPassword == null || oldPassword.isBlank() || newPassword == null || newPassword.isBlank();
		
		if( userNo <= 0 || passwordCheck ) {
			throw new AppException(ErrorCode.COMMON_BAD_REQUEST);
		}
		
		Map<String, Object> map = new LinkedHashMap<>();
		map.put("no", userNo);
		
		User updateUser = null;
		
		try {
			updateUser = userDAO.selectBy(map);
			
			if(updateUser == null) {
				throw new AppException(ErrorCode.COMMON_BAD_REQUEST);
			}
			
		} catch ( AppException e) {
			throw e;
		} catch (Exception e) {
			throw new AppException(ErrorCode.COMMON_INTERNAL_ERROR, e);
		}
		
		String password = updateUser.getPassword();
		if ( BCrypt.checkpw(oldPassword, password) == false ) {
			throw new AppException(ErrorCode.COMMON_BAD_REQUEST);
		}
		
		// 비밀번호 유효성 검사
		boolean check = newPassword.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$");
		if (!check) {
			throw new AppException(ErrorCode.COMMON_BAD_REQUEST);
		}

	    String hashed = BCrypt.hashpw(newPassword, BCrypt.gensalt());
	    updateUser.setPassword(hashed);
		
	    try {
	        int updated = userDAO.update(updateUser, "password");
	        if (updated <= 0) {
	            throw new AppException(ErrorCode.COMMON_INTERNAL_ERROR);
	        }
	    } catch (AppException e) {
	        throw e;
	    } catch (Exception e) {
	        throw new AppException(ErrorCode.COMMON_INTERNAL_ERROR, e);
	    }

	    return true;
	}

	@Override
	public User loginOrThrow(String userId, String password) {
		
		if( userId == null || userId.isBlank() || password == null || password.isBlank() ) {
			throw new AppException(ErrorCode.AUTH_REQUIRED_FIELDS);
		}
		
		Map<String, Object> map = new LinkedHashMap<>();
		map.put("user_id", userId);
		
		User signupUser = null;
		
		try {
			signupUser = (User) userDAO.selectBy(map);
		} catch (Exception e) {
			throw new AppException(ErrorCode.COMMON_INTERNAL_ERROR, e);
		}
		
		// 아이디 존재 여부 확인
		if( signupUser == null ) {
			throw new AppException(ErrorCode.AUTH_INVALID_CREDENTIALS);
		}
		
		// 비밀번호 일치 여부 확인
		String signupPassword = signupUser.getPassword();
		boolean result = BCrypt.checkpw(password, signupPassword);
		
		if( result == false) {
			throw new AppException(ErrorCode.AUTH_INVALID_CREDENTIALS);
		}
		
		signupUser.setPassword(null);
		
		return signupUser;
		
	}

	@Override
	public List<String> loadAuthListOrThrow(int userNo) {
		
		if( userNo <= 0 ) {
			throw new AppException(ErrorCode.COMMON_BAD_REQUEST);
		}
		
		try {
			List<String> authList = userAuthDAO.selectAuthListByUserNo(userNo);
			return authList;
		} catch (Exception e) {
			throw new AppException(ErrorCode.AUTH_LOAD_AUTHORITIES_FAILED, e);
		}
		
	}

}
