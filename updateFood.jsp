<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddFood</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
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
					<li><a href="#">Home Page</a></li>
					<li class="active"><a href="#">Menu</a></li>
					<li><a href="#">Shopping Cart</a></li>
					<li><a href="#">My Order</a></li>
					<li><a href="myAccount.jsp">My Account</a></li>

				</ul>
			</div>
		</div>
	</nav>


	
	<div align="left" style="margin: 100px">
			<script type="text/javascript">
		
		</script>
				
		<form action="UpdateFood">
		<p>Old Infomation</p><br>
Name：<input type="text"  name="oldFoodName">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br><br><br><br>
<p>New Infomation</p><br>
Name：<input type="text"  name="foodName">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Kind：<input type="text"  name="foodKind"><br><br>
Price：<input type="number"  name="foodPrice">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Stock：<input type="number"  name="foodNum"><br><br><br><br>
              <input type="submit" value="Submit"><br><br>
                            <!-- 提交 -->
   </form>
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