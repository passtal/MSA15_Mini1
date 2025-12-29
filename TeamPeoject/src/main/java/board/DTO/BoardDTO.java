package board.DTO;

import java.util.Date;
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
    private int place_no;

    @Column
    private double rating;

    @Column
    private String title;

    @Column
    private String content;
    
    @Column
    private Date created_at;
    
    @Column
    private Date updated_at;
    
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

    public int getPlace_no() {
        return place_no;
    }

    public void setPlace_no(int place_no) {
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

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<BoardImage> getImageList() {
        return imageList;
    }

    public void setImageList(List<BoardImage> imageList) {
        this.imageList = imageList;
    }
}