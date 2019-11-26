package son_withPet.member.model.dao;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import semi_withPet.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		String path = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Member> memberView(Connection conn, String userName){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("");
		List<Member> list = new ArrayList();
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			
			rs = pstmt.executeQuery();
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			
		}
		
		return list;
	}
	
}








































































































































