package add_withPet.pet.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import add_withPet.pet.model.vo.Pet;
import static common.template.JDBCTemplate.close;

public class PetDao {
	
	private Properties prop = new Properties();
	
	public PetDao() {
		String path = PetDao.class.getResource("/add_sql/pet/pet.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	

	
	
	public Pet selectPet(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Pet p = null;
		String sql = prop.getProperty("selectPet");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				p = new Pet();
				p.setPetId(rs.getInt("pet_id"));
				p.setUserId(rs.getString("user_id"));
				p.setPetName(rs.getString("pet_name"));
				p.setPetAge(rs.getInt("pet_age"));
				p.setPetType(rs.getString("pet_type"));
				p.setPetWeight(rs.getDouble("pet_weight"));
				p.setVaccine(rs.getString("vaccine"));
				p.setSickYn(rs.getString("sick_yn"));
				p.setPetImg(rs.getString("pet_img"));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return p;
	}
	
	
	
	
	
	
	public List<Pet> selectPetList(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Pet> list = new ArrayList();
		String sql = prop.getProperty("selectPetList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Pet p = new Pet();
				p.setPetId(rs.getInt("pet_id"));
				p.setUserId(rs.getString("user_id"));
				p.setPetName(rs.getString("pet_name"));
				p.setPetAge(rs.getInt("pet_age"));
				p.setPetType(rs.getString("pet_type"));
				p.setPetWeight(rs.getDouble("pet_weight"));
				p.setVaccine(rs.getString("vaccine"));
				p.setSickYn(rs.getString("sick_yn"));
				p.setPetImg(rs.getString("pet_img"));
				
				list.add(p);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		System.out.println(list);
		return list;
	}
	
	

	public int updatePet(Connection conn, Pet p) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updatePet");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getPetName());
			pstmt.setInt(2, p.getPetAge());
			pstmt.setString(3, p.getPetType());
			pstmt.setDouble(4, p.getPetWeight());
			pstmt.setString(5, p.getVaccine());
			pstmt.setString(6, p.getSickYn());
			pstmt.setString(7, p.getPetImg());
			pstmt.setInt(8, p.getPetId());
			
			result = pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public Pet selectPetOne(Connection conn, int id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Pet p = null;
		String sql = prop.getProperty("selectPetOne");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				p = new Pet();
				p.setPetId(rs.getInt("pet_id"));
				p.setPetImg(rs.getString("pet_img"));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return p;
	}
	
	
	
	public int deletePet(Connection conn, int id) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deletePet");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			
			result = pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return result;
	}

	

}
