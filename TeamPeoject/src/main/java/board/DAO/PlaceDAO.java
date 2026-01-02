package board.DAO;

import java.util.ArrayList;
import java.util.List;
import com.alohaclass.jdbc.dao.BaseDAOImpl;
import board.DTO.Place;

public class PlaceDAO extends BaseDAOImpl<Place> {

    @Override
    public int insert(Place place) {
        String sql = "INSERT INTO place (user_no, placename, address, phone, content, amenities, region, thumbnail_img, lat, lng) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        int result = 0;
        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, place.getUser_no());
            psmt.setString(2, place.getPlacename());
            psmt.setString(3, place.getAddress());
            psmt.setString(4, place.getPhone());
            psmt.setString(5, place.getContent());
            psmt.setString(6, place.getAmenities());
            psmt.setString(7, place.getRegion());
            psmt.setString(8, place.getThumbnail_img());
            psmt.setDouble(9, place.getLat());
            psmt.setDouble(10, place.getLng());
            
            result = psmt.executeUpdate();
        } catch (Exception e) {
            System.err.println("가게 등록 중 에러 발생");
            e.printStackTrace();
        }
        return result;
    }

    public List<Place> selectList() {
        String sql = "SELECT * FROM place ORDER BY no DESC";
        List<Place> list = new ArrayList<>();
        try {
            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();
            while(rs.next()) {
                Place p = new Place();
                p.setNo(rs.getInt("no"));
                p.setPlacename(rs.getString("placename"));
                p.setAddress(rs.getString("address"));
                p.setPhone(rs.getString("phone"));
                p.setContent(rs.getString("content"));
                p.setRegion(rs.getString("region"));
                p.setThumbnail_img(rs.getString("thumbnail_img"));
                p.setAmenities(rs.getString("amenities"));
                p.setLat(rs.getDouble("lat"));
                p.setLng(rs.getDouble("lng"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Place> selectListByFood(int foodNo) {
        String sql = "SELECT * FROM place p "
        		   + "JOIN place_food pf ON p.no = pf.place_no "
        		   + "WHERE pf.food_no = ? "
        		   + "ORDER BY p.no DESC ";
        List<Place> list = new ArrayList<>();
        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, foodNo);
            rs = psmt.executeQuery();
            while(rs.next()) {
                Place p = new Place();
                p.setNo(rs.getInt("no"));
                p.setPlacename(rs.getString("placename"));
                p.setAddress(rs.getString("address"));
                p.setPhone(rs.getString("phone"));
                p.setContent(rs.getString("content"));
                p.setRegion(rs.getString("region"));
                p.setThumbnail_img(rs.getString("thumbnail_img"));
                p.setAmenities(rs.getString("amenities"));
                p.setLat(rs.getDouble("lat"));
                p.setLng(rs.getDouble("lng"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    // ROLE ADMIN 용으로 만들어둔 delete (가게삭제) 기능 (권한 부여 후 정상 작동되나 확인 필요...)
    public int delete(int no) {
        String sql = "DELETE FROM place WHERE no = ?";
        int result = 0;
        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, no);
            result = psmt.executeUpdate();
        } catch (Exception e) {
            System.err.println("Place 삭제 중 에러 발생");
            e.printStackTrace();
        }
        return result;
    }
    

}