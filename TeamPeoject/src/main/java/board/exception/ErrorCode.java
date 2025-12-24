package board.exception;

public enum ErrorCode {
	
	// 아이디 또는 비밀번호 누락
	AUTH_REQUIRED_FIELDS("AUTH_REQUIRED_FIELDS", "아이디와 비밀번호를 입력해주세요."),
	
	// 로그인 실패(아이디 X/ 비밀번호 불일치)
	AUTH_INVALID_CREDENTIALS("AUTH_INVALID_CREDENTIALS", "아이디 또는 비밀번호가 올바르지 않습니다."),
	
	// 권한 목록 조회 실패
	AUTH_LOAD_AUTHORITIES_FAILED("AUTH_LOAD_AUTHORITIES_FAILED", "권한 정보를 불러오지 못했습니다."),
	
	// 공통 에러
	COMMON_INTERNAL_ERROR("COMMON_INTERNAL_ERROR", "시스템 오류가 발생했습니다."),
	
	// 잘못된 요청
	COMMON_BAD_REQUEST("COMMON_BAD_REQUEST", "잘못된 요청 입니다."),
	
	// 다른 유저 수정
	AUTH_FORBIDDEN("AUTH_FORBIDDEN", "다른 유저의 정보 수정 시도"),
	
	// 닉네임 중복
	USER_USERNAME_DUPLICATE("USER_USERNAME_DUPLICATE", "이미 사용중인 닉네임 입니다.");
	
	private final String code;
	private final String defaultMessage;
	
	private ErrorCode(String code, String defaultMessage) {
		this.code = code;
		this.defaultMessage = defaultMessage;
	}
	
	public String getCode() {
		return code;
	}
	
	public String getDefaultMessage() {
		return defaultMessage;
	}
	
}
