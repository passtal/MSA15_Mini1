package board.DTO;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("place")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Place {

	@Pk
	private int no;
	private int user_no;
	private String placename;
	private String address;
	private String phone;
	private String thumbnail_img;
	private String content;
	private String amenities;
	private String region;
	private double lat;
    private double lng;
	
}
