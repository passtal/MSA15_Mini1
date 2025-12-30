package board.DTO;

import java.util.Date;


import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("users")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {

	@Pk
	private int no;
	private String id;
	private String userId;
	private String password;
	
	@Column(exist = false)
	private String passwordConfirm;
	private String username;
	private int age;
	private String sex;
	private String profileImg;
	private Date createdAt;
	private Date updatedAt;
	
}