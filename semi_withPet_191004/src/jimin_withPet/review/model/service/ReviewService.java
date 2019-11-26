package jimin_withPet.review.model.service;

import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import jimin_withPet.model.vo.Review;
import jimin_withPet.review.model.dao.ReviewDao;


public class ReviewService {
	
	private ReviewDao dao = new ReviewDao();
	
	
	public Double avgReviewPoint(String id) {
		Connection conn = getConnection();
		Double point = dao.avgReviewPoint(conn, id);
		close(conn);
		return point;
		
	}
	
	public List<Review> selectReviewList(String id){
		Connection conn = getConnection();
		List<Review> list = dao.selectReviewList(conn, id);
		close(conn);
		return list;
	}

}
