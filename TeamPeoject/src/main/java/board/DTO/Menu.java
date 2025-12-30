package board.DTO;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("menu")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Menu {

	@Pk
	private int no;
	private int place_no;
	private String menuname;
	private String content;
	private int price;
	
}
