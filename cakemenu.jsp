<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="sql.FoodSql"%>
<%@ page import="entity.Food"%>
<%@ page import="javax.servlet.*,javax.servlet.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>
</head>
<body>
	<link rel="stylesheet"
		href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">


	<style type="text/css">
html {
	height: 100%;
}

body {
	min-height: 100%;
	margin: 0;
	padding: 0;
	position: relative;
}

.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 100px;
	background-color: #ffc0cb;
}
</style>
	<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-size: 12px;
}

ul {
	list-style: none;
}

.slider {
	width: auto;
	padding: 10px 20px;
	height: 300px;
	margin: 0px auto;
	position: relative;
	cursor: pointer;
}

#slider_pic {
	width: auto;
	margin: 0 auto;
	overflow: hidden;
	height: 300px;
	position: relative;
}

.prev, .next {
	position: absolute;
	width: 20px;
	height: 20px;
	cursor: pointer;
	top: 60px;
	background-color: #daa520;
	text-align: center;
	line-height: 20px;
	font-weight: bold;
	color: #fff;
}

.next {
	right: 20px;
}

.no_click {
	background-color: #808080;
}

#slider_pic li {
	float: left;
	margin-right: 10px;
}

#slider_pic ul {
	position: absolute;
	left: 0;
}
</style>

	<script type="text/javascript">
		$(function() {
			var oPic = $('#slider_pic').find('ul');
			var oImg = oPic.find('li');
			var oLen = oImg.length;
			var oLi = oImg.width();
			var prev = $("#prev");
			var next = $("#next");

			oPic.width(oLen * 210);//计算总长度
			var iNow = 0;
			var iTimer = null;
			prev.click(function() {
				if (iNow > 0) {
					iNow--;

				}
				ClickScroll();
			})
			next.click(function() {
				if (iNow < oLen - 3) {
					iNow++
				}
				ClickScroll();
			})

			function ClickScroll() {

				iNow == 0 ? prev.addClass('no_click') : prev
						.removeClass('no_click');
				iNow == oLen - 3 ? next.addClass("no_click") : next
						.removeClass("no_click");

				oPic.animate({
					left : -iNow * 210
				})
			}

		})
	</script>

	<style type="text/css">
#nav {
	margin: 50px auto;
	height: 40px;
	background-color: #690;
}

#nav ul {
	align-content: center;
	list-style: none;
	margin-left: 50px;
}

#nav li {
	display: inline;
}

#nav a {
	line-height: 40px;
	color: #fff;
	text-decoration: none;
	padding: 20px 20px;
}

#nav a:hover {
	background-color: #060;
}
</style>
	<style>
.button1 {
	padding: 6px 12px;
	text-align: center;
	background-color: white;
	color: black;
	border: 2px solid #690;
	border-radius: 5px;
}

.button1:hover {
	background-color: #690;
	color: white;
}
</style>
	<style type="text/css">
.cardBox {
	width: 200px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	text-align: center;
	float: left;
	margin-right: 10px;
	padding: 5px;
	padding-top: 15px;
}

.headerBox {
	color: #690;
	padding: 10px;
	font-size: 15px;
	height: 60px;
}

.bodyBox {
	padding: 10px;
}

.bodyBox p {
	margin-left: 5px;
}
</style>
	<style type="text/css">
html {
	font-family: sans-serif;
	-ms-text-size-adjust: 100%;
	-webkit-text-size-adjust: 100%;
}

body {
	margin: 30px;
}

table {
	margin: 50px auto;
	border-collapse: collapse;
	border-spacing: 0;
}

td, th {
	padding: 0;
}

.pure-table {
	empty-cells: show;
}

.pure-table caption {
	color: #000;
	font: italic 85%/1 arial, sans-serif;
	padding: 1em 0;
	text-align: left;
}

.pure-table td, .pure-table th {
	font-size: inherit;
	margin: 0;
	overflow: visible;
	padding: .5em 1em;
}

.pure-table thead {
	background-color: #690;
	color: #000;
	text-align: left;
	vertical-align: bottom;
}

.pure-table td {
	background-color: transparent;
}
</style>
	<style type="text/css">
.horizontal {
	float: left; //
	添加float样式即可实现水平排列 border: 1px solid black;
	margin-left: 20px;
}
</style>
	<style type="text/css">
html {
	height: 100%;
}

body {
	min-height: 100%;
	margin: 0;
	padding: 0;
	position: relative;
}

.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 100px;
	background-color: #ffc0cb;
}
</style>
</head>
<body>

	<body>

		<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><b>cafe</b></a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li><a href="#">Home Page</a></li>
					<li class="active"><a href="operatormenu.jsp">Menu</a></li>
					<li><a href="#">Shopping Cart</a></li>
					<li><a href="#">My Order</a></li>
					<li><a href="myAccount.jsp">My Account</a></li>

				</ul>
			</div>
		</div>
	</nav>


	<div class="slider">
		<span class="prev no_click" id="prev"><<</span> <span class="next "
			id="next">>></span>
		<div id="slider_pic">
			<ul>
				<li><img src="4D2A6705.jpg" width="auto" height="300px" /></li>
				<li><img src="000012090005.jpg" width="auto" height="300px" /></li>
				<li><img src="3334.png" width="auto" height="300px" /></li>
				<li><img src="4443.png" width="auto" height="300px" /></li>
				<li><img src="bzbbbbb.png" width="auto" height="300px" /></li>

			</ul>
		</div>

	</div>


	<div>
		<div>
			<ul id="nav">
				<li><a href="breadmenu.jsp">Bread</a></li>
				<li><a href="cakemenu.jsp">Cake</a></li>
				<li><a href="drinkmenu.jsp">Drink</a></li>
				<li><a href="snackmenu.jsp">Snack</a></li>
			</ul>
		</div>
	</div>

<table class="pure-table">
		<tbody>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<tr>
				<form action="menuQuery.jsp">
					<input type="submit" class="button1" value="Query food">
				</form>
			</tr>
			
		</tbody>
	</table>

	<script type="text/javascript">

	
</script>
	<div id="foodList">


		<%
					final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
					final String USER = "JING";
					final String PASSWORD = "password";

					Class.forName("oracle.jdbc.driver.OracleDriver"); // 加载数据库驱动
					Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
					Statement stmt = conn.createStatement();
					ResultSet rs;
					rs = stmt.executeQuery("SELECT * FROM food where foodkind='cake'");										
					while (rs.next()) {
				%>

		<div id="food1" class="horizontal" style="padding: 20px">
			<table class="pure-table">
				<thead>
					<tr>
						<th id="foodname"><%=rs.getString("foodname")%></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td background="cake7.png" height="285px" width="400px"></td>
					</tr>
					<tr>
						<td id="foodname"><%="Name: "+rs.getString("foodname")%></td>
					</tr>
					<tr>
						<td id="foodprice"><%="Price: $"+rs.getString("foodprice")%></td>
					</tr>
					<tr>
						<td id="foodnum"><%="Stock: "+rs.getString("foodnum")%></td>
					</tr>
					<tr>
						<td>
							<form method="post" >
								<input type="hidden" name="foodName"
									value="<%=rs.getString("foodname")%>">
								<button class="button1" type="button"
									onclick="buyFood(this.form)">Buy</button>

							</form>

						</td>
					</tr>



				</tbody>
			</table>


		</div>

			<script type="text/javascript">
function buyFood(form)
{
	  
	    window.location="shoppingCart.jsp";
	} 


	
</script>
		<%
			}
		%>
	
</body>
</html>
