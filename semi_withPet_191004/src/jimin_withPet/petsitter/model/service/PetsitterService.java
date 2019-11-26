package jimin_withPet.petsitter.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import jimin_withPet.model.vo.Petsitter;
import jimin_withPet.petsitter.model.dao.PetsitterDao;

public class PetsitterService {
	
	private PetsitterDao dao = new PetsitterDao();
	
	
	public int selectCountPetsitter(String area, char grade) {
		Connection conn = getConnection();
		int result;
		
		if(area.equals("all")) {
			result = dao.selectCountPetsitterAll(conn, grade);			
		}
		else {
			switch(area) {
				case "seoul" : area = "서울"; break;
				case "incheon" : area = "인천"; break;
				case "gyeonggi" : area = "경기"; break;
				case "busan" : area = "부산"; break;
				case "daegu" : area = "대구"; break;
				case "gwangju" : area = "광주"; break;
				case "deajeon" : area = "대전"; break;
				case "woolsan" : area = "울산"; break;
			}
			result = dao.selectCountPetsitterArea(conn, area, grade);
		}
		close(conn);
		return result;
	}
	
	
	
	public List<Petsitter> petsitterList(int cPage, int numPerPage, String area, char grade){
		
		Connection conn = getConnection();
		List<Petsitter> list;

		if(area.equals("all")) {
			list = dao.petsitterListAll(conn, cPage, numPerPage, grade);
		}
		else {
			switch(area) {
			case "seoul" : area = "서울"; break;
			case "incheon" : area = "인천"; break;
			case "gyeonggi" : area = "경기"; break;
			case "busan" : area = "부산"; break;
			case "daegu" : area = "대구"; break;
			case "gwangju" : area = "광주"; break;
			case "deajeon" : area = "대전"; break;
			case "woolsan" : area = "울산"; break;
		}
			list = dao.petsitterListArea(conn, cPage, numPerPage, area, grade);
			
		}
		close(conn);
		return list;
	}
	
	
	public Petsitter selectPetsitter(String id) {
		Connection conn = getConnection();
		Petsitter p = dao.selectPetsitter(conn, id);
		close(conn);
		return p;
	}
	
	

	
	
}
