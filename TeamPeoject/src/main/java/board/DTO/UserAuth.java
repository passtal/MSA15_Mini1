package board.DTO;

import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("user_auth")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserAuth {

	@Pk
	private int no;
	private String id;
	private int userNo;
	@Column
	private String auth;
	
}
