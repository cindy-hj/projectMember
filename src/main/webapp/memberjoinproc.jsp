<%@page import="member.MemberDAO"%>
<%@page import="java.util.Arrays"%>
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
	
		String[] hobby = request.getParameterValues("hobby");
		String texthobby = "";
		for(int i=0; i<hobby.length; i++) {
			texthobby += hobby[i]+" ";
		}
		
	%>
	<jsp:useBean id="mbean" class="member.MemberBean">
		<jsp:setProperty name="mbean" property="*" />
	</jsp:useBean>
<!-- insert 부분 구성 -->
<%
	mbean.setHobby(texthobby);
	MemberDAO mdao = new MemberDAO();
	mdao.insertMember(mbean);
	
	response.sendRedirect("memberlist.jsp");
%>
</body>
</html>