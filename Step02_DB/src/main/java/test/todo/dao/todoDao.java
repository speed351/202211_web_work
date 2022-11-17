package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.todo.dto.todoDto;
import test.util.DbcpBean;

public class todoDao {
	//오직 한개만 생성된 todoDao type 객체의 참조값을 담을 static 필드
	private static todoDao dao;
	//생성자 정의
	private todoDao() {
	
	}
	
	public static todoDao getInstance() {
		if(dao == null) {
			dao = new todoDao();
		}
		return dao;
	}
	
	
	public List<todoDto> getList(){
		List<todoDto> list = new ArrayList<>();
		//필요한 객체를 담을 지역변수 미리 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 가져온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성
			String sql = "SELECT num, content, regdate"
					+ " FROM todo "
					+ " ORDER by num ASC";
			//sql문의 ?에 바인딩 할 항목이 있다면 하기

			pstmt = conn.prepareStatement(sql);
			//select 문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에 필요한값 넣기
			while (rs.next()) {
				todoDto dto = new todoDto();
				dto.setNum(rs.getInt("num"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getString("regdate"));
				list.add(dto);
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
		
		return list;
	}
	
	public boolean delete(int num) {
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "DELETE FROM todo"
					+ " WHERE num=?";
			
			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할게 있으면 바인딩하기
			pstmt.setInt(1, num);
			
			
			//SELECT문을 수행하고 결과값을 얻어온다.
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close(); //Connection Pool에 Connection 반납하기
			} catch (Exception e) {}
		}
		return rowCount > 0 ? true : false;
	}
	
	public boolean insert(todoDto dto) {
		//필요한 객체를 담을 지역변수 미리 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount=0;
		try {
			//Connection Pool에서 Connection 객체를 하나 가져온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성
			String sql = "INSERT into todo"
					+ " (num, content, regdate)"
					+ " VALUES(todo_seq.NEXTVAL, ?, TO_DATE(?, 'YYYY/MM/DD HH24:mi:ss'))";
			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할 항목이 있다면 하기			
			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.getDate());
			
			//select 문을 수행하고 결과값을 받아온다.
			rowCount=pstmt.executeUpdate();

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
	
	public boolean update(todoDto dto) {		
		Connection conn=null;
	    PreparedStatement pstmt=null;
	    //수정된 row의 개수를 담을 지역변수를 미리 만들고 초기값 0 대입하기
	    int rowCount = 0;
	    try {
	       //Connection 객체의 참조값 얻어오기
	       conn=new DbcpBean().getConn();
	       //실행할 미완성의 sql 문
	       String sql="UPDATE todo"
	       		+ " SET content=?, regdate=TO_DATE(?, 'YYYY/MM/DD HH24:mi')"
	       		+ " WHERE num = ?";
	       //PreparedStatement 객체의 참조값 얻어오기
	       pstmt=conn.prepareStatement(sql);
	       //? 에 값 바인딩하기 
	       pstmt.setString(1, dto.getContent());
	       pstmt.setString(2, dto.getDate());
	       pstmt.setInt(3, dto.getNum());
	       //sql 문 실행하기
	       //pstmt.executeUpdate();
	       //sql문을 실행하고 변화된(insert,update,delete) row 갯수 리턴받기 (executeUpdate의 return값)
	       rowCount = pstmt.executeUpdate();
	    }catch(Exception e) {
	       e.printStackTrace();
	    }finally {
	       try {
	          if(pstmt!=null)pstmt.close();
	          if(conn!=null)conn.close();
	       }catch(Exception e) {}
	    }      
	     
	    if(rowCount>0) {
	 	   return true;
	    }else {
	 	   return false;
	    }
	}
	
	
	   //회원 한명의 정보를 리턴하는 메소드
	   public todoDto getData(int num) {
	      
		  todoDto dto=null;
	      
	      //필요한 객체를 담을 지역변수를 미리 만들어 둔다. 
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         //Connection Pool 에서 Connection 객체를 하나 얻어온다.
	         conn = new DbcpBean().getConn();
	         //실행할 sql 문의 뼈대 구성하기
	         String sql = "SELECT content, regdate"
	               + " FROM todo"
	               + " WHERE num=?";
	         pstmt = conn.prepareStatement(sql);
	         //sql 문의 ? 에 바인딩 할게 있으면 한다.
	         pstmt.setInt(1, num);
	         //SELECT 문을 수행하고 결과값을 받아온다.
	         rs = pstmt.executeQuery();
	         //만일 select 된 row 가 있다면 (커서 다음에 select 된 row 가 있다면)
	         if (rs.next()) {
	            //MemberDto 객체를 생성해서 회원 한명의 정보를 담는다.
	            dto=new todoDto();
	            dto.setNum(num);
	            dto.setContent(rs.getString("content"));
	            dto.setDate(rs.getString("regdate"));
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
	               conn.close(); //Connection Pool 에 Connection 반납하기
	         } catch (Exception e) {
	         }
	      }
	      return dto;
	   }
}
