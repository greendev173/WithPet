package yeon_withPet.pet.model.service;

import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;
import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import yeon_withPet.pet.model.dao.PetDao;
import yeon_withPet.pet.model.vo.Pet;

public class PetService {

	private PetDao dao = new PetDao();
	
	public List<String> searchType(String key){
		Connection conn = getConnection();
		List<String> list = dao.searchType(conn, key);
		close(conn);
		return list;
	}
	
	public int insertPet(Pet p) {
		Connection conn = getConnection();
		int result = dao.insertPet(conn, p);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
