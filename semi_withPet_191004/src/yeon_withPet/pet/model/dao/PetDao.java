package yeon_withPet.pet.model.dao;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import yeon_withPet.member.model.dao.MemberDao;
import yeon_withPet.pet.model.vo.Pet;

public class PetDao {

	private Properties prop = new Properties();
	
	public PetDao() {
		String path = MemberDao.class.getResource("/sql/pet/pet-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<String> searchType(Connection conn, String key){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> list = new ArrayList();
		String sql = prop.getProperty("searchType");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + key + "%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int insertPet(Connection conn, Pet p) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPet");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getUserId());
			pstmt.setString(2, p.getPetName());
			pstmt.setInt(3, p.getPetAge());
			pstmt.setString(4, p.getPetType());
			pstmt.setDouble(5, p.getPetWeight());
			pstmt.setString(6, p.getVaccine());		
			pstmt.setString(7, p.getSickYN());
			pstmt.setString(8, p.getPetImg());
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
