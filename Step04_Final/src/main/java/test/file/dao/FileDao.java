package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	//static 필드
	private static FileDao dao;
	//외부에서 생성하지 못하도록 생성자를 private로
	private FileDao() {}
	//자신의 참조값을 리턴해주는 메소드
	public static FileDao getInstance() {
		if(dao==null) {
			dao=new FileDao();
		}
		return dao;
	}
	
	public boolean delete(int num) {
		//필요한 객체를 담을 지역변수 미리 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount=0;
		try {
			//Connection Pool에서 Connection 객체를 하나 가져온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성
			String sql = "DELETE FROM board_file"
					+ " WHERE num = ?";
			//sql문의 ?에 바인딩 할 항목이 있다면 하기

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	
	//파일 하나의 정보를 리턴하는 메소드
	public FileDto getData(int num) {
		//필요한 객체를 담을 지역변수 미리 선언

		FileDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 가져온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성
			String sql = "SELECT writer, title, orgFileName, saveFileName, fileSize, regdate"
					+ " FROM board_file"
					+ " WHERE num=?";
			//sql문의 ?에 바인딩 할 항목이 있다면 하기

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			//select 문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에 필요한값 넣기
			if (rs.next()) {
				dto = new FileDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
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
	
	
	//업로드 된 파일 정보를 DB에 저장하는 메소드
	public boolean insert(FileDto dto) {
		//필요한 객체를 담을 지역변수 미리 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//Connection Pool에서 Connection 객체를 하나 가져온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성
			String sql = "INSERT into board_file"
					+ " (num, writer, title, orgFileName, saveFileName, fileSize, regdate)"
					+ " VALUES(board_file_seq.nextval, ?, ?, ?, ?, ?, SYSDATE)";
			//sql문의 ?에 바인딩 할 항목이 있다면 하기
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getOrgFileName());
			pstmt.setString(4, dto.getSaveFileName());
			pstmt.setLong(5, dto.getFileSize());
						
			//select 문을 수행하고 결과값을 받아온다.
			rowCount = pstmt.executeUpdate();
			//반복문 돌면서 ResultSet에 필요한값 넣기

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
	
	
	public List<FileDto> getList(){
		//파일 목록을 담을 ArrayList 생성
		List<FileDto> list = new ArrayList<FileDto>();
		
		//필요한 객체를 담을 지역변수 미리 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 가져온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성
			String sql = "SELECT num, writer, title, orgFileName, fileSize, TO_CHAR(regdate, 'YYYY.MM.DD') regdate"
					+ " FROM board_file"
					+ " ORDER by num DESC";
			//sql문의 ?에 바인딩 할 항목이 있다면 하기

			pstmt = conn.prepareStatement(sql);
			//select 문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에 필요한값 넣기
			while (rs.next()) {
				FileDto dto = new FileDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
				dto.setRegdate(rs.getString("regdate"));
				
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
	
}
