package withPet.admin.service;

import static common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import semi_withPet.model.vo.Member;
import withPet.admin.dao.AdminDao;
import withPet.apply.model.vo.ApplyCert;
import withPet.apply.model.vo.ApplyIntro;
import withPet.apply.model.vo.ApplyMember;

public class AdminService {

	private AdminDao dao = new AdminDao();

	public List<Member> viewApplyMemberList(String grade,int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Member> list = dao.viewApplyMemberList(conn, grade, cPage, numPerPage);
		close(conn);
		return list;

	}
	public List<Member> viewApplyMemberList(String grade,int cPage, int numPerPage, String userName) {
		Connection conn = getConnection();
		List<Member> list = dao.viewApplyMemberList(conn, grade, cPage, numPerPage, userName);
		close(conn);
		return list;
		
	}

	public List<ApplyMember> selectPermitReady(int readyCPage, int readyNumPerPage) {
		Connection conn = getConnection();
		List<ApplyMember> list = dao.selectPermitReady(conn, readyCPage, readyNumPerPage);
		close(conn);
		return list;
	}

	public List<ApplyMember> selectPermitDone(int doneCPage, int doneNumPerPage) {
		Connection conn = getConnection();
		List<ApplyMember> list = dao.selectPermitDone(conn, doneCPage, doneNumPerPage);
		close(conn);
		return list;
	}

	public List<String> applyMemberName(String status,int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<String> apmName = dao.applyMemberName(conn, status,cPage,numPerPage );
		close(conn);
		return apmName;

	}

	public List<String> applyMemberGrade(String status,int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<String> apmName = dao.applyMemberGrade(conn, status, cPage, numPerPage);
		close(conn);
		return apmName;

	}

	public ApplyCert selectCert(String id) {
		Connection conn = getConnection();
		ApplyCert cert = dao.selectCert(conn, id);
		close(conn);
		return cert;

	}

	public ApplyIntro selectIntro(String id) {
		Connection conn = getConnection();
		ApplyIntro intro = dao.selectIntro(conn, id);
		close(conn);
		return intro;

	}
	
	public ApplyMember selectApplyMemberId(String id) {
		Connection conn = getConnection();
		ApplyMember m = dao.selectApplyMemberId(conn, id);
		close(conn);
		return m;
				
	}
	
	public int updateGrade(String id , String grade) {
		Connection conn = getConnection();
		int result = dao.updateGrade(conn,id,grade);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int denyApply(String id) {
		Connection conn = getConnection();
		int result = dao.denyApply(conn,id);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int selectCountMember(String grade) {
		Connection conn = getConnection();
		int totalCount = dao.selectCountMember(conn, grade);
		close(conn);
		return totalCount;
	}
	
	public int selectCountApplyMember(String status) {
		Connection conn = getConnection();
		int totalData = dao.selectCountApplyMember(conn,status);
		close(conn);
		return totalData;
	}
	
}
