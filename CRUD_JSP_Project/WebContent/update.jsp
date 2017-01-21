<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="obj" class="com.demo.doa.UserDAO" />
	<%
		String id = request.getParameter("id");
		String uname = request.getParameter("uname");
		String password = request.getParameter("password");
		int x = obj.updateUser(uname, password, id);
		response.sendRedirect("view.jsp");
	%>
</body>
</html>