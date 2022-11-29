<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // inputId 라는 파라미터명으로 전달되는 문자열 읽어오기
   String inputId=request.getParameter("inputId");
   // dto 는 null 일수도 있고 아닐수도 있다 
   UsersDto dto=UsersDao.getInstance().getData(inputId);
   System.out.println(dto.getId());
%>  
<%-- null 이 아니면 존재하지 않는 아이디(회원가입이 가능한 아이디) --%>
<%if(dto.getId()==null){%>
   {"isExist":true}
<%}else{%> <%-- 만일 null 이면 이미 존재하는 아이디(회원가입이 불가능한 아이디) --%>
   {"isExist":false}
<%}%>