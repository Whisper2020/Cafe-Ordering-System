<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: qingh
  Date: 2020/7/18
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>confirm order</title>

    <link rel="stylesheet" type="text/css" href="css.css" />
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
</head>
<script>
    function confirmOrder(form)
    {
        alert("订单生成成功！");
        form.action="AddOrder";
        form.submit();
    }
    function in_eat() {
        alert("就餐方式：堂食");
    }
    function out_eat() {
        alert("就餐方式：外送");
    }
</script>
<body>

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><b>cafe</b></a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">首页</a></li>
                <li><a href="#">点单</a></li>
                <li><a href="#">购物车</a></li>
                <li><a href="#">我的订单</a></li>
                <li><a href="#">我的账户</a></li>

            </ul>
        </div>
    </div>
</nav>
<form id="order" action="">
<div style="width:1000px;margin: 0 auto;margin-top:10px;min-height: 800px">
    <br><br>
    <h1 style="margin-top:-10px;;color: dimgray">确认订单</h1>

    <br>
    <form action="" method="post" id="basket">
        <div class="cart-info">
            <table>

                <thead>
                <%
                    final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
                    final String USER = "JING";
                    final String PASSWORD = "password";
                    int money=0;
                    Class.forName("oracle.jdbc.driver.OracleDriver"); // 加载数据库驱动
                    Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                    Statement stmt = conn.createStatement();
                    ResultSet rs;
                    rs = stmt.executeQuery("SELECT count(distinct orderNo) num FROM orders");
                    int orderNO=0;
                    Date now=new Date();
                    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
                    String date=df.format(now);
                    request.setAttribute("date",date);
                    while(rs.next())
                        orderNO=rs.getInt("num");
                    request.setAttribute("orderNO",orderNO+1);

                %>
                <td colspan="5" style=" background-color: antiquewhite;font-size: 15px">订单号:<%=orderNO+1%> </td>
                </thead>
                <tbody>
                <%

                    rs = stmt.executeQuery("SELECT * FROM shoppingCart");
                    while (rs.next()) {
                        money+=rs.getInt("quantity")*rs.getInt("unitprice");
                %>
                <tr>
                    <td class="image">Image</td>
                    <td class="name">Product Name</td>
                    <td class="quantity">Quantity</td>
                    <td class="price">Unit Price</td>
                    <td class="total">Total</td>
                </tr>

                <tr>
                    <form>
                        <td class="image" id="path"><a href="#"><img src="<%=rs.getString("path") %>" width="auto" height="50px" style="background-size:cover"/></a></td>
                        <td class="name" id="foodName"><%=rs.getString("foodname") %></td>
                        <td class="quantity" id="quantity"><input type="text" name="quantity" value="<%=rs.getString("quantity") %>" size="3" /></td>
                        <td class="price" id="unitPrice">$<%=rs.getString("unitprice") %></td>
                        <td class="total"><%=Integer.parseInt(rs.getString("quantity"))%></td>

                    </form>
                </tr>

                <%
                    }
                %>

                <tr><td colspan="5" align="right" style=" background-color: antiquewhite;font-size: 15px">总计：<%=money%> 元</td></tr>
                <tr><td colspan="5" align="right" style=" background-color: antiquewhite;font-size: 15px">时间：<%=date%></td></tr>
                <tr>
                    <td  align="left" style=" background-color: antiquewhite;font-size:15px;">
                        <input align="right" type="button" value="堂食" onclick="in_eat()"/>
                    </td>
                    <td  align="right" style=" background-color: antiquewhite;font-size:15px;">
                        <input type="button" align="right" value="外卖" onclick="out_eat()"/>
                    </td>
                </tr>

                <tr><td colspan="15" align="right" style=" background-color: antiquewhite;font-size:15px;">收件人：(外送必填)<input /></td></tr>
                <tr><td colspan="15" align="right" style=" background-color: antiquewhite;font-size: 15px;">收件人电话：(外送必填)<input value=""/></td></tr>
                <tr><td colspan="15" align="right" style=" background-color: antiquewhite;font-size: 15px;">收件地址：(外送必填)<input value=""/></td></tr>


                </tr>
                </tbody>
            </table>
        </div>
        <div class="buttons">
            <div class="center"><a href="#" class="button" style="height: auto" onclick="confirmOrder(this.form)"><span >确认下单</span></a></div>
        </div>
    </form>



</div>
</form>
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
                <li style="float:right;padding-top:10px;list-style:none;">&copy; Copyright <a target="_blank"> </a></li>
            </ul>
            <div class="clearfix"></div>
        </div>

    </div>
</div>
</body>
</html>
