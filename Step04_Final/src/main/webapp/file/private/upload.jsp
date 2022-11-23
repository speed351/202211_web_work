<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//파일 시스템 상에서 webapp의 upload 폴더까지의 절대경로를 얻어낸다.
	String realPath = application.getRealPath("/upload");
	//해당 경로를 access할 수 있는 파일 객체 생성
	File f = new File(realPath);
	if(!f.exists()){	//만약 폴더가 존재하지 않으면
		f.mkdir();		//upload 폴더 만들기
	}
	
	//cos.jar 파일에 있는 MultipartRequest 클래스로 객체 생성
	MultipartRequest mr = new MultipartRequest(request, // 내부적으로 필요한 HttpServeltRequest 객체 전달
						realPath, 						// 업로드 된 파일을 저장할 경로
						1024*1024*100, 					// 최대 업로드 사이즈 제한
						"utf-8", 						// 한글 파일명 깨지지 않도록 
						new DefaultFileRenamePolicy());	// 동일한 파일이 존재한다면 자동으로 파일을 rename해서 저장
	
	/*
		위의 MultipartRequest 객체가 예외가 발생하지 않고 잘 생성되었다면 파일업로드가 성공된 것인다.
		따라서 mr에 들어있는 참조값을 이용해서 ㅍ ㅗㅁ전송된 값을 추출해서 DB에 저장만 잘 하면 된다.
	
	*/
	//2. 폼 전송하는 title을 읽어온다.
	String title = mr.getParameter("title");
	//3. 파일의 작성자(업로더)는 HttpSession 객체에서 읽어온다.
	String writer = (String)session.getAttribute("id");
	//4. 추가로 원본 파일명, 저장된 파일명, 파일사이즈도 얻어내서 FileDto 객체에 담아서 저장
	
	//파일 목록을 출력할 때, 파일을 다운로드 해줄때 필요하다(웹브라우저가 정확한 파일명으로 파일을 만들어야 하기 때문)
	String orgFileName = mr.getOriginalFileName("myFile");
	//파일을 다운로드 할 때 필요하다.
	String saveFileName = mr.getFilesystemName("myFile");
	long fileSize = mr.getFile("myFile").length();
	//업로드된 파일정보를 FileDto에 담고
	FileDto dto = new FileDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setOrgFileName(orgFileName);
	dto.setSaveFileName(saveFileName);
	dto.setFileSize(fileSize);
	
	boolean isSuccess = FileDao.getInstance().insert(dto);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess){ %>
		<p>
			<%=writer %> 님이 업로드한 <%=orgFileName %>파일을 저장했습니다.
			<a href="${pageContext.request.contextPath}/file/list.jsp">목록보기</a>
		</p>
		<p><%=realPath %></p>
	
	<%}else{%>
		<p>
			업로드 실패!
			<a href="upload_form.jsp">다시 시도</a>
		</p>
	<%} %>
</body>
</html>