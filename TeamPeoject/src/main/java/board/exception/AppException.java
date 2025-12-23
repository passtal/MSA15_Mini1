package board.exception;

public class AppException extends RuntimeException {
	private static final long serialVersionUID = 1L;
	
    private final ErrorCode errorCode;

    public AppException(ErrorCode errorCode) {
        super( errorCode.getDefaultMessage() );
        this.errorCode = errorCode;
    }

    public AppException(ErrorCode errorCode, Throwable cause) {
        super( errorCode.getDefaultMessage() , cause);
        this.errorCode = errorCode;
    }

    public ErrorCode getErrorCode() {
        return errorCode;
    }
}
