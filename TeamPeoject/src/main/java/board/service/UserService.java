package board.service;

import board.DTO.User;

public interface UserService {
	// 회원가입
	public int signup(User user);
	
	// 아이디 중복 체크
	public boolean idCheck(String userId);
	
	// 닉네임 중복 체크
	public boolean userNameCheck(String userName);
	
	// 로그인
	public boolean login(User user);
	
	// 아이디로 회원 조회
	public User selectByUserId(String userId);
	
	// 권한 부여
	public User signupWithAuth(User user, String role);

}
