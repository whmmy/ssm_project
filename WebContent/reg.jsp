<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Comatible">
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/bootstrap3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/bootstrap3.3.7/css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-ui-1.12.1/jquery-ui.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/reg.css">
	<title>添加手机</title>
	<script type="text/javascript">
		$(function(){
			$("#slider-range-max").slider({
				range:"max",
				min:1,
				max:10,
				value:2,
				slide:function(event,ui){
					$("#memory").val(ui.value);
				}
			});
			$("#memory").val($("#slider-range-max").slider("value"));
		});
	</script>
	<script type="text/javascript">
		function insertp(){
			$.ajax({
				type:"post",
				async:true,
				url:"insert.do",
				data:$("#formid").serialize(),
				dataType:"text",
				success:function(res){
					if(res=="yes"){
						alert("添加成功！");
						location.href="getAllByPage.do"
					}
				}
			})
		}
	</script>
	<title>添加手机</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">手机信息</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="getAll.do">手机列表</a></li>
					<li><a href="getAllByPage.do">手机列表（分页）</a></li>
					<li><a href="getAllJson.do">手机数据（Json数据）</a></li>
					<li class="active"><a href="reg.jsp">添加手机</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							图表显示
							<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li><a href="<%=basePath%>echarts1.jsp">折线图</a></li>
							<li><a href="<%=basePath%>echarts2.jsp">玫瑰图</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav> 
	<div class="div1">
		<div class="page-header">
		    <h1>添加手机
		        <small>手机信息</small>
		    </h1>
		</div>
		<form id="formid">
			<div>
				<div class="glyphicon glyphicon-phone" style="font-size:26px"></div>
					<label class="text-right">手机名称：</label>
					<input type="text" name="pname" id="pname">
				</div>
				<div>
					<div class="glyphicon glyphicon-time" style="font-size:26px"></div>
					<label class="text-right">发售时间：</label>
					<input type="text" name="date" id="date">
				</div>
				<div>
					<div class="glyphicon glyphicon-hdd" style="font-size:26px"></div>
					<label class="text-right">内存容量：</label>
					<input type="text" name="memory" id="memory"
					style="border:0;color:#f6931f;font-weight:bold;">
					<div id="slider-range-max" class="memory"></div>
				</div>
				<div>
					<div class="glyphicon glyphicon-arrow-up" style="font-size:26px"></div>
					<label class="text-right">最高售价：</label>
					<input type="text" name="hightprice" id="hightprice">
				</div>
				<div>
					<div class="glyphicon glyphicon-arrow-down" style="font-size:26px"></div>
					<label class="text-right">最低售价：</label>
					<input type="text" name="lessprice" id="lessprice">
				</div>
				<div>
					<div class="button">
					<button type="button" class="btn btn-primary btn-lg" onclick="insertp()" 
					style="font-size:26px;">
					<span class="glyphicon glyphicon-plus"></span>添加手机
					</button>
				</div>
			</div>
			</form>
</body>
</html>