package hwang.withpet.pet.model.dao;

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
import hwang.withpet.pet.model.vo.Pet;

public class PetDao {
	
private Properties prop=new Properties();
	
	public PetDao() {
		String path=PetDao.class.getResource("/sql/book/book-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertPet(Connection conn, Book b, int index) throws SQLException { // 예외 던져주기(호출하는 곳에서 예외처리함)
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("insertPet");
		int result=0;
		
		// insertPet=INSERT INTO PET VALUES(SEQ_PET_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)
		
//		pet_id number,
//	    user_id varchar2(16) not null,
//	    pet_name varchar2(30) not null,
//	    pet_age number not null,
//	    pet_type varchar2(60) not null,
//	    pet_weight number not null,
//	    vaccine varchar2(150),
//	    sick_yn varchar2(150),
//	    pet_img varchar2(300), -- 강아지 사진
//	    constraint pk_pet_id primary key (pet_id),
//	    constraint fk_user_id foreign key  (user_id) references member (user_id),
//	    constraint fk_pet_type foreign key (pet_type) references breed (pet_breed)
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, b.getUserId()); // user_id
			pstmt.setString(2, b.getPetNameList()[index]);  // pet_name
			pstmt.setInt(3, b.getPetAgeList()[index]); // pet_age
			pstmt.setString(4, b.getPetBreedList()[index]); // pet_type
			pstmt.setDouble(5, b.getPetWeightList()[index]); // pet_weight
			pstmt.setString(6, "null"); // vaccine
			pstmt.setString(7, "N"); // sick_yn
			pstmt.setString(8, "null"); // pet_img
			result=pstmt.executeUpdate();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public List<Pet> selectPetList(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectPetList");
		List<Pet> petList=new ArrayList();
		// selectPetList=SELECT * FROM PET WHERE USER_ID=?
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId); // USER_ID
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Pet pet=new Pet();
				pet.setPetId(rs.getInt("pet_id"));
				pet.setUserId(rs.getString("user_id"));
				pet.setPetName(rs.getString("pet_name"));
				pet.setPetAge(rs.getInt("pet_age"));
				pet.setPetBreed(rs.getString("pet_type"));
				pet.setPetWeight(rs.getDouble("pet_weight"));
				pet.setVaccine(rs.getString("vaccine"));
				pet.setSickYn(rs.getString("sick_yn"));
				pet.setPetImg(rs.getString("pet_img"));
				petList.add(pet);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return petList;
	}
	
	public int selectNewPetId(Connection conn, Book b, int index) throws SQLException { // 예외 던져주기(호출하는 곳에서 예외처리함)
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectNewPetId");
		int petId=0;
		// selectNewPetId=SELECT PET_ID FROM PET WHERE USER_ID='admin1' AND PET_NAME='비앙카' AND PET_AGE=8 AND PET_TYPE='베들링턴테리어' AND PET_WEIGHT=10.2
		// selectNewPetId=SELECT PET_ID FROM PET WHERE USER_ID=? AND PET_NAME=? AND PET_AGE=? AND PET_TYPE=? AND PET_WEIGHT=?
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, b.getUserId()); // USER_ID
			pstmt.setString(2, b.getPetNameList()[index]); // PET_NAME
			pstmt.setInt(3, b.getPetAgeList()[index]); // PET_AGE
			pstmt.setString(4, b.getPetBreedList()[index]); // PET_TYPE
			pstmt.setDouble(5, b.getPetWeightList()[index]); // PET_WEIGHT
			rs=pstmt.executeQuery();
			if(rs.next()) {
				petId=rs.getInt("PET_ID");
			}
		}finally {
			close(rs);
			close(pstmt);
		}return petId;
	}
}
