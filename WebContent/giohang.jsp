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
	String tensach = request.getParameter("ts");
	long gia = Long.parseLong(request.getParameter("gia"));
	giohangbo gh;
	if (session.getAttribute("gio") == null) { //neu mua lan dau
	  gh = new giohangbo();
	  session.setAttribute("gio", gh);//cap phat gio
	}
	//b1: gan sesion vao bien
	gh = (giohangbo) session.getAttribute("gio");
	//b2: thao tac tren bien
	gh.Them(masach, tensach, gia, (long) 1);
	//b3: luu bien vao sesion

	session.setAttribute("gio", gh);
	session.setAttribute("slsp", gh.ds.size());
	response.sendRedirect("htgio.jsp");
	%>
</body>
</html>