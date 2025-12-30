package board.DTO;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("place_food")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PlaceFood {
	
	@Pk
	private int no;
	private int food_no;
	private int place_no;
	
}
