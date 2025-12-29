package board.DTO;

import java.util.Date;
import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;
import lombok.Data;

@Data
@Table("review_comment")
public class ReviewComment {

    @Pk
    @Column
    private int no;

    @Column
    private int board_no;

    @Column
    private int user_no;

    @Column
    private String content;

    @Column
    private Date created_at;

    @Column
    private Date updated_at;
    
    @Column(exist = false)
    private String username; 

}