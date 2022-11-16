<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bo.giohangbo"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String masach = request.getParameter("ms");

	giohangbo gh;

	gh = (giohangbo) session.getAttribute("gio");
	
	if (request.getParameter("btnsua") != null) {
	  long soluong = Long.parseLong(request.getParameter("txtsl"));
	  gh.Them(masach, "", 0, soluong);
	} else 
	  gh.Xoa(masach);
	  

	session.setAttribute("gio", gh);

	if (request.getParameter("btnxoaall") != null) {
	  session.removeAttribute("gio");
	}

	response.sendRedirect("htgio.jsp");
	%>
</body>
</html>