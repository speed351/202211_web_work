<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 삭제할 파일 번호를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));

	//2. 해당 파일의 정보를 DB에서 읽어온다.
	FileDto dto = FileDao.getInstance().getData(num);
	
	//삭제 작업을하기 전에 로그인된 아이디와 글 작성자가 같은지 확인해서 같을때만 삭제하도록 한다.
	String id = (String)session.getAttribute("id");
	if(!dto.getWriter().equals(id)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "삭제 권한이 없습니다.");
		return;
	}
	
	
	//3. 파일 시스템에서 삭제한다(webapp/upload 폴더에서 해당 파일을 삭제)
	String path = application.getRealPath("/upload")+File.separator+dto.getSaveFileName();
	//삭제할 파일의 전체 경로를 이용해서 File 객체 생성 후 해당 파일 삭제하기
	File f = new File(path);
	f.delete();
	//4. DB에서도 해당 파일의 정보를 삭제
	boolean isSuccess = FileDao.getInstance().delete(num);
	//5. 응답하기
	if(isSuccess){
		String cPath = request.getContextPath();
		response.sendRedirect(cPath+"/file/list.jsp");
	}
%>