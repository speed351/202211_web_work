package test.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.board.dto.BoardDto;
import test.util.DbcpBean;

public class BoardDao {
	private static BoardDao dao;
	/*
	 * static 메소드는 생성자를 호출하지 않고 클래스명으로 바로 호출을 하기 때문에 메소드 호출전에 무언가 준비 작업을 하고 싶다면
	 * static 블럭 안에서 하면 된다. static 블럭은 해당 클래스를 최초로 사용할 때 한번만 실행되기 때문에 초기화 작업을 하기에
	 * 적당한 블럭이다.
	 */
	static {
		if (dao == null) {
			dao = new BoardDao();
		}
	}

	private BoardDao() {
	}

	public static BoardDao getInstance() {

		return dao;
	}

	// 전체 글의 갯수를 리턴하는 메소드
	public int getCount() {
		// 글의 갯수를 담을 지역변수
		int count = 0;
		// 필요한 객체를 담을 지역변수 미리 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// Connection Pool에서 Connection 객체를 하나 가져온다.
			conn = new DbcpBean().getConn();
			// 실행할 sql문의 뼈대 구성
			String sql = "SELECT MAX(ROWNUM) as num FROM board_cafe";
			// sql문의 ?에 바인딩 할 항목이 있다면 하기

			pstmt = conn.prepareStatement(sql);
			// select 문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet에 필요한값 넣기
			if (rs.next()) {
				count = rs.getInt("num");
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
		return count;
	}

	public boolean addViewCount(int num) {
		// 필요한 객체를 담을 지역변수 미리 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			// Connection Pool에서 Connection 객체를 하나 가져온다.
			conn = new DbcpBean().getConn();
			// 실행할 sql문의 뼈대 구성
			String sql = "UPDATE board_cafe" + " set viewCount=viewCount+1" + "	WHERE num=?";
			// sql문의 ?에 바인딩 할 항목이 있다면 하기

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			// select 문을 수행하고 결과값을 받아온다.
			rowCount = pstmt.executeUpdate();
			// 반복문 돌면서 ResultSet에 필요한값 넣기

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

	public boolean delete(int num) {
		// 필요한 객체를 담을 지역변수 미리 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int rowCount = 0;
		try {
			// Connection Pool에서 Connection 객체를 하나 가져온다.
			conn = new DbcpBean().getConn();
			// 실행할 sql문의 뼈대 구성
			String sql = "DELETE FROM board_cafe" + "	WHERE num=?";
			// sql문의 ?에 바인딩 할 항목이 있다면 하기

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			// select 문을 수행하고 결과값을 받아온다.
			rowCount = pstmt.executeUpdate();
			// 반복문 돌면서 ResultSet에 필요한값 넣기

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
		return rowCount > 0 ? true : false;
	}

	public boolean update(BoardDto dto) {
		// 필요한 객체를 담을 지역변수 미리 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int rowCount = 0;
		try {
			// Connection Pool에서 Connection 객체를 하나 가져온다.
			conn = new DbcpBean().getConn();
			// 실행할 sql문의 뼈대 구성
			String sql = "UPDATE board_cafe" + " SET title=?, content=?" + " WHERE num=?";
			// sql문의 ?에 바인딩 할 항목이 있다면 하기

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());

			// select 문을 수행하고 결과값을 받아온다.
			rowCount = pstmt.executeUpdate();
			// 반복문 돌면서 ResultSet에 필요한값 넣기

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
		return rowCount > 0 ? true : false;
	}

	// 글 하나의 정보를 리턴해주는 메소드
	public BoardDto getData(int num) {
		BoardDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			// select 문의 뼈대 구성하기
			String sql = "SELECT writer, title, content, viewCount, regdate" + " FROM board_cafe" + " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 할게 있으면 하기
			pstmt.setInt(1, num);
			// sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new BoardDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
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
		return dto;
	}

	public List<BoardDto> getList(BoardDto dto) {

		List<BoardDto> list = new ArrayList<BoardDto>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			// select 문의 뼈대 구성하기
			String sql = "SELECT *" 
					+ "	FROM (SELECT result1.*, rownum as rnum" 
					+ "	from"
					+ "		(select num,writer,title,viewcount, to_char(regdate, 'YYYY/MM/DD HH24:MI') as regdate"
					+ "		from board_cafe" 
					+ "		order by num desc) result1)" 
					+ "where rnum between ? and ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			// ? 에 값 바인딩 할게 있으면 하기

			// sql 문 수행하고 ResultSet 객체 얻어내기
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// select 된 row 하나의 정보를 CafeDto 객체를 생성해서 담고
				BoardDto dto2 = new BoardDto();
				dto2.setNum(rs.getInt("num"));
				dto2.setWriter(rs.getString("writer"));
				dto2.setTitle(rs.getString("title"));
				dto2.setViewCount(rs.getInt("viewCount"));
				dto2.setRegdate(rs.getString("regdate"));
				// CafeDto 객체의 참조값을 List 에 누적 시키기
				list.add(dto2);
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

	public boolean insert(BoardDto dto) {

		// 필요한 객체를 담을 지역변수 미리 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			// Connection Pool에서 Connection 객체를 하나 가져온다.
			conn = new DbcpBean().getConn();
			// 실행할 sql문의 뼈대 구성
			String sql = "INSERT into board_cafe " + " (num, writer, title, content, viewCount, regdate )"
					+ "	VALUES(board_cafe_seq.NEXTVAL, ?, ?, ?, 0, SYSDATE)";
			// sql문의 ?에 바인딩 할 항목이 있다면 하기

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());

			// select 문을 수행하고 결과값을 받아온다.
			rowCount = pstmt.executeUpdate();
			// 반복문 돌면서 ResultSet에 필요한값 넣기

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

}
