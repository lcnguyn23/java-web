<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   	String un=request.getParameter("txtun");
   	String pass=request.getParameter("txtpass");
   	if(un.equals("nhha")&&pass.equals("123")){
   		session.setAttribute("dn", un); 	
	   	response.sendRedirect("htsach.jsp");//Mo trang htsach
   	}
	else {
		response.sendRedirect("dangnhap.jsp?kt=1");
	}
   
%>
</body>
</html>
