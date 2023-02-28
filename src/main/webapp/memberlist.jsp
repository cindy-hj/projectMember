<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberBean" %>
<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberDAO mdao = new MemberDAO();
	Vector<MemberBean> vec = mdao.allSelectMember();
%>
	<center>
	<h2>모든 회원 보기</h2>
	<table width="800" border="1">
		<tr height="50">
			<td align="center" width="150">아이디</td>
			<td align="center" width="250">이메일</td>
			<td align="center" width="200">전화번호</td>
			<td align="center" width="200">취미</td>
		</tr>
		<%
			for(int i=0; i<vec.size(); i++) {
				MemberBean bean = vec.get(i);
				%>
		<tr height="50">
			<td align="center" width="150">
			<a href="memberinfo.jsp?id=<%=bean.getId() %>">
			<%=bean.getId() %>
			</a>
			<td align="center" width="250"><%=bean.getEmail() %></td>
			<td align="center" width="200"><%=bean.getTel() %></td>
			<td align="center" width="200"><%=bean.getHobby() %></td>
			</td>
		</tr>
				<%
			}
		%>
	</table>
	</center>

</body>
</html>