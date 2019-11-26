package jimin_withPet.review.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import jimin_withPet.model.vo.Review;
import static common.template.JDBCTemplate.close;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		String path = ReviewDao.class.getResource("/sql/review/review.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public Double avgReviewPoint(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Double point = 1.0;
		String sql = prop.getProperty("avgReviewPoint");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				point = rs.getDouble("avg(rev_point)");
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return point;
	}
	
	
	
	
	public List<Review> selectReviewList(Connection conn, String id){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Review> list = new ArrayList();
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Review r = new Review();
				r.setRevNo(rs.getInt("rev_no"));
				r.setPetsitterId(rs.getString("petsitter_id"));
				r.setWriter(rs.getString("writer"));
				r.setRevContent(rs.getString("rev_content"));
				r.setRevDate(rs.getDate("rev_date"));
				r.setRevPoint(rs.getDouble("rev_point"));
				r.setPetImg(rs.getString("pet_img"));
				r.setPetName(rs.getString("pet_name"));
				r.setPetId(rs.getInt("pet_id"));
				list.add(r);
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
	
	
	
	
}
