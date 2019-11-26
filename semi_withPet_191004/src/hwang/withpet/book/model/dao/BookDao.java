package hwang.withpet.book.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import hwang.withpet.book.model.vo.Book;
import hwang.withpet.book.model.vo.Price;
import hwang.withpet.pet.model.vo.Pet;
import jimin_withPet.model.vo.Petsitter;


public class BookDao {
	
	private Properties prop=new Properties();
	
	public BookDao() {
		String path=BookDao.class.getResource("/sql/book/book-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public Price selectPrice(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectPrice");
		Price price=null;
		// selectPrice=SELECT * FROM PRICE
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				price=new Price();
				price.setPricePerTime(rs.getInt("PRICE_T"));
				price.setPricePerWeight(rs.getInt("PRICE_W"));
				price.setPricePerGrade(rs.getInt("PRICE_G"));
				}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return price;
	}
	
	public Petsitter selectPetsitterOne(Connection conn, String petsitterId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectPetsitterOne");
		Petsitter petsitter=null;
		// selectPetsitterOne=SELECT A.USER_ID, M.USER_NAME, A.APPLY_GRADE, A.FEATURES, A.PROFILE_IMG, M.ADDRESS 
		// FROM APPLY_MEMBER A,  MEMBER M WHERE A.USER_ID=? AND A.USER_ID=M.USER_ID
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, petsitterId); // petsitterId
			rs=pstmt.executeQuery();
			if(rs.next()) {
				petsitter=new Petsitter();
				petsitter.setPetsitterId(rs.getString(1));
				petsitter.setPetsitterName(rs.getString(2));
				petsitter.setGrade(rs.getString(3).charAt(0));
				petsitter.setFeature(rs.getString(4));
				petsitter.setProfileImg(rs.getString(5));
				petsitter.setArea(rs.getString(6));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return petsitter;
	}
	
	public List<Petsitter> selectPetsitter(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectPetsitter");
		List<Petsitter> petsitterList=new ArrayList();
		// selectPetsitter=SELECT A.USER_ID, M.USER_NAME, A.APPLY_GRADE, A.FEATURES, A.PROFILE_IMG, M.ADDRESS 
		// FROM APPLY_MEMBER A, MEMBER M WHERE A.PERMIT_STATUS='Y' AND A.USER_ID=M.USER_ID AND CARE_OUT='Y'
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Petsitter p=new Petsitter();
				p.setPetsitterId(rs.getString(1));
				p.setPetsitterName(rs.getString(2));
				p.setGrade(rs.getString(3).charAt(0));
				p.setFeature(rs.getString(4));
				p.setProfileImg(rs.getString(5));
				p.setArea(rs.getString(6));
				petsitterList.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return petsitterList;
	 }
	
	public int insertBook(Connection conn, Book b, int index, int petId) throws SQLException { // 예외 던져주기(호출하는 곳에서 예외처리함)
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("insertBook");
		int result=0;
		
		// insertBook=INSERT INTO USAGE_HISTORY VALUES(UH_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE, ?, ?, ?)
		// insertBook=INSERT INTO USAGE_HISTORY VALUES(UH_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
		
//		PAY_NO NUMBER NOT NULL,
//	    USER_ID VARCHAR2(16) NOT NULL,
//	    PET_ID NUMBER,
//	    PETSITTER_ID VARCHAR2(16),
//	    START_DATE DATE NOT NULL,
//	    END_DATE DATE NOT NULL,
//	    BOOK_TIME VARCHAR2(12) NOT NULL,
//	    PRICE NUMBER NOT NULL,
//	    PAY_YN VARCHAR2(1) CHECK(PAY_YN IN('Y','N')),
//	    PAY_DATE DATE DEFAULT SYSDATE, -- 예약날짜(PAY_YN이 N이면), 결제날짜(PAY_YN이 Y이면)
//	    AREA VARCHAR2(150) NOT NULL, --- ADDRESS
//	    USERPOSTCODE VARCHAR2(30) NOT NULL,
//	    USERREQUEST VARCHAR2(2000),
//	    CONSTRAINT PK_PAY_NO PRIMARY KEY (PAY_NO),
//	    CONSTRAINT FK_USER_ID_HISTORY FOREIGN KEY (USER_ID) REFERENCES MEMBER(USER_ID),
//	    CONSTRAINT FK_PET_ID_HISTORY FOREIGN KEY (PET_ID) REFERENCES PET(PET_ID),
//	    CONSTRAINT FK_PETSITTER_ID_HISTORY FOREIGN KEY (PETSITTER_ID) REFERENCES APPLY_MEMBER(USER_ID)
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, b.getUserId()); // USER_ID
			if(petId==0) { // 기존에 등록된 펫들이면
				pstmt.setInt(2, b.getPetIdList()[index]);  // PET_ID
			}else { // 새로운 펫이 등록되었으면
				pstmt.setInt(2, petId);  // PET_ID
			}
			pstmt.setString(3, b.getPetsitterId()); // PETSITTER_ID
			pstmt.setString(4, b.getStartDate()); // START_DATE
			pstmt.setString(5, b.getEndDate()); // END_DATE
			pstmt.setString(6, b.getBookTime()); // BOOK_TIME
			pstmt.setInt(7, b.getPriceList()[index]); // PRICE
			pstmt.setString(8, "N"); // PAY_YN, N: 결제 전 상태로 설정
			pstmt.setString(9, b.getUserAddress()); // AREA, 구분자:subaddr
			pstmt.setString(10, b.getUserPostcode()); // USERPOSTCODE
			pstmt.setString(11, b.getUserRequest()); // USERREQUEST
			result=pstmt.executeUpdate();
		}finally {
			close(pstmt);
		}return result;
	}
	
}
