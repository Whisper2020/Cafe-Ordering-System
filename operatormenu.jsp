</html><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="sql.ShoppingCartSql"%>
<%@ page import="entity.ShoppingCart"%>
<%@ page import="javax.servlet.*,javax.servlet.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css.css" />
<title>cart</title>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">


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
	function del(form) {
		form.action = "DeleteFood";
		form.submit();
		var tr = form.parentNode.parentNode;
		var tbody = tr.parentNode;
		tbody.removeChild(tr);

	}
</script>

</head>
<body>





	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><b>cafe</b></a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="operatormenu.jsp">Menu</a></li>
					<li><a href="#">Order</a></li>

				</ul>
			</div>
		</div>
	</nav>


	<div
		style="width: 1000px; margin: 0 auto; margin-top: 10px; min-height: 800px">
		<br>
		<h1 style="margin-top: -10px; color: dimgray">Menu</h1>
		<td class="image" ><img align="left"
										src="+.png" width="auto" height="40px" style="CURSOR: hand;" onclick="addFood()"
										style="background-size: cover" /></a></td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<td class="image" ><img align="left"
										src="search.png" width="auto" height="45px" style="CURSOR: pointer" onclick="menuQuery()"
										style="background-size: cover" /></a></td>
		
		<br><br><br>
		<form action="#" method="post" id="basket">
			<div class="cart-info">
				<table id="shoppingCart">
					<thead>
						<tr>
							<td class="image">Image</td>
							<td class="name">Product Name</td>
							<td class="name">Kind</td>
							<td class="quantity">Quantity</td>
							<td class="price">Unit Price</td>
							<td class="remove">Remove</td>
						</tr>
					</thead>
					<tbody>

						<%
							final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
							final String USER = "JING";
							final String PASSWORD = "password";

							Class.forName("oracle.jdbc.driver.OracleDriver"); // 加载数据库驱动
							Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
							Statement stmt = conn.createStatement();
							ResultSet rs;
							rs = stmt.executeQuery("SELECT * FROM food");
							while (rs.next()) {
						%>

						<tr>
							<form>
								<td class="image" id="path"><a href="#"><img
										src="<%=rs.getString("path")%>" width="auto" height="50px" style="CURSOR: pointer" onclick="menuQuery.jsp"
										style="background-size: cover" /></a></td>
								<td class="name" id="foodName"><%=rs.getString("foodname")%></td>
								<td class="kind" id="kind"><input type="text"
									name="foodKind" value="<%=rs.getString("foodkind")%>" size="3"
									onchange="update(this.form)" /></td>
								<td class="quantity" id="quantity"><input type="text"
									name="foodNum" value="<%=rs.getString("foodnum")%>" size="3"
									onchange="update(this.form)" /></td>
								<td class="price" id="unitPrice"><input type="text"
									name="foodPrice" value="$<%=rs.getString("foodprice")%>"
									size="3" onchange="update(this.form)" /></td>
								<td class="remove"><input type="hidden" name="foodName"
									value="<%=rs.getString("foodname")%>">

									<button value="delete" type="button" onclick="del(this.form)">delete</button>
							</form>
						</tr>
						</td>



						<%
							}
						%>
					</tbody>
				</table>
			</div>


			<script type="text/javascript">
				function update(form) {
					form.action = "UpdateFood";
					form.submit();

				}
				function menuQuery()
				{
					window.location="operatormenuQuery.jsp";
				}
				function addFood()
				{
					window.location="addFood.jsp";
				}
				
			</script>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="icart-footer">
		<div class="icart-footer-top">
			<div style="width: 1000px; margin: 0 auto;"></div>
		</div>
		<div class="icart-footer-container">
			<div class="column_footer" style="width: 900px;">
				<h3>About Us</h3>
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel
				ante felis, aliquet sagittis lacus. Etiam in purus vitae tortor
				lacinia pretium. Maecenas quam diam, porttitor bibendum lacinia a,
				feugiat sit amet felis. Praesent ut mi justo, a volutpat ligula.
				Praesent sodales felis sed odio consectetur eget cursus metus
				mollis. Proin sollicitudin accumsan lectus a ornare... .
			</div>


		</div>
		<div class="icart-footer-bottom">
			<div style="width: 1000px; margin: 0 auto;">
				<ul>
					<li style="float: right; padding-top: 10px; list-style: none;"><a
						target="_blank"> &copy; Copyright </a></li>
				</ul>
				<div class="clearfix"></div>
			</div>

		</div>
	</div>
</body>
</html>