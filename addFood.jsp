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
					<li class="active"><a href="operatormenu.jsp">Menu</a></li>
					<li><a href="#">Order</a></li>

				</ul>
			</div>
		</div>
	</nav>
	
	<script type="text/javascript">
    var imgurl = "";
    function getPhoto(node) {
        var imgURL = "";
        try{
            var file = null;
            if(node.files && node.files[0] ){
                file = node.files[0];
            }else if(node.files && node.files.item(0)) {
                file = node.files.item(0);
            }
            //Firefox 因安全性问题已无法直接通过input[file].value 获取完整的文件路径
            try{
                imgURL =  file.getAsDataURL();
            }catch(e){
                imgRUL = window.URL.createObjectURL(file);
            }
        }catch(e){
            if (node.files && node.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    imgURL = e.target.result;
                };
                reader.readAsDataURL(node.files[0]);
            }
        }
        creatImg(imgRUL);
        return imgURL;
    }
 
    function creatImg(imgRUL){
        var textHtml = "<img src='"+imgRUL+"'width='414px' height='600px'/>";
        $(".ge_pic_icon_Infor").html(textHtml);
    }
</script>
	<div align="left" style="margin: 100px">
	
		
		<form action="AddFood" method="post">
Name： <br>  <input type="text"  name="foodName"  id="name"><br><br>
Kind：   <br><input type="text"  name="foodKind"  id="kind"><br><br>
Price ：  <br>  <input type="number"  name="foodPrice"  id="price"><br><br>
Stock： <br><input type="number"  name="foodNum"  id="num"><br><br>
	Picture：<br><input type="file" name="path" id="path" value="" title="上传照片" οnchange="getPhoto(this)"/><br><br>
	 <input type="button"  onclick="check(this.form)" value="Add"><br><br>

   </form>
	
	<script type="text/javascript">
function check(form)

{
	var name = document.getElementById("name").value;
	var kind = document.getElementById("kind").value;
	var price = document.getElementById("price").value;
	var num = document.getElementById("num").value;
	var path = document.getElementById("path").value;
	if(name==""||kind==""||price==""||num==""||path=="")
    	alert("please input the whole infomation!");  
	else 
	{
		
		
		form.action="AddFood";
		form.submit();
	    alert("Add successfully!");   
	    // 弹出错误信息
	    window.location="operatormenu.jsp";                        

	    }
	     	
	
	
	
}
</script>
	


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