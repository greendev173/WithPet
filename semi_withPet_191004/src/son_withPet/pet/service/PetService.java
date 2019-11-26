package son_withPet.pet.service;

import java.sql.Connection;
import java.util.List;
import son_withPet.pet.model.dao.PetDao;
import son_withPet.pet.model.vo.PetsitterView;

import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.rollback;
import static common.template.JDBCTemplate.commit;

public class PetService {
	private PetDao dao = new PetDao();

	//펫시터뷰
	public List<PetsitterView> memberFilter(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<PetsitterView> list = dao.memberFilter(conn,cPage,numPerPage);
		System.out.println(list);
		close(conn);
		return list;
	}
	//펫시터 카운트
	public PetsitterView petsitterCount(){
		Connection conn = getConnection();
		PetsitterView f = dao.petsitterCount(conn);
		close(conn);
		return f;
	}
	//주소 카운트
	public PetsitterView petsitterCountAddr(String addr){
		Connection conn = getConnection();
		PetsitterView f = dao.petsitterCountAddr(conn, addr);
		close(conn);
		return f;
	}
	//페이지바
	public int selectBoardCount() {
		Connection conn=getConnection();
		int result=dao.selectBoardCount(conn);
		close(conn);
		return result;
	}
	//지역 카운트
	public int localCount(String localName) {
		Connection conn=getConnection();
		int result=dao.localCount(conn, localName);
		close(conn);
		return result;
	}
	//지역 검색
	public List<PetsitterView> areaView(String key,int cPage,int numPerPage){
		Connection conn = getConnection();
		List<PetsitterView> list = dao.areaView(conn,key,cPage,numPerPage);
		close(conn);
		return list;
	}
	//지역 페이지바
	public int selectBoardAreaCount(String key) {
		Connection conn=getConnection();
		int result=dao.selectBoardAreaCount(conn, key);
		close(conn);
		return result;
	}
	//지역 전체
	public List<PetsitterView> areaAllView(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<PetsitterView> list = dao.areaAllView(conn,cPage,numPerPage);
		close(conn);
		return list;
	}

	//등급별 펫시터 구분
	public List<PetsitterView> petsitterGrade(String key,int cPage,int numPerPage){
		Connection conn = getConnection();
		List<PetsitterView> list = dao.petsitterGrade(conn,key,cPage,numPerPage);
		close(conn);
		return list;
	}
	//등급별 펫시터 카운트
	public PetsitterView petsitterGradeCount(String key){
		Connection conn = getConnection();
		PetsitterView f = dao.petsitterGradeCount(conn,key);
		close(conn);
		return f;
	}
	//등급별 페이지바
	public int selectBoardGradeCount(String key) {
		Connection conn=getConnection();
		int result=dao.selectBoardGradeCount(conn, key);
		close(conn);
		System.out.println("result: "+result);
		return result;
	}
	//이름검색
	public List<PetsitterView> searchName(String key, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<PetsitterView> list = dao.searchName(conn, key, cPage, numPerPage);
		close(conn);
		return list;
	}
	public int selectBoardNameCount(String key) {
		Connection conn=getConnection();
		int result=dao.selectBoardNameCount(conn, key);
		close(conn);
		return result;
	}
	
	//특징검색
	public List<PetsitterView> searchFeatures(List<String> featuresTemp, int cPage, int numPerPage){
		Connection conn = getConnection();
		List<PetsitterView> list = dao.searchFeatures(conn, featuresTemp, cPage, numPerPage);
		close(conn);
		return list;
	}
	public int selectBoardFeaturesCount(List<String> featuresTemp) {
		Connection conn=getConnection();
		int result=dao.selectBoardFeaturesCount(conn, featuresTemp);
		close(conn);
		return result;
	}
	
	//둘다검색
	public List<PetsitterView> searchAll(String key,List<String> featuresTemp, int cPage, int numPerPage){
		Connection conn = getConnection();
		List<PetsitterView> list = dao.searchAll(conn, key, featuresTemp, cPage, numPerPage);
		close(conn);
		return list;
	}
	public int selectBoardAllCount(String key, List<String> featuresTemp) {
		Connection conn=getConnection();
		int result=dao.selectBoardAllCount(conn, key, featuresTemp);
		close(conn);
		return result;
	}
	
}
