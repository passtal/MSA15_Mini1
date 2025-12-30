package board.DTO;

import java.util.Date;
import java.util.List;

import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("board")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardDTO {

    @Pk
    private int no;
    private int user_no;
    private int group_no;
    private int place_no;
    private double rating;
    private String title;
    private String content;
    private Date created_at;
    private Date updated_at;
    
    @Column(exist = false)
    private String username;
    @Column(exist = false)
    private String profile_img;
    @Column(exist = false)
    private List<BoardImage> imageList;

}