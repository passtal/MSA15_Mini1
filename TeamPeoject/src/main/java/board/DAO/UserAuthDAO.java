package board.DAO;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.alohaclass.jdbc.dao.BaseDAOImpl;

import board.DTO.UserAuth;

public class UserAuthDAO extends BaseDAOImpl<UserAuth> {
	
	public List<String> selectAuthListByUserNo(int userNo) throws Exception {
		
		Map<String, Object> map = new LinkedHashMap<>();
		map.put("userNo", userNo);
		
		List<UserAuth> authRows = this.listBy(map);
		
		List<String> authList = new ArrayList<>();
		for (UserAuth userAuth : authRows) {
			authList.add(userAuth.getAuth());
		}
		
		return authList;
	}
	
}
