<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>mainPage</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
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
 
td,th {
    padding: 0;
}
 
.pure-table {
    border-collapse: collapse;
    border-spacing: 0;
    empty-cells: show;
    border: 1px solid #cbcbcb;
}
 
.pure-table caption {
    color: #000;
    font: italic 85%/1 arial,sans-serif;
    padding: 1em 0;
    text-align: center;
}
 
.pure-table td,.pure-table th {
    border-left: 1px solid #cbcbcb;
    border-width: 0 0 0 1px;
    font-size: inherit;
    margin: 0;
    overflow: visible;
    padding: .5em 1em;
}
 
.pure-table thead {
    background-color: #e0e0e0;
    color: #000;
    text-align: left;
    vertical-align: bottom;
}
 
.pure-table td {
    background-color: transparent;
}
.pure-table-horizontal td,.pure-table-horizontal th {
    border-width: 0 0 1px 0;
    border-bottom: 1px solid #cbcbcb;
}
 
.pure-table-horizontal tbody>tr:last-child>td {
    border-bottom-width: 0;
}
</style>

<style type="text/css">
        html{height:100%;}
        body{min-height:100%;margin:0;padding:0;position:relative;}

        .footer{position:absolute;bottom:0;width:100%;height:100px;background-color: #ffc0cb;}
    </style>
	
	
	
</head>
<body>

<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
	<div class="navbar-header">
		<a class="navbar-brand" href="#"><b>cafe</b></a>
	</div>
	<div>
		<ul class="nav navbar-nav">
			<li><a href="#">首页</a></li>
			<li><a href="#">点单</a></li>
			<li><a href="#">购物车</a></li>
			<li class="active"><a href="#">我的订单</a></li>
			<li><a href="#">我的账户</a></li>
			
		</ul>
	</div>
	</div>
</nav>
	
	
	
<div>
	
	<table class="pure-table pure-table-horizontal">
		<thead>
            <tr>
                <th>订单号</th>
                <th>下单用户</th>
                <th>下单时间</th>
                <th>合计总价</th>
            </tr>
        </thead>
    <tbody>
<%
    final String URL = "jdbc:mysql://localhost:3306/Javaproj?useSSL=false&useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
    final String USER = "root";
     final String PASSWORD = "root";

        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
        Statement stmt = conn.createStatement();
        ResultSet rs;
        rs = stmt.executeQuery("SELECT * FROM order_user");
        while(rs.next()){ %>
        
        <tr>
			<td><%=rs.getString("orderNo") %></td>
			<td><%=rs.getString("consumerName") %></td>
			<td><%=rs.getString("orderDate") %></td>
			<td><%=rs.getString("sumMoney") %></td>
		</tr>
<%       } %>
        </tbody>
		
		
		</table>
	
	</div>
	
	
	


<div class="footer" style="background-color: burlywood">
	<div>
	<li>版权所有：</li>
	<li>地址</li>
	<li>电话：</li>
	<li>邮箱：</li>
	
	</div>
	
	</div>
</body>
</html>