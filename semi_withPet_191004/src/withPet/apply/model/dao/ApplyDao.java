package withPet.apply.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import withPet.apply.model.vo.ApplyCert;
import withPet.apply.model.vo.ApplyIntro;
import withPet.apply.model.vo.ApplyMember;
import withPet.apply.model.vo.Petsitter;

public class ApplyDao {
	private Properties prop = new Properties();

	public ApplyDao() {
		String path = ApplyDao.class.getResource("/sql/apply/apply-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// =====================신규 지원 =================================
	public int insertApplyMember(Connection conn, ApplyMember ap) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertApplyMember");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ap.getUserId());
			pstmt.setString(2, ap.getApplyGrade());
			pstmt.setString(3, ap.getFeatures());
			pstmt.setString(4, ap.getProfile());
			pstmt.setString(5, ap.getIntro_1());
			pstmt.setString(6, ap.getIntro_2());
			pstmt.setString(7, ap.getIntro_3());
			pstmt.setString(8, (String.valueOf(ap.getCare_in())));
			pstmt.setString(9, (String.valueOf(ap.getCare_out())));
//			pstmt.setString(9, ap.getApplyType());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertApplyCert(Connection conn, ApplyCert ac) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertApplyCert");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ac.getUserId());
			if (ac.getDiploma() != null) {
				pstmt.setString(2, ac.getDiploma());
			} else {
				pstmt.setString(2, "None");
			}
			if (ac.getCert_1() != null) {
				pstmt.setString(3, ac.getCert_1());
			} else {
				pstmt.setString(3, "None");
			}
			if (ac.getCert_2() != null) {
				pstmt.setString(4, ac.getCert_2());
			} else {
				pstmt.setString(4, "None");
			}
			if (ac.getCert_3() != null) {
				pstmt.setString(5, ac.getCert_3());
			} else {
				pstmt.setString(5, "None");
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertApplyIntro(Connection conn, ApplyIntro ai) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertApplyIntro");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ai.getUserId());
			pstmt.setString(2, ai.getMotivation());
			pstmt.setString(3, ai.getAspiration());
			pstmt.setString(4, ai.getPersonality());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	// ==================신규 지원 끝============================

	public int checkApply(Connection conn , String id) {
		int result = 0 ;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("checkApply");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1 , id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 1;
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return result;
	}
	
	
	
	public String checkApplyStatus(Connection conn , String id) {
		String status = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("checkApplyStatus");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				status = rs.getString("permit_status");
				System.out.println(status);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return status;
	}

	
	
}
