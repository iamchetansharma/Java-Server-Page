<%@page import="java.sql.ResultSetMetaData" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/app.js"></script>
<script src="js/jquery-min.js"></script>
</head>

<%!
Connection con;
Statement st;

	public void init(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test123", "root","password");

			if(con!=null){
				System.out.println("connected");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>

<body>

<table id="table-begin" class="table">
    <thead>
      <tr>
        <th>User Name</th>
        <th>Password</th>
        <th>Option</th>
      </tr>
    </thead>
    <% 
    	try{
    	
    		PreparedStatement ps1 = con.prepareStatement("select * from users");
    		ResultSet rs = ps1.executeQuery();
    		ResultSetMetaData rsmd = rs.getMetaData();
    		int columnCount = rsmd.getColumnCount();

    		while (rs.next()) {
   %>	
   <input type="hidden" id="userNAME" value="<%= rs.getString(1)%>" />
    	<tr id = "<%= rs.getString(1) %>" class="success">
	        <td id="uname"><%= rs.getString(1) %></td>
	        <td id="pname"><%= rs.getString(2) %></td>
	        <td >
	        	<a href="#"> 
	        	  <img src="images/edit.png" id="edit_<%=rs.getString(1)%>"/>
	        	</a>
	        </td>
	        
	        <td>
	        	<a href="delete.jsp?id=<%= rs.getString(1)%>"><img src="images/delete.png" width="25" height="25"/></a>
	        </td>
        </tr>
   <%
       }
    	}catch(Exception e){
         e.printStackTrace();
       }
   
   %> 
   <form action="adduserpassword.jsp" method="post">	
	   <tr>
		  <td>
		  <input id="username" type="text" name="username" placeholder="username"/>
		  </td>
		  <td>
		  <input id="userpass" name="password" placeholder="password"/>
		  </td>
		  <td>
		  <button id ="add" type="button" ><img src="images/add.png" width="25" height="25"/></button>
		  <button id ="add1" type="submit" ><img src="images/add.png" width="25" height="25"/></button>
		  </td>
	   </tr>
     </tbody>
	</table>
</form>

</body>
</html>