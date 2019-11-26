package add_withPet.pet.model.service;

import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;

import java.sql.Connection;
import java.util.List;

import add_withPet.pet.model.dao.PetDao;
import add_withPet.pet.model.vo.Pet;

public class PetService {
	
	private PetDao dao = new PetDao();
	
	public List<Pet> selectPetList(String id) {
		Connection conn = getConnection();
		List<Pet> list = dao.selectPetList(conn, id);
		close(conn);
		return list;
	}
	
	
	public Pet selectPet(String id) {
		Connection conn = getConnection();
		Pet p = dao.selectPet(conn, id);
		close(conn);
		return p;
				
	}
	

	
	public int updatePet(Pet p) {
		Connection conn = getConnection();
		int result = dao.updatePet(conn, p);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public Pet selectPetOne(int id) {
		Connection conn = getConnection();
		Pet p = dao.selectPetOne(conn, id);
		close(conn);
		return p;
		
	}
	
	public int deletePet(int id) {
		Connection conn = getConnection();
		int result = dao.deletePet(conn, id);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
		
	}


}
