package board.DTO;

import java.util.List;

import com.alohaclass.jdbc.annotation.Column;
import com.alohaclass.jdbc.annotation.Pk;
import com.alohaclass.jdbc.annotation.Table;
import com.alohaclass.jdbc.dto.Entity;

@Table("board")
public class BoardDTO extends Entity {

    @Pk
    @Column
    private int no;

    @Column
    private String id;

    @Column
    private int user_no; 

    @Column
    private int group_no;

    @Column
    private Integer place_no;

    @Column
    private double rating;

    @Column
    private String title;

    @Column
    private String content;
    
    @Column(exist = false)
    private String username;
    
    @Column(exist = false)
    private List<BoardImage> imageList;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	public Integer getPlace_no() {
		return place_no;
	}

	public void setPlace_no(Integer place_no) {
		this.place_no = place_no;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}