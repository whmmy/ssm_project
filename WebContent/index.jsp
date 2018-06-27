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
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap3.3.7/js/bootstrap.min.js"></script>
	<!-- <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script> -->
	<script type="text/javascript" src="<%=basePath%>js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/bootstrap3.3.7/css/bootstrap.min.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>手机信息主页</title>
</head>
<body>
<!-- 	<ul class="nav nav-tabs">
		<li class="active"><a href="getAll.do">手机列表</a></li>
		<li class="active"><a href="getAllByPage.do">手机列表（分页）</a></li>
		<li class="active"><a href="getAllJson.do">手机数据（Json数据）</a></li>
		<li class="active"><a href="reg.jsp">添加手机</a></li>
	</ul> -->
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
					<li><a href="reg.jsp">添加手机</a></li>
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
	<div id="myCarousel" class="carousel slide">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner" id="a">
		<div class="item active" id="b">
			<img src="<%=basePath%>images/IMG_2684.png" alt="First slide">
		</div>
		<div class="item" id="b">
			<img src="<%=basePath%>images/IMG_2796.png" alt="Second slide">
		</div>
		<div class="item" id="b">
			<img src="<%=basePath%>images/IMG_2991.png" alt="Third slide">
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div> 
</body>
</html>