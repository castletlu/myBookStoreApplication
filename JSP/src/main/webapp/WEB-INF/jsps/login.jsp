<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="/css/login.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<%
 	if( session.getAttribute("flag")!=null ) 
	{
		response.sendRedirect("home");
	}
	
	%>
	<div class="wrapper">
		<div class="container">		
			<h1>Login Form</h1>
			<form  class ="form" action="check" method="post" >
				<%
				if(request.getParameter("error") != null){
					out.print("<p style='color:red'>Sai tên đăng nhập hoặc mật khẩu </p>");
				}
				%>
				
				
				<div>
					
					<input type="text" name="username" value="" placeholder="User Name"/>
				</div>
				<br />
				<div>
					
					<input type="password" name="password" value="" placeholder="Password"/>
				</div>
				<br />
				<div>
					<input type="submit" name="submit" value="Login" />					
				</div>
			</form>
		</div>	
			
			
		<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		</ul>
		</div>
	
		
	</body>
</html>