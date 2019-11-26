package yeon_withPet.member.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import add_withPet.pet.model.vo.Review;
import add_withPet.pet.model.vo.UsageHistory;
import semi_withPet.model.vo.Member;
import semi_withPet.model.vo.Point;
import yeon_withPet.member.model.dao.MemberDao;

public class MemberService {

	public static MemberDao dao = new MemberDao();
	
	public Member selectId(String id, String pw) {
		Connection conn = getConnection();
		Member m = dao.selectId(conn, id, pw);
		close(conn);
		return m;
	}
	
	public Member selectOne(String id) {
		Connection conn = getConnection();
		Member m = dao.selectOne(conn, id);
		close(conn);
		return m;
	}
	
	public Member checkEmail(String email) {
		Connection conn = getConnection();
		Member m = dao.checkEmail(conn, email);
		close(conn);
		return m;
	}
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = dao.insertMember(conn, m);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Member findId(String name, String email) {
		Connection conn = getConnection();
		Member m = dao.findId(conn, name, email);
		close(conn);
		return m;
	}
	
	public int updatePassword(String id, String pw) {
		Connection conn = getConnection();
		int result = dao.updatePassword(conn, id, pw);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	

	public int updateMember(Member m) {
		Connection conn = getConnection();
		int result = dao.updateMember(conn, m);
		if(result>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	
	public String selectPet(String petId) {
		Connection conn = getConnection();
		String petName = dao.selectPet(conn, petId);
		close(conn);
		return petName;
	}
	
	public int countReview(int payNo) {
		Connection conn = getConnection();
		int countReview = dao.countReview(conn, payNo);
		close(conn);
		return countReview;
	}
	
	
	public List<UsageHistory> selectUserHistory(String id, String purpose) {
		Connection conn = getConnection();
		List<UsageHistory> list = dao.selectUserHistory(conn, id, purpose);
		close(conn);
		return list;
	}
	
	public List<UsageHistory> selectUserHistory(String id, String purpose, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<UsageHistory> list = dao.selectUserHistory(conn, id, purpose, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public Review selectReview(int payNo) {
		Connection conn = getConnection();
		Review rv = dao.selectReview(conn, payNo);
		close(conn);
		return rv;
	}
	
	public List<Point> selectPointList(String id){
		Connection conn = getConnection();
		List<Point> list = dao.selectPointList(conn , id);
		close(conn);
		return list;
		
		
	}
	
	public UsageHistory selectUserHistoryOne(int payNo) {
		Connection conn = getConnection();
		UsageHistory uh = dao.selectUserHistoryOne(conn, payNo);
		close(conn);
		return uh;
	}
	
	
	public int updatePoint(String id, int point, int cPoint) {
		Connection conn = getConnection();
		int result = dao.updatePoint(conn, id, cPoint);
		int result2 = 0;
		if(result > 0) {
			result2 = dao.insertPointTable(conn, id , point);
			if(result2 > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result2;
	}
	
	
	public int insertReview(Review rv) {
		Connection conn = getConnection();
		int result = dao.insertReview(conn, rv);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteReview(int payNo) {
		Connection conn = getConnection();
		int result = dao.deleteReview(conn, payNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updateReview(Review rv) {
		Connection conn = getConnection();
		int result = dao.updateReview(conn, rv);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<String> selectPstProfiles(String userId){
		Connection conn = getConnection();
		List<String> list = dao.selectPstProfiles(conn, userId);
		close(conn);
		return list; 
	}
	
	
	public List<Member> selectPstInfoList(String userId){
		Connection conn = getConnection();
		List<Member> list = dao.selectPstInfoList(conn,userId);
		close(conn);
		return list;
		
	}
	
	public int paymentUpdate(String id , int price , int payNo, int endPrice) {
		Connection conn = getConnection();
		int result = dao.paymentUpdate(conn, id, price);
		int result2 = 0;
		int result3 = 0;
		if(result > 0) {
//			commit(conn);
			result2 = dao.payStatusUpdate(conn , payNo);
			if(result2 > 0) {
				result3 = dao.payResultInsert(conn, id, endPrice);
				if(result3 > 0) {
					commit(conn);
				} else {
					rollback(conn);
				}
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}
		close(conn);
		return result3;
	}
	
	public int selectUserHistoryList(String userId, String purpose) {
		Connection conn = getConnection();
		int result = dao.selectUserHistoryList(conn, userId, purpose);
		close(conn);
		return result;
	}
	
	public char checkIsMember(String id) {
		Connection conn = getConnection();
		char isMemberYN = dao.checkIsMember(conn, id);
		close(conn);
		return isMemberYN;
	}
	
	
	
	public int deleteMember(String id) {
		Connection conn = getConnection();
		int result = dao.deleteMember(conn, id);
		close(conn);
		return result;
	}


}
