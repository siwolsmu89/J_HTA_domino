package com.domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.domino.util.ConnectionUtil;
import com.domino.util.QueryUtil;
import com.domino.vo.User;

public class UserDao {
	
	/**
	 * ResultSet에서 가져온 정보들을 User에 담는 메소드. 다른 메소드 안에서만 사용할 것이므로 private 제한자를 지정
	 * @param ResultSet rs
	 * @return 정보가 채워진 User 객체
	 * @throws SQLException
	 * @author 민석
	 */
	private User resultSetToUser(ResultSet rs) throws SQLException {
		User user = new User();
		
		user.setNo(rs.getInt("user_no"));
		user.setId(rs.getString("user_id"));
		user.setPassword(rs.getString("user_password"));
		user.setName(rs.getString("user_name"));
		user.setBirth(rs.getDate("user_birth"));
		user.setGender(rs.getString("user_gender"));
		user.setTel(rs.getString("user_tel"));
		user.setEmail(rs.getString("user_email"));
		user.setRegDate(rs.getDate("user_reg_date"));
		user.setGradeName(rs.getString("user_grade_name"));
		user.setGradeDate(rs.getDate("user_grade_date"));
		user.setQuitYn(rs.getString("user_quit_yn"));
		user.setQuitReason(rs.getString("user_quit_reason"));
		user.setQuitDetail(rs.getString("user_quit_detail"));
		user.setOrderCount(rs.getInt("user_order_count"));
		user.setQuickOrderNo(rs.getInt("quick_order_no"));
		
		return user;
	}

	/**
	 * user번호로 User 정보를 조회하는 메소드
	 * @param userNo 사용자 번호
	 * @return 조회에 성공하면 정보가 들어 있는 User 객체가 반환되고, 조회에 실패하면 null이 반환
	 * @throws SQLException
	 * @author 민석
	 */
	public User getUserByNo(int userNo) throws SQLException {
		User user = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getUserByNo"));
		pstmt.setInt(1, userNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			user = resultSetToUser(rs);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return user;
	}
	
	public User getUserById(String userId) throws SQLException{
		User user = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getUserById"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			user = resultSetToUser(rs);
			
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return user;
	}
	
	/**
	 * user객체에 데이터를 담아 DB에 등록하는 메소드
	 * @param user 입력폼에 입력한 데이터를 담아 DB에 저장
	 * @throws SQLException
	 * @author 하영
	 */
	public void insertUser(User user) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.insertUser"));
		
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getName());
		pstmt.setString(3, user.getPassword());
		pstmt.setDate(4, new java.sql.Date(user.getBirth().getTime()));
		pstmt.setString(5, user.getGender());
		pstmt.setString(6, user.getTel());
		pstmt.setString(7, user.getEmail());
		pstmt.executeUpdate();
		
		connection.close();
		pstmt.close();
	}
	
	/**
	 * DB에 존재하는 user 데이터를 업데이트하는 메소드
	 * @param 새로 변경할 사용자 정보가 담긴 User 객체 user
	 * @throws SQLException
	 * @author 민석
	 */
	public void updateUser(User user) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.updateUser"));
		
		pstmt.setString(1, user.getPassword());
		pstmt.setString(2, user.getTel());
		pstmt.setString(3, user.getEmail());
		pstmt.setString(4, user.getGradeName());
		pstmt.setString(5, user.getQuitYn());
		pstmt.setString(6, user.getQuitReason());
		pstmt.setString(7, user.getQuitDetail());
		pstmt.setInt(8, user.getOrderCount());
		pstmt.setInt(9, user.getQuickOrderNo());
		pstmt.setInt(10, user.getNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
}
