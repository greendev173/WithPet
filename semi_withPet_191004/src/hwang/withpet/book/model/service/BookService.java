package hwang.withpet.book.model.service;

import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;
import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import hwang.withpet.book.model.dao.BookDao;
import hwang.withpet.book.model.vo.Book;
import hwang.withpet.book.model.vo.Price;
import hwang.withpet.pet.model.dao.PetDao;
import hwang.withpet.pet.model.vo.Pet;
import jimin_withPet.model.vo.Petsitter;

public class BookService {
	
	private BookDao bookDao=new BookDao();
	private PetDao petDao=new PetDao();
	
	
	public Price selectPrice() {
		Connection conn=getConnection();
		Price price=bookDao.selectPrice(conn);
		close(conn);
		return price;
	}
	
	public List<Petsitter> selectPetsitter() {
		Connection conn=getConnection();
		List<Petsitter> petsitterList=bookDao.selectPetsitter(conn);
		close(conn);
		return petsitterList;
	}
	
	public Petsitter selectPetsitterOne(String petsitterId) {
		Connection conn=getConnection();
		Petsitter petsitter=bookDao.selectPetsitterOne(conn, petsitterId);
		close(conn);
		return petsitter;
	}
	
	public int insertBook(Book b, int petCount) {
		Connection conn=getConnection();
		
		int result=0;
		try {
			for(int index=0; index<petCount; index++) { // 펫의 마리수 만큼 예약내역 따로 등록하기
				if(b.getPetIdList()[index]==0) { // 새로운 펫이 등록되었으면
					petDao.insertPet(conn, b, index); // 새로운 펫 추가
					int petId=petDao.selectNewPetId(conn, b, index); // 새로운 펫 아이디 가져오기
					bookDao.insertBook(conn, b, index, petId); // 이용내역에 예약사항 입력하기
				}else { // 기존에 등록된 펫들이면
					bookDao.insertBook(conn, b, index, 0); // 이용내역에 예약사항 입력하기
				}
			}
			commit(conn);
			result=1;
		} catch (SQLException e) { // 하나라도 예외가 발생하면 롤백처리
			e.printStackTrace();
			rollback(conn);
			result=0;
		}
		return result;
	}
	
}
