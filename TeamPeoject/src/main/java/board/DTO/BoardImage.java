package board.DTO;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("board_image")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardImage {
	
	@Pk
	private int no;
	private int board_no;
	private String img_path;
	private int seq;
	
}