<%@page import="bean.sachbean"%>
<%@page import="bo.sachbo"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.loaibo"%>
<%@ page import="bo.giohangbo"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li class="active"><a href="htsach">Trang chủ</a></li>
				<%if(session.getAttribute("slsp") == null ) {%>
	      		<li><a href="gio-hang.jsp">Giỏ hàng (0)</a></li>
	      		<% } else { %>
	      		<li><a href="gio-hang.jsp">Giỏ hàng (<%=session.getAttribute("slsp")%>)</a></li>
	      		<%} %>
				<li><a href="#">Thanh toán</a></li>
				<li><a href="#">Lịch sử mua hàngg</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<%
				if (session.getAttribute("dn") != null) {
				%>
				<li><a href="logout.jsp"><span
						class="glyphicon glyphicon-user"></span> Logout</a></li>

				<li><a href="dangnhap.jsp"> <span
						class="glyphicon glyphicon-log-in"></span> Hi: <%=session.getAttribute("dn")%>
				</a></li>
				<%
				} else {
				%>
				<li><a href="logout.jsp"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>

				<li><a href="dangnhap.jsp"> <span
						class="glyphicon glyphicon-log-in"></span> Login <%
				 }
				 %>
			</ul>

		</div>
	</nav>
	<table width="1000" align="center">
		<tr>
			<td width="200" valign="top">
				<table>
					<%
					ArrayList<loaibean> dsloai = new ArrayList<>();
					if (request.getAttribute("dsloai") != null) {
					  dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");
					}
					for (loaibean l : dsloai) {
					%>
					<tr>
						<td><a href="htsach?ml=<%=l.getMaloai()%>"> <%=l.getTenloai()%>
						</a></td>
					</tr>
					<%
					}
					%>
				</table>
			</td>
			<td width="600" valign="top">
				<table class="table">

					<%
					ArrayList<sachbean> dssach = new ArrayList<>();
					if (request.getAttribute("dssach") != null) {
					  dssach = (ArrayList<sachbean>) request.getAttribute("dssach");
					}
					int n = dssach.size();
					for (int i = 0; i < n; i++) {
					  sachbean s = dssach.get(i);
					%>
					<tr>
						<td><img src="<%=s.getAnh()%>"> <br> <%=s.getTensach()%>
							<br> <%=s.getGia()%> <br> <a
							href="giohang.jsp?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>">
								<img src="buynow.jpg">
						</a>
							<hr></td>
						<%
						i++;
						if (i < n) {
						  s = dssach.get(i);
						%>
						<td><img src="<%=s.getAnh()%>"> <br> <%=s.getTensach()%>
							<br> <%=s.getGia()%> <br> <a
							href="giohang.jsp?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>">
								<img src="buynow.jpg">
						</a>
							<hr></td>
						<%
						}
						%>

					</tr>
					<%
					}
					%>
				</table>
			</td>
			<td width="200" valign="top">
				<form action="htsach" method="get">
					<input class="form-control" name="txttk" type="text" value=""
						placeholder="Nhap tt"> <br> <input
						class="btn-primary" name="butdn" type="submit" value="Search">
				</form>

			</td>
		</tr>
	</table>
</body>
</html>
