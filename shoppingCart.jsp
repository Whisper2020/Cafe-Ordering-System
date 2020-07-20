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
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	
	
 <style type="text/css">
    *{ margin:0; padding:0;font-size: 12px;}
    ul{ list-style:none;}
     .slider{ width: auto;padding:10px 20px;height: 300px;margin: 0px auto;position: relative;cursor: pointer;}
     #slider_pic{ width: auto;margin:0 auto;overflow: hidden;height: 300px;position: relative;}
     .prev,.next{position: absolute;width: 20px;height: 20px;cursor: pointer;top:60px;background-color: #daa520; text-align: center;line-height: 20px;font-weight: bold;color: #fff;}
     .next{right: 20px;}
     .no_click{background-color: #808080;}
     #slider_pic li{float: left;margin-right: 10px;}
     #slider_pic ul{position: absolute;left: 0;}
 
 </style>

<script type="text/javascript">
function del(form){
	form.action="DeleteShoppingCart";
	form.submit();
			var tr=form.parentNode.parentNode;
	    	var tbody=tr.parentNode;
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
					<li><a href="#">Home Page</a></li>
					<li ><a href="menu.jsp">Menu</a></li>
					<li class="active"><a href="shoppingCart.jsp">Shopping Cart</a></li>
					<li><a href="#">My Order</a></li>
					<li><a href="myAccount.jsp">My Account</a></li>

				</ul>
			</div>
		</div>
	</nav>


<div style="width:1000px;margin: 0 auto;margin-top:10px;min-height: 800px">
	<br>
<h1 style="margin-top:-10px;color: dimgray">Shopping Cart</h1>

<br>
     <form action="#" method="post" id="basket">
      <div class="cart-info">
        <table id="shoppingCart">
          <thead>
            <tr>
              <td class="image">Image</td>
              <td class="name">Product Name</td>
              <td class="quantity">Quantity</td>
              <td class="price">Unit Price</td>
              <td class="total">Total</td>
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
					rs = stmt.executeQuery("SELECT * FROM shoppingCart");										
					while (rs.next()) {
				%>
				
				 <tr>
             <form>
              <td class="image" id="path"><a href="#"><img src="<%=rs.getString("path") %>" width="auto" height="50px" style="background-size:cover"/></a></td>
              <td class="name" id="foodName"><%=rs.getString("foodname") %></td>
              <td class="quantity" id="quantity"><input type="text" name="quantity" value="<%=rs.getString("quantity") %>" size="3" onchange="changeQuantity(this.form)"/></td>
              <td class="price" id="unitPrice">$<%=rs.getString("unitprice") %></td>
             <td class="total"><%=Integer.parseInt(rs.getString("quantity"))*Double.parseDouble(rs.getString("unitprice"))%></td>
              <td class="remove">
              
								<input type="hidden" name="foodName"
									value="<%=rs.getString("foodname")%>">
									<input type="hidden" name="userName"
									value="<%=rs.getString("username")%>">
<button value="delete" type="button"
									onclick="del(this.form)">delete</button>
			</form>
			</tr>
			</td>
			
            

		<%
			}
		%>
		  </tbody>
        </table>
      </div>

    <div class="buttons">
      <div class="center"><a href="#" class="button" style="height: auto"><span>结算</span></a></div>
    </div>
    <script type="text/javascript">
function changeQuantity(form)
{
        form.action="UpdateShoppingCart";
        form.submit();
        
}
  </script>
    
<script type="text/javascript">
    var detail_div = 1;
    function add_div() {
        var e = document.getElementById("details");
        var div = document.createElement("div");
        div.className = "form-group";
        div.id = "details" + detail_div;
        div.innerHTML = e.innerHTML;
        document.getElementById("cart-info").appendChild(div);
        var quantity=div.getElementByName("quantity");
        quantity.value=quantity.value+1;
        var price=div.getElementById("price"); 
        price.value=<%=request.getParameter("foodPrice")%>;
        detail_div++;
    }

    function del_div() {
        var id = "details" + (detail_div - 1).toString();
        var e = document.getElementById(id);
        document.getElementById("form").removeChild(e);
        detail_div--;
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
	<div style="width:1000px; margin:0 auto;">	
	</div>
</div>
<div class="icart-footer-container">
	<div class="column_footer" style="width:900px;">
		<h3>About Us</h3>
		Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel ante felis, aliquet sagittis lacus. Etiam in purus vitae tortor lacinia pretium. Maecenas quam diam, porttitor bibendum lacinia a, feugiat sit amet felis. Praesent ut mi justo, a volutpat ligula. Praesent sodales felis sed odio consectetur eget cursus metus mollis. Proin sollicitudin accumsan lectus a ornare... .
	</div>
	
	
	</div>		
	<div class="icart-footer-bottom">
		<div style="width:1000px; margin:0 auto;">				
			<ul>
			<li style="float:right;padding-top:10px;list-style:none;"><a target="_blank"> &copy; Copyright </a></li>
			</ul>		
		<div class="clearfix"></div>
		</div>

</div>
</div>
</body>
</html>