package withPet.admin.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import semi_withPet.model.vo.Member;
import withPet.apply.model.vo.ApplyCert;
import withPet.apply.model.vo.ApplyIntro;
import withPet.apply.model.vo.ApplyMember;

public class AdminDao {

	Properties prop = new Properties();

	public AdminDao() {

		String path = AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public List<Member> viewApplyMemberList(Connection conn, String grade,int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> list = new ArrayList();
		String sql = prop.getProperty("viewApplyMemberList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, grade);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member m = new Member();
				m.setUserId(rs.getString("user_id"));
				m.setUserName(rs.getString("user_name"));
				if (grade.equals("C")) {
					m.setGrade("일반");
				} else if (grade.equals("G")) {
					m.setGrade("일반 펫시터");
				} else if (grade.equals("M")) {
					m.setGrade("전문 펫시터");
				}
				m.setAddress(rs.getString("address").replaceAll("subaddr", " "));
				m.setArea1(rs.getString("area1"));
				m.setArea2(rs.getString("area2"));
				m.setPhone(rs.getString("phone"));
				m.setEmail(rs.getString("email"));
				m.setHaveDog(rs.getString("have_dog").charAt(0));
				m.setReservation(rs.getString("reservation").charAt(0));
				m.setPoint(rs.getInt("point"));
				m.setEnrollDate(rs.getDate("enroll_date"));

				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public List<Member> viewApplyMemberList(Connection conn, String grade,int cPage, int numPerPage,String userName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> list = new ArrayList();
		String sql = prop.getProperty("viewApplyMemberListAjax");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, grade);
			pstmt.setString(2, "%"+userName+"%");
			pstmt.setInt(3, (cPage-1)*numPerPage+1);
			pstmt.setInt(4, cPage*numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member m = new Member();
				m.setUserId(rs.getString("user_id"));
				m.setUserName(rs.getString("user_name"));
				if (grade.equals("C")) {
					m.setGrade("일반");
				} else if (grade.equals("G")) {
					m.setGrade("일반 펫시터");
				} else if (grade.equals("M")) {
					m.setGrade("전문 펫시터");
				}
				m.setAddress(rs.getString("address").replaceAll("subaddr", " "));
				m.setArea1(rs.getString("area1"));
				m.setArea2(rs.getString("area2"));
				m.setPhone(rs.getString("phone"));
				m.setEmail(rs.getString("email"));
				m.setHaveDog(rs.getString("have_dog").charAt(0));
				m.setReservation(rs.getString("reservation").charAt(0));
				m.setPoint(rs.getInt("point"));
				m.setEnrollDate(rs.getDate("enroll_date"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public ApplyMember selectApplyMemberId(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ApplyMember m = null;
		String sql = prop.getProperty("selectApplyMemberId");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				m = new ApplyMember();
				m.setUserId(rs.getString("user_id"));
				if (rs.getString("apply_grade").equals("G")) {
					m.setApplyGrade("일반 펫시터");
				} else if (rs.getString("apply_grade").equals("M")) {
					m.setApplyGrade("전문 펫시터");
				}
				m.setFeatures(rs.getString("features"));
				m.setProfile(rs.getString("profile_img"));
				m.setIntro_1(rs.getString("intro1_img"));
				m.setIntro_2(rs.getString("intro2_img"));
				m.setIntro_3(rs.getString("intro3_img"));
				if (rs.getString("apply_type").equals("NEW")) {
					m.setApplyType("신규 지원");
				} else {
					m.setApplyType("승급 요청");
				}
				m.setCare_in(rs.getString("care_in").charAt(0));
				m.setCare_out(rs.getString("care_out").charAt(0));
				m.setEnrollDate(rs.getDate("enroll_date"));
				m.setPermitStatus(rs.getString("permit_status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

	public List<ApplyMember> selectPermitReady(Connection conn , int readyCPage, int readyNumPerPage ) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ApplyMember> list = new ArrayList();

		String sql = prop.getProperty("selectPermitReady");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (readyCPage-1)*readyNumPerPage+1);
			pstmt.setInt(2, readyCPage*readyNumPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ApplyMember ps = new ApplyMember();
				ps.setUserId(rs.getString("user_id"));
				if (rs.getString("apply_grade").equals("C")) {
					ps.setApplyGrade("일반회원");
				} else if (rs.getString("apply_grade").equals("G")) {
					ps.setApplyGrade("일반 펫시터");
				} else if (rs.getString("apply_grade").equals("M")) {
					ps.setApplyGrade("전문 펫시터");
				}
				ps.setFeatures(rs.getString("features"));
				ps.setProfile(rs.getString("profile_img"));
				ps.setIntro_1(rs.getString("intro1_img"));
				ps.setIntro_2(rs.getString("intro2_img"));
				ps.setIntro_3(rs.getString("intro3_img"));
				ps.setApplyType(rs.getString("apply_type"));
				ps.setCare_in(rs.getString("care_in").charAt(0));
				ps.setCare_out(rs.getString("care_out").charAt(0));
				if (rs.getString("permit_status").equals("N")) {
					ps.setPermitStatus("승인 대기");
				} else if (rs.getString("permit_status").equals("Y")) {
					ps.setPermitStatus("승인 완료"); // 승인 관련 트랜젝션 처리 필요
				}
				ps.setEnrollDate(rs.getDate("enroll_date"));
				list.add(ps);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;

	}

	public List<ApplyMember> selectPermitDone(Connection conn, int doneCPage, int doneNumPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ApplyMember> list = new ArrayList();

		String sql = prop.getProperty("selectPermitDone");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (doneCPage-1)*doneNumPerPage+1);
			pstmt.setInt(2, doneCPage*doneNumPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ApplyMember ps = new ApplyMember();
				ps.setUserId(rs.getString("user_id"));
				ps.setFeatures(rs.getString("features"));
				ps.setProfile(rs.getString("profile_img"));
				ps.setIntro_1(rs.getString("intro1_img"));
				ps.setIntro_2(rs.getString("intro2_img"));
				ps.setIntro_3(rs.getString("intro3_img"));
				ps.setApplyType(rs.getString("apply_type"));
				ps.setCare_in(rs.getString("care_in").charAt(0));
				ps.setCare_out(rs.getString("care_out").charAt(0));
				if (rs.getString("permit_status").equals("Y")) {
					ps.setPermitStatus("승인 완료"); // 승인 관련 트랜젝션 처리 필요
				} else if (rs.getString("permit_status").equals("N")) {
					ps.setPermitStatus("승인 대기");
				}
				ps.setEnrollDate(rs.getDate("enroll_date"));
				list.add(ps);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;

	}

	public List<String> applyMemberName(Connection conn, String status ,int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("applyMemberName");
		List<String> result = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, status);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString("user_name");
				result.add(name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public List<String> applyMemberGrade(Connection conn, String status ,int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("applyMemberGrade");
		List<String> result = new ArrayList();
		int i = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, status);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String grade = "";
				if (rs.getString("grade").equals("C")) {
					grade = "일반회원";
				} else if (rs.getString("grade").equals("G")) {
					grade = "일반 펫시터";
				} else if (rs.getString("grade").equals("M")) {
					grade = "전문 펫시터";
				}
				result.add(grade);
				/*
				 * i++; } if (!(i < 0)) { result = new String[i]; i = 0; rs =
				 * pstmt.executeQuery(); while (rs.next()) { result[i] = rs.getString("grade");
				 * i++; }
				 */
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public ApplyCert selectCert(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectCert");
		ApplyCert cert = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cert = new ApplyCert();
				cert.setDiploma(rs.getString("diploma"));
				cert.setCert_1(rs.getString("cert_1"));
				cert.setCert_2(rs.getString("cert_2"));
				cert.setCert_3(rs.getString("cert_3"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return cert;
	}

	public ApplyIntro selectIntro(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectIntro");
		ApplyIntro intro = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				intro = new ApplyIntro();
				intro.setMotivation(rs.getString("motivation"));
				intro.setAspiration(rs.getString("aspiration"));
				intro.setPersonality(rs.getString("personality"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return intro;
	}

	public int updateGrade(Connection conn, String id, String grade) { // 지원유형 : 일반 -> 전문;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateGrade");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, grade);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
			if (result > 0) {
				close(pstmt);
				sql = prop.getProperty("updatePermitStatus");
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					result = pstmt.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			close(pstmt);
		}

		return result;

	}

	public int denyApply(Connection conn, String id) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("denyApply");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			close(pstmt);
		}
		return result;

	}

	public int selectCountMember(Connection conn, String grade) {
		int totalCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectCountMemberByGrade");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, grade);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// result=rs.getInt("cnt");
				totalCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return totalCount;
	}
	
	
	public int selectCountApplyMember(Connection conn , String status) {
		int totalData = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectCountApplyMemberBystatus");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, status);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalData = rs.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		
		return totalData;
	}
}
