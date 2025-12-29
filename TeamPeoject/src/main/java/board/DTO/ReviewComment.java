package board.DTO;

import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table("review_comment")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewComment {
    @Pk
    private int no;
    private String id;
    private int user_no;
    private int board_no;
    private String content;

}