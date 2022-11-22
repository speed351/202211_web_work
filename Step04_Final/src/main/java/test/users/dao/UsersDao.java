package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	private static UsersDao dao;
	//외부 객체 생성할 수 있도록 
	private UsersDao() {
		
	}
	//참조값을 리턴해주는 static 메소드
	public static UsersDao getInstance() {
		if(dao==null) {
			dao=new UsersDao();
		}
		return dao;
	}
	public boolean delete(String id) {
		//필요한 객체를 담을 지역변수 미리 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//Connection Pool에서 Connection 객체를 하나 가져온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성
			String sql = "DELETE FROM users"
					+ " WHERE id=?";
			//sql문의 ?에 바인딩 할 항목이 있다면 하기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			

			//반복문 돌면서 ResultSet에 필요한값 넣기
			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return rowCount>0 ? true : false;
	}
	
	
	public boolean update(UsersDto dto) {
		//필요한 객체를 담을 지역변수 미리 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//Connection Pool에서 Connection 객체를 하나 가져온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성
			String sql = "UPDATE users"
					+ " SET email=?"
					+ " WHERE id=?";
			//sql문의 ?에 바인딩 할 항목이 있다면 하기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getId());
			

			//반복문 돌면서 ResultSet에 필요한값 넣기
			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return rowCount>0 ? true : false;
	}
	
	
	public boolean updatePwd(UsersDto dto) {
		//필요한 객체를 담을 지역변수 미리 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//Connection Pool에서 Connection 객체를 하나 가져온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성
			String sql = "UPDATE users"
					+ " SET pwd=?"
					+ " WHERE id=? AND pwd=?";
			//sql문의 ?에 바인딩 할 항목이 있다면 하기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNewPwd());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPwd());
			

			//반복문 돌면서 ResultSet에 필요한값 넣기
			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return rowCount>0 ? true : false;
	}
	
	public UsersDto getData(String id) {
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs=null;
	      
	      UsersDto dto = new UsersDto();

	      try {
	         conn = new DbcpBean().getConn();
	         String sql = "SELECT pwd, email, profile, regdate"
	               + " FROM users"
	               + " WHERE id=?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, id);
	         
	         rs=pstmt.executeQuery();
	         if(rs.next()) {
	            dto.setId(id);
	            dto.setPwd(rs.getString(1));
	            dto.setEmail(rs.getString(2));
	            dto.setProfile(rs.getString(3));
	            dto.setRegdate(rs.getString(4));
	         }

	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            if (rs != null)
	               rs.close();
	            if (pstmt != null)
	               pstmt.close();
	            if (conn != null)
	               conn.close();
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }

	      return dto;
	   }
	
	
	//회원 한명의 정보를 DB에 저장하고 성공여부를 리턴하는 메소드
	public boolean insert(UsersDto dto) { //UsersDto에 id, pwd, email이 있다.
		//필요한 객체를 담을 지역변수 미리 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		
		try {
			//Connection Pool에서 Connection 객체를 하나 가져온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성
			String sql = "INSERT INTO users"
					+ " (id, pwd, email, regdate)"
					+ " VALUES(?, ?, ?, sysdate)";
			//sql문의 ?에 바인딩 할 항목이 있다면 하기
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());

			//select 문을 수행하고 결과값을 받아온다.
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return rowCount > 0 ? true : false;
	}
	
	//로그인 시에 실제로 존재하는 회원의 정보인지 확인하는 메소드
	public boolean isValid(UsersDto dto) {
		//id pwd 유효성 검사 여부를 담을 변수를 만들고 초기값을 false로 부여
		boolean isValid = false;
		
		//필요한 객체를 담을 지역변수 미리 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//Connection Pool에서 Connection 객체를 하나 가져온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성
			String sql = "SELECT id, pwd"
					+ " FROM users"
					+ " WHERE id=? AND pwd=?";
			//sql문의 ?에 바인딩 할 항목이 있다면 하기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			//select 문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에 필요한값 넣기
			if (rs.next()) {
				//Select된 row가 있으면 유효한 id,pwd 정보가 맞으므로 true를 반환함
				isValid = true;

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
	            if (rs != null)
	                rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return isValid;
	}
}
