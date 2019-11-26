package withPet.apply.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;

import withPet.apply.model.dao.ApplyDao;
import withPet.apply.model.vo.ApplyCert;
import withPet.apply.model.vo.ApplyIntro;
import withPet.apply.model.vo.ApplyMember;
import withPet.apply.model.vo.Petsitter;

public class ApplyService {

	ApplyDao dao = new ApplyDao();

	public int insertApplyMember(ApplyMember ap, ApplyCert ac, ApplyIntro ai) {
		Connection conn = getConnection();
		int result = dao.insertApplyMember(conn, ap);
		if (result > 0) {
			System.out.println("1 :" + result);
			result = dao.insertApplyCert(conn, ac);
			if (result > 0) {
				System.out.println("2 :" + result);
				result = dao.insertApplyIntro(conn, ai);
				if (result > 0) {
					commit(conn);
				} else {
					rollback(conn);
				}
			}
		}
		close(conn);
		return result;
	}

	public int checkApply(String id) {
		Connection conn = getConnection(); 
		int result = dao.checkApply(conn, id);
		close(conn);
		return result;
	}
	
	public String checkApplyStatus(String id) {
		Connection conn = getConnection();
		String status = dao.checkApplyStatus(conn, id);
		close(conn);
		return status;
	}
}