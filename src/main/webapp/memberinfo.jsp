<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	MemberDAO mdao = new MemberDAO();
	MemberBean mbean = new MemberBean();
	
	mbean = mdao.oneSelectMember(id);
%>

<center>
<h2>모든 회원 보기</h2>
	<table width="400" border="1">
	<tr height="50">
		<td align="center" width="150">아이디</td>
		<td width="250"><%= mbean.getId() %></td>
	</tr>
	<tr height="50">
		<td align="center" width="150">이메일</td>
		<td width="250"><%= mbean.getEmail() %></td>
	</tr>
	<tr height="50">
		<td align="center" width="150">전화</td>
		<td width="250"><%= mbean.getTel() %></td>
	</tr>
	<tr height="50">
		<td align="center" width="150">취미</td>
		<td width="250"><%= mbean.getHobby() %></td>
	</tr>
	<tr height="50">
		<td align="center" width="150">직업</td>
		<td width="250"><%= mbean.getJob() %></td>
	</tr>
	<tr height="50">
		<td align="center" width="150">나이</td>
		<td width="250"><%= mbean.getAge() %></td>
	</tr>
	<tr height="50">
		<td align="center" width="150">정보</td>
		<td width="250"><%= mbean.getInfo() %></td>
	</tr>
	<tr height="50">
	<td align="center" colspan="2">
		<button onclick="location.href='memberupdateform.jsp?id=<%= mbean.getId() %>'">회원 수정</button>
		<button onclick="location.href='memberdeleteform.jsp?id=<%= mbean.getId() %>'">회원 삭제</button>
		<button onclick="location.href='memberlist.jsp'">목록보기</button>
		<button onclick="location.href='memberjoin.jsp'">회원가입</button>
	</td>
	</tr>
	</table>
</center>


</body>
</html>