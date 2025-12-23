package board.DTO;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.Data;

@Data
@Table("board_image")

public class BoardImage {
	
	@Pk
	private int no;
	private int board_no;
	private String img_path;
	private int seq;
	
}
