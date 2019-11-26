package hwang.withpet.pet.model.service;

import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import hwang.withpet.pet.model.dao.PetDao;
import hwang.withpet.pet.model.vo.Pet;

public class PetService {

private PetDao dao=new PetDao();
	
	public List<Pet> selectPetList(String userId) {
		Connection conn=getConnection();
		List<Pet> petList=dao.selectPetList(conn, userId);
		if(petList!=null) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return petList;
	}
	
}
