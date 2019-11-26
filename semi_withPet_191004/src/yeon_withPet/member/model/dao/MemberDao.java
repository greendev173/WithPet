package yeon_withPet.member.model.dao;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import add_withPet.pet.model.vo.Review;
import add_withPet.pet.model.vo.UsageHistory;
import semi_withPet.model.vo.Member;
import semi_withPet.model.vo.Point;

public class MemberDao {

	private Properties prop = new Properties();

	public MemberDao() {
		String path = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member selectId(Connection conn, String id, String pw) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		String sql = prop.getProperty("selectId");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				m = new Member();
				m.setUserId(rs.getString("USER_ID"));
				m.setUserPwd(rs.getString("USER_PWD"));
				m.setGrade(rs.getString("GRADE"));
				m.setUserName(rs.getString("USER_NAME"));
				m.setAddress(rs.getString("ADDRESS"));
				m.setArea1(rs.getString("AREA1"));
				m.setArea2(rs.getString("AREA2"));
				m.setPhone(rs.getString("PHONE"));
				m.setEmail(rs.getString("EMAIL"));
				m.setHaveDog(rs.getString("HAVE_DOG").charAt(0));
				m.setReservation(rs.getString("RESERVATION").charAt(0));
				m.setPoint(rs.getInt("POINT"));
				m.setEnrollDate(rs.getDate("ENROLL_DATE"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

	public Member selectOne(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		String sql = prop.getProperty("selectOne");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				m = new Member();
				m.setUserId(rs.getString("USER_ID"));
				m.setUserPwd(rs.getString("USER_PWD"));
				m.setGrade(rs.getString("GRADE"));
				m.setUserName(rs.getString("USER_NAME"));
				m.setAddress(rs.getString("ADDRESS"));
				m.setArea1(rs.getString("AREA1"));
				m.setArea2(rs.getString("AREA2"));
				m.setPhone(rs.getString("PHONE"));
				m.setEmail(rs.getString("EMAIL"));
				m.setHaveDog(rs.getString("HAVE_DOG").charAt(0));
				m.setReservation(rs.getString("RESERVATION").charAt(0));
				m.setPoint(rs.getInt("POINT"));
				m.setEnrollDate(rs.getDate("ENROLL_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

	public Member checkEmail(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		String sql = prop.getProperty("checkEmail");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				m = new Member();
				m.setEmail(rs.getString("EMAIL"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println(m);
		return m;
	}

	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertMember");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getAddress());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getEmail());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Member findId(Connection conn, String name, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		String sql = prop.getProperty("findId");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				m = new Member();
				m.setUserId(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

	public int updatePassword(Connection conn, String id, String pw) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updatePw");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	public int updateMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getAddress());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getUserId());
			
			result=pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return result;
		
	}
	
	
	
	public List<UsageHistory> selectUserHistory(Connection conn, String id, String purpose) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<UsageHistory> list = new ArrayList();
		String sql = prop.getProperty("selectHistory1");
		UsageHistory uh = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, purpose);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				uh = new UsageHistory();
				uh.setUserId(rs.getString("USER_ID"));
				uh.setPetId(rs.getString("PET_ID"));
				uh.setPetsitterId(rs.getString("PETSITTER_ID"));
				uh.setStartDate(rs.getDate("START_DATE"));
				uh.setEndDate(rs.getDate("END_DATE"));
				uh.setBookTime(rs.getString("BOOK_TIME"));
				uh.setPrice(rs.getInt("PRICE"));
				uh.setPayYN(rs.getString("PAY_YN"));
				uh.setPayDate(rs.getDate("PAY_DATE"));
				uh.setArea(rs.getString("AREA"));
				uh.setUserRequest(rs.getString("USERREQUEST"));
				uh.setPetsitterImg(rs.getString("PROFILE_IMG"));
				uh.setPayNo(rs.getInt("PAY_NO"));
				list.add(uh);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public String selectPet(Connection conn, String petId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String petName = "";
		String sql = prop.getProperty("selectPet");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, petId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				petName = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return petName;
	}
	
	public int countReview(Connection conn, int payNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = prop.getProperty("countReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, payNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}
	
	public Review selectReview(Connection conn, int payNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Review rv = null;
		String sql = prop.getProperty("selectReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, payNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rv = new Review();
				rv.setRevNo(rs.getInt("REV_NO"));
				rv.setPetsitterId(rs.getString("PETSITTER_ID"));
				rv.setWriter(rs.getString("WRITER"));
				rv.setPetId(rs.getInt("PET_ID"));
				rv.setRevContent(rs.getString("REV_CONTENT"));
				rv.setRevDate(rs.getDate("REV_DATE"));
				rv.setRevPoint(rs.getInt("REV_POINT"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return rv;
	}
	
	
	public List<Point> selectPointList(Connection conn , String id){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Point> list = new ArrayList();
		String sql = prop.getProperty("selectPointList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Point p = new Point();
				p.setUserId(id);
				p.setPrice(rs.getString("price"));
				p.setPointDate(rs.getDate("point_date"));
				if(rs.getString("point_dw").equals("W")) {
					p.setPointDW("차감");
				} else {
					p.setPointDW("충전");	
				}
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}
	
	
	
	public int updatePoint(Connection conn , String id , int cPoint) {
		PreparedStatement pstmt = null;
		int result = 0 ;
		String sql = prop.getProperty("updatePoint");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cPoint);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertPointTable(Connection conn , String id , int point) {
		PreparedStatement pstmt = null;
		int result = 0 ;
		String sql = prop.getProperty("insertPointTable");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, point);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public UsageHistory selectUserHistoryOne(Connection conn, int payNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UsageHistory uh = null;
		String sql = prop.getProperty("selectUserHistoryOne");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, payNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				uh = new UsageHistory();
				uh.setUserId(rs.getString("USER_ID"));
				uh.setPetId(rs.getString("PET_ID"));
				uh.setPetsitterId(rs.getString("PETSITTER_ID"));
				uh.setStartDate(rs.getDate("START_DATE"));
				uh.setEndDate(rs.getDate("END_DATE"));
				uh.setBookTime(rs.getString("BOOK_TIME"));
				uh.setPrice(rs.getInt("PRICE"));
				uh.setPayYN(rs.getString("PAY_YN"));
				uh.setArea(rs.getString("AREA"));
				uh.setUserRequest(rs.getString("USERREQUEST"));
				uh.setPayNo(rs.getInt("PAY_NO"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return uh;
	}
	
	public int insertReview(Connection conn, Review rv) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertReview");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rv.getPetsitterId());
			pstmt.setString(2, rv.getWriter());
			pstmt.setInt(3, rv.getPetId());
			pstmt.setString(4, rv.getRevContent());
			pstmt.setInt(5, rv.getRevPoint());
			pstmt.setInt(6, rv.getPayNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteReview(Connection conn, int payNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, payNo);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		return result;
	}
	
	public int updateReview(Connection conn, Review rv) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateReview");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rv.getRevContent());
			pstmt.setInt(2, rv.getRevPoint());
			pstmt.setInt(3, rv.getPayNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	

	public List<String> selectPstProfiles(Connection conn ,String userId){
		List<String> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = "";
		String sql = prop.getProperty("selectPstProfiles");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getString("profile_img");
				list.add(result);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
	
		return list; 
	}
	
	
	public List<Member> selectPstInfoList(Connection conn, String userId){
		List<Member> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectPstInfoList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member  m = new Member();
				m.setUserName(rs.getString("user_name"));
				m.setGrade(rs.getString("grade"));
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
	
	public int paymentUpdate(Connection conn , String id , int price) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("paymentUpdate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, price);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int payStatusUpdate(Connection conn , int payNo ) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("payStatusUpdate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, payNo);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int payResultInsert(Connection conn , String id , int endPrice) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("payResultInsert");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, endPrice);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	
	public List<UsageHistory> selectUserHistory(Connection conn, String id, String purpose, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<UsageHistory> list = new ArrayList();
		String sql = prop.getProperty("selectHistory");
		UsageHistory uh = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, purpose);
			pstmt.setInt(3, cPage);
			pstmt.setInt(4, numPerPage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				uh = new UsageHistory();
				uh.setUserId(rs.getString("USER_ID"));
				uh.setPetId(rs.getString("PET_ID"));
				uh.setPetsitterId(rs.getString("PETSITTER_ID"));
				uh.setStartDate(rs.getDate("START_DATE"));
				uh.setEndDate(rs.getDate("END_DATE"));
				uh.setBookTime(rs.getString("BOOK_TIME"));
				uh.setPrice(rs.getInt("PRICE"));
				uh.setPayYN(rs.getString("PAY_YN"));
				uh.setArea(rs.getString("AREA"));
				uh.setUserRequest(rs.getString("USERREQUEST"));
				uh.setPetsitterImg(rs.getString("PROFILE_IMG"));
				uh.setPayNo(rs.getInt("PAY_NO"));
				list.add(uh);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int selectUserHistoryList(Connection conn, String userId, String purpose) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectUserHistoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, purpose);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	
	
	public char checkIsMember(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		char isMemberYN = 'N';
		String sql = prop.getProperty("checkIsmemberYN");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				isMemberYN = rs.getString("isMember").charAt(0);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		System.out.println(isMemberYN);
		return isMemberYN;
	}
	
	
	
	public int deleteMember(Connection conn, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
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
