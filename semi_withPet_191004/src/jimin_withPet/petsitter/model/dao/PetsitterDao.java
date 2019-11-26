package jimin_withPet.petsitter.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import jimin_withPet.model.vo.Petsitter;
import static common.template.JDBCTemplate.close;

public class PetsitterDao {

	private Properties prop = new Properties();
	
	public PetsitterDao() {
		String path = PetsitterDao.class.getResource("/sql/petsitter/petsitter.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public int selectCountPetsitterAll(Connection conn, char grade) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectCountPetsitterAll");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, String.valueOf(grade));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	public int selectCountPetsitterArea(Connection conn, String area, char grade) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectCountPetsitterArea");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, area + "%");
			pstmt.setString(2, String.valueOf(grade));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	
	public List<Petsitter> petsitterListAll(Connection conn, int cPage, int numPerPage, char grade){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Petsitter> list = new ArrayList();
		String sql = prop.getProperty("petsitterListAll");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, String.valueOf(grade));
			pstmt.setInt(2, (cPage-1) * numPerPage+1);
			pstmt.setInt(3, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Petsitter p = new Petsitter();
				p.setPetsitterId(rs.getString("user_id"));
				p.setGrade(rs.getString("grade").charAt(0));
				p.setPetsitterName(rs.getString("user_name"));
				p.setArea(rs.getString("address"));
				p.setIntro(rs.getString("motivation"));
				p.setProfileImg(rs.getString("profile_img"));
				p.setInfImg1(rs.getString("intro1_img"));
				p.setInfImg2(rs.getString("intro2_img"));
				p.setInfImg3(rs.getString("intro3_img"));
				p.setFeature(rs.getString("features"));
				p.setCareIn(rs.getString("care_in").charAt(0));
				p.setCareOut(rs.getString("care_out").charAt(0));
				p.setEnrollDate(rs.getDate("enroll_date"));	
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
		return list;
	}
	
	
	
	
	public List<Petsitter> petsitterListArea(Connection conn, int cPage, int numPerPage, String area, char grade){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Petsitter> list = new ArrayList();
		String sql = prop.getProperty("petsitterListArea");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, area + "%");
			pstmt.setString(2, String.valueOf(grade));
			pstmt.setInt(3, (cPage-1) * numPerPage+1);
			pstmt.setInt(4, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Petsitter p = new Petsitter();
				p.setPetsitterId(rs.getString("user_id"));
				p.setGrade(rs.getString("grade").charAt(0));
				p.setPetsitterName(rs.getString("user_name"));
				p.setArea(rs.getString("address"));
				p.setIntro(rs.getString("motivation"));
				p.setProfileImg(rs.getString("profile_img"));
				p.setInfImg1(rs.getString("intro1_img"));
				p.setInfImg2(rs.getString("intro2_img"));
				p.setInfImg3(rs.getString("intro3_img"));
				p.setFeature(rs.getString("features"));
				p.setCareIn(rs.getString("care_in").charAt(0));
				p.setCareOut(rs.getString("care_out").charAt(0));
				p.setEnrollDate(rs.getDate("enroll_date"));	
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
		return list;
		
	}
	
	
	
	
	public Petsitter selectPetsitter(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Petsitter p = null;
		String sql = prop.getProperty("selectPetsitter");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				p = new Petsitter();
				p.setPetsitterId(rs.getString("user_id"));
				p.setGrade(rs.getString("grade").charAt(0));
				p.setPetsitterName(rs.getString("user_name"));
				p.setArea(rs.getString("address"));
				p.setIntro(rs.getString("motivation"));
				p.setProfileImg(rs.getString("profile_img"));
				p.setInfImg1(rs.getString("intro1_img"));
				p.setInfImg2(rs.getString("intro2_img"));
				p.setInfImg3(rs.getString("intro3_img"));
				p.setFeature(rs.getString("features"));
				p.setCareIn(rs.getString("care_in").charAt(0));
				p.setCareOut(rs.getString("care_out").charAt(0));
				p.setEnrollDate(rs.getDate("enroll_date"));	
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return p;
	}
}
