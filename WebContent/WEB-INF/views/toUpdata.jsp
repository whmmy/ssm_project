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
	<title>手机信息修改 -${phone.pname}</title>
	<script type="text/javascript">
		$(function(){
			$("#slider-range-max").slider({
				range:"max",
				min:1,
				max:10,
				value:${phone.memory},
				slide:function(event,ui){
					$("#memory").val(ui.value);
				}
			});
			$("#memory").val($("#slider-range-max").slider("value"));
		});
	</script>
	<script type="text/javascript">
		function updatap(){
			if(!confirm("确认更新")){
				window.event.returnValue=false;
			}else{
				window.event.returnValue=true;
				$.ajax({
					type:"post",
					async:true,
					url:"doUpdataByPno.do",
					data:$("#formid").serialize(),
					dataType:"text",
					success:function(res){
						if(res=="yes"){
							alert("更新成功！");
							location.href="getAllByPage.do"
						}else{
							alert("更新失败！稍后再试");
						}
					}
				})
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="reg.jsp">修改信息 —${phone.pname}</a></li>
	</ul>	
		<div class="div1">
			<form id="formid">
				<div>
					<input id="pno" name="pno" value="${phone.pno}" type="hidden">
				</div>
					<div>
						<div class="glyphicon glyphicon-phone" style="font-size:26px"></div>
						<label class="text-right">手机名称：</label>
						<input type="text" name="pname" id="pname" value="${phone.pname}">
					</div>
					<div>
						<div class="glyphicon glyphicon-time" style="font-size:26px"></div>
						<label class="text-right">发售时间：</label>
						<input type="text" name="date" id="date" value="${phone.date}" >
					</div>
					<div>
						<div class="glyphicon glyphicon-hdd" style="font-size:26px"></div>
						<label class="text-right">内存容量：</label>
						<input type="text" name="memory" id="memory" 
						style="border:0;color:#f6931f;font-weight:bold;" value="${phone.memory}">
						<div id="slider-range-max" class="memory"></div>
					</div>
					<div>
						<div class="glyphicon glyphicon-arrow-up" style="font-size:26px"></div>
						<label class="text-right">最高售价：</label>
						<input type="text" name="hightprice" id="hightprice" value="${phone.hightprice}">
					</div>
					<div>
						<div class="glyphicon glyphicon-arrow-down" style="font-size:26px"></div>
						<label class="text-right">最低售价：</label>
						<input type="text" name="lessprice" id="lessprice" value="${phone.lessprice}">
					</div>
					<div>
						<div class="button">
						<button type="button" class="btn btn-primary btn-lg" onclick="updatap()" 
						style="font-size:26px;">
						<span class="glyphicon glyphicon-plus"></span>修改信息
						</button>
					</div>
				</div>
			</form>
		</div>
</body>
</html>