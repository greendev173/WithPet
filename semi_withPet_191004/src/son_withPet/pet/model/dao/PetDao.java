package son_withPet.pet.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import son_withPet.member.model.dao.MemberDao;
import son_withPet.pet.model.vo.PetsitterView;
import static common.template.JDBCTemplate.close;

public class PetDao {

private Properties prop = new Properties();
	
	public PetDao() {
		String path = MemberDao.class.getResource("/sql/pet/pet-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	//전체 펫시터뷰
	public List<PetsitterView> memberFilter(Connection conn,int cPage, int numPerPage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectView");
		List<PetsitterView> list = new ArrayList<PetsitterView>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			PetsitterView f=new PetsitterView();
			f.setUserId(rs.getString("user_id"));
			f.setUserName(rs.getString("user_name"));
			f.setViewCount(rs.getString("view_count"));
			f.setHaveDog(rs.getString("have_dog"));
			f.setFeatures(rs.getString("features"));
			f.setAddress(rs.getString("address"));
			f.setGrade(rs.getString("grade").charAt(0));
			f.setRevPoint(rs.getInt("rev_point"));
			f.setProfileImg(rs.getString("profile_img"));
			f.setIntro1Img(rs.getString("intro1_img"));
			f.setIntro2Img(rs.getString("intro2_img"));
			list.add(f);
			
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
	}
	//펫시터 주소카운트
	public PetsitterView petsitterCountAddr(Connection conn,String addr){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("petsitterCountAddr");
		PetsitterView f = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+addr+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				f = new PetsitterView();
				f.setPetsitterCount(rs.getInt("petsitter_count"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return f;
	}
	//펫시터 전체카운트
	public PetsitterView petsitterCount(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("petsitterCount");
		PetsitterView p = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				p = new PetsitterView();
				p.setPetsitterCount(rs.getInt("petsitter_count"));
//				p.setUserId(rs.getString("user_id"));
//				p.setUserName(rs.getString("user_name"));
//				p.setViewCount(rs.getString("view_count"));
//				p.setHaveDog(rs.getString("have_dog"));
//				p.setFeatures(rs.getString("features"));
//				p.setAddress(rs.getString("address"));
//				p.setGrade(rs.getString("grade").charAt(0));
//				p.setRevPoint(rs.getInt("rev_point"));
//				p.setProfileImg(rs.getString("profile_img"));
//				p.setIntro1Img(rs.getString("intro1_img"));
//				p.setIntro2Img(rs.getString("intro2_img"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return p;
	}
	//페이지바 
	public int selectBoardCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectBoardCount");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
		
	}
	//지역 카운트
	public int localCount(Connection conn, String localName) {
		Statement stmt=null;
		ResultSet rs=null;
		
		// select count(address) from member where address like '?%' and (grade='M' or grade='G');
		
		int result=0;
		try {
			stmt=conn.createStatement();
			String sql="select count(address) from member where address like '"+localName+"%' and (grade='M' or grade='G')";
			rs=stmt.executeQuery(sql);

			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}return result;
	}
	//지역검색
	public List<PetsitterView> areaView(Connection conn, String key, int cPage, int numPerPage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("areaView");
		List<PetsitterView> list = new ArrayList<PetsitterView>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
//			pstmt.set
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PetsitterView p = new PetsitterView();
				p.setUserId(rs.getString("user_id"));
				p.setUserName(rs.getString("user_name"));
				p.setViewCount(rs.getString("view_count"));
				p.setHaveDog(rs.getString("have_dog"));
				p.setFeatures(rs.getString("features"));
				p.setAddress(rs.getString("address"));
				p.setGrade(rs.getString("grade").charAt(0));
				p.setRevPoint(rs.getInt("rev_point"));
				p.setProfileImg(rs.getString("profile_img"));
				p.setIntro1Img(rs.getString("intro1_img"));
				p.setIntro2Img(rs.getString("intro2_img"));
				list.add(p);
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	//지역 페이지바 처리
	public int selectBoardAreaCount(Connection conn, String key) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectBoardAreaCount");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
		
	}
	//지역 전체검색
	public List<PetsitterView> areaAllView(Connection conn,int cPage, int numPerPage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("areaAllView");
		List<PetsitterView> list = new ArrayList<PetsitterView>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PetsitterView p = new PetsitterView();
				p.setUserId(rs.getString("user_id"));
				p.setUserName(rs.getString("user_name"));
				p.setViewCount(rs.getString("view_count"));
				p.setHaveDog(rs.getString("have_dog"));
				p.setFeatures(rs.getString("features"));
				p.setAddress(rs.getString("address"));
				p.setGrade(rs.getString("grade").charAt(0));
				p.setRevPoint(rs.getInt("rev_point"));
				p.setProfileImg(rs.getString("profile_img"));
				p.setIntro1Img(rs.getString("intro1_img"));
				p.setIntro2Img(rs.getString("intro2_img"));
				list.add(p);
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	//등급
	public List<PetsitterView> petsitterGrade(Connection conn, String key, int cPage, int numPerPage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("petsitterGrade");
		List<PetsitterView> list = new ArrayList<PetsitterView>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, key);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PetsitterView p = new PetsitterView();
				p.setUserId(rs.getString("user_id"));
				p.setUserName(rs.getString("user_name"));
				p.setViewCount(rs.getString("view_count"));
				p.setHaveDog(rs.getString("have_dog"));
				p.setFeatures(rs.getString("features"));
				p.setAddress(rs.getString("address"));
				p.setGrade(rs.getString("grade").charAt(0));
				p.setRevPoint(rs.getInt("rev_point"));
				p.setProfileImg(rs.getString("profile_img"));
				p.setIntro1Img(rs.getString("intro1_img"));
				p.setIntro2Img(rs.getString("intro2_img"));
				list.add(p);
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	//등급 카운트
	public PetsitterView petsitterGradeCount(Connection conn, String key){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("petsitterGradeCount");
		PetsitterView f = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, key);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				f = new PetsitterView();
				f.setPetsitterCount(rs.getInt("petsitter_count"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return f;
	}
	//등급 페이지바
	public int selectBoardGradeCount(Connection conn, String key) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectBoardGradeCount");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, key);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
		
	}
	
	//이름검색
	public List<PetsitterView> searchName(Connection conn, String key, int cPage, int numPerPage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("searchName");
		List<PetsitterView> list = new ArrayList<PetsitterView>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PetsitterView p = new PetsitterView();
				p.setUserId(rs.getString("user_id"));
				p.setUserName(rs.getString("user_name"));
				p.setViewCount(rs.getString("view_count"));
				p.setHaveDog(rs.getString("have_dog"));
				p.setFeatures(rs.getString("features"));
				p.setAddress(rs.getString("address"));
				p.setGrade(rs.getString("grade").charAt(0));
				p.setRevPoint(rs.getInt("rev_point"));
				p.setProfileImg(rs.getString("profile_img"));
				p.setIntro1Img(rs.getString("intro1_img"));
				p.setIntro2Img(rs.getString("intro2_img"));
				list.add(p);
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	//이름 페이지바
	public int selectBoardNameCount(Connection conn, String key) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectBoardNameCount");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+key+"%");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
		
	}
	
	//특징검색
	public List<PetsitterView> searchFeatures(Connection conn, List<String> featuresTemp, int cPage, int numPerPage){
		Statement stmt = null;
		ResultSet rs = null;
		List<PetsitterView> list = new ArrayList<PetsitterView>();
		String sql = "select * from (select rownum as rnum, a.* from (SELECT DISTINCT MEMBER.USER_ID,MEMBER.GRADE,"
				+ "MEMBER.USER_NAME,MEMBER.ADDRESS,HAVE_DOG,NVL(APPLY_MEMBER.FEATURES,'없음') FEATURES,"
				+ "NVL(REVIEW.REV_POINT,0) REV_POINT,NVL(VIEW_COUNT,0) VIEW_COUNT,"
				+ "NVL(PROFILE_IMG,'iu.png') PROFILE_IMG,NVL(INTRO1_IMG,'kanghw.png') INTRO1_IMG,"
				+ "NVL(INTRO2_IMG,'kome2.png') INTRO2_IMG "
				+ "FROM MEMBER LEFT OUTER JOIN APPLY_MEMBER ON MEMBER.USER_ID = APPLY_MEMBER.USER_ID "
				+ "LEFT OUTER JOIN REVIEW ON MEMBER.USER_ID = REVIEW.WRITER AND APPLY_MEMBER.PERMIT_STATUS = 'Y' "
				+ "WHERE (MEMBER.GRADE='M' OR MEMBER.GRADE='G') AND ";
				
		
		for(int i=0;i<featuresTemp.size();i++) {
			if(i==(featuresTemp.size()-1)) {
				sql+="FEATURES LIKE '%"+featuresTemp.get(i)+"%' ";
			}else {
				sql+="FEATURES LIKE '%"+featuresTemp.get(i)+"%' OR ";
			}
		}
		sql+= ") a) where rnum between "+((cPage-1)*numPerPage+1)+" and "+(cPage*numPerPage);
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				PetsitterView p = new PetsitterView();
				p.setUserId(rs.getString("user_id"));
				p.setUserName(rs.getString("user_name"));
				p.setViewCount(rs.getString("view_count"));
				p.setHaveDog(rs.getString("have_dog"));
				p.setFeatures(rs.getString("features"));
				p.setAddress(rs.getString("address"));
				p.setGrade(rs.getString("grade").charAt(0));
				p.setRevPoint(rs.getInt("rev_point"));
				p.setProfileImg(rs.getString("profile_img"));
				p.setIntro1Img(rs.getString("intro1_img"));
				p.setIntro2Img(rs.getString("intro2_img"));
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
			 
		}
		return list;
	}
	//특징 페이지바
	public int selectBoardFeaturesCount(Connection conn, List<String> featuresTemp) {
		Statement stmt=null;
		ResultSet rs=null;
		int result=0;
		String sql = "select count(*) FROM MEMBER LEFT OUTER JOIN APPLY_MEMBER ON MEMBER.USER_ID = APPLY_MEMBER.USER_ID"
				+ " where (member.grade='G' or member.grade='M') and ";
		
		for(int i=0;i<featuresTemp.size();i++) {
			if(i==(featuresTemp.size()-1)) {
				sql+="FEATURES LIKE '%"+featuresTemp.get(i)+"%' ";
			}else {
				sql+="FEATURES LIKE '%"+featuresTemp.get(i)+"%' OR ";
			}
		}
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}return result;
		
	}
	
	//둘다검색
	public List<PetsitterView> searchAll(Connection conn, String key, List<String> featuresTemp, int cPage, int numPerPage){
		Statement stmt = null;
		ResultSet rs = null;
		List<PetsitterView> list = new ArrayList<PetsitterView>();
		String sql = "select * from (select rownum as rnum, a.* from (SELECT DISTINCT MEMBER.USER_ID,MEMBER.GRADE,"
				+ "MEMBER.USER_NAME,MEMBER.ADDRESS,HAVE_DOG,NVL(APPLY_MEMBER.FEATURES,'없음') FEATURES,"
				+ "NVL(REVIEW.REV_POINT,0) REV_POINT,NVL(VIEW_COUNT,0) VIEW_COUNT,"
				+ "NVL(PROFILE_IMG,'iu.png') PROFILE_IMG,NVL(INTRO1_IMG,'kanghw.png') INTRO1_IMG,"
				+ "NVL(INTRO2_IMG,'kome2.png') INTRO2_IMG "
				+ "FROM MEMBER LEFT OUTER JOIN APPLY_MEMBER ON MEMBER.USER_ID = APPLY_MEMBER.USER_ID "
				+ "LEFT OUTER JOIN REVIEW ON MEMBER.USER_ID = REVIEW.WRITER AND APPLY_MEMBER.PERMIT_STATUS = 'Y' "
				+ "WHERE (MEMBER.GRADE='M' OR MEMBER.GRADE='G') AND USER_NAME LIKE '%"+key+"%' AND ";
		
		for(int i=0;i<featuresTemp.size();i++) {
			if(i==(featuresTemp.size()-1)) {
				sql+="FEATURES LIKE '%"+featuresTemp.get(i)+"%' ";
			}else {
				sql+="FEATURES LIKE '%"+featuresTemp.get(i)+"%' AND ";
			}
		}
		sql+= ") a) where rnum between "+((cPage-1)*numPerPage+1)+" and "+(cPage*numPerPage);
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				PetsitterView p = new PetsitterView();
				p.setUserId(rs.getString("user_id"));
				p.setUserName(rs.getString("user_name"));
				p.setViewCount(rs.getString("view_count"));
				p.setHaveDog(rs.getString("have_dog"));
				p.setFeatures(rs.getString("features"));
				p.setAddress(rs.getString("address"));
				p.setGrade(rs.getString("grade").charAt(0));
				p.setRevPoint(rs.getInt("rev_point"));
				p.setProfileImg(rs.getString("profile_img"));
				p.setIntro1Img(rs.getString("intro1_img"));
				p.setIntro2Img(rs.getString("intro2_img"));
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return list;
	}
	//둘다 페이지바
	public int selectBoardAllCount(Connection conn,String key ,List<String> featuresTemp) {
		Statement stmt=null;
		ResultSet rs=null;
		int result=0;
		String sql = "select count(*) FROM MEMBER LEFT OUTER JOIN APPLY_MEMBER ON MEMBER.USER_ID = APPLY_MEMBER.USER_ID"
				+ " where (member.grade='G' or member.grade='M') and member.user_name like '%"+key+"%' AND ";
		
		for(int i=0;i<featuresTemp.size();i++) {
			if(i==(featuresTemp.size()-1)) {
				sql+="FEATURES LIKE '%"+featuresTemp.get(i)+"%' ";
			}else {
				sql+="FEATURES LIKE '%"+featuresTemp.get(i)+"%' AND ";
			}
		}
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}return result;
		
	}
}














































