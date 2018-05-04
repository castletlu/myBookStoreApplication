<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<%
	String name = request.getParameter( "username" );
   session.setAttribute( "theName", name );
   String pass = request.getParameter( "password" );
   session.setAttribute( "thePass", pass );
   
 	if (pass.equals("123")) {		
 		session.setAttribute( "flag", true );
		response.sendRedirect("home");
		
	} else {	
		response.sendRedirect("login?error=0");
	}
%>
<BODY>
</BODY>
</HTML>