package board.DTO;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("food_category")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FoodCategory {

	@Pk
	private int no;
	private String foodname;
	
}
