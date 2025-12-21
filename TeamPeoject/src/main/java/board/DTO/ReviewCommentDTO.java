package board.DTO;

import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;
import com.alohaclass.jdbc.dto.Entity;

@Table("review_comment")
public class ReviewCommentDTO extends Entity {
    @Pk
    @Column private int no;
    @Column private String id;
    @Column private int user_no;
    @Column private int board_no;
    @Column private String content;

	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public int getUser_no() {
		return user_no;
	}
	
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	
	public int getBoard_no() {
		return board_no;
	}
	
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}

}