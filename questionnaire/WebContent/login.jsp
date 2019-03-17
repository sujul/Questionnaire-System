<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		body{
			background: url(images/login.webp);
		}
		.login { 
			position: absolute;
			top: 50%;
			left: 50%;
			margin: -150px 0 0 -150px;
			width:300px;
			height:300px;
		}
		.login h1{
			color: #fff;
			letter-spacing:1px;
			text-align:center;
			margin-bottom: 10px;
		}
		.input { 
			width: 100%;
			margin-bottom: 10px;
			background: rgba(0,0,0,0.3);
			border: none;
			outline: none;
			padding: 10px;
			font-size: 13px;
			color: #fff;
			border: 1px solid rgba(0,0,0,0.3);
			border-radius: 4px;
			box-sizing:border-box;
			box-shadow: inset 0 -5px 45px rgba(100,100,100,0.2), 0 1px 1px rgba(255,255,255,0.2);
		}
		.input:focus{
			box-shadow: inset 0 -5px 45px rgba(100,100,100,0.4)
		}	
		.btn{
			display: inline-block;
			width: 100%;
			text-align: center;
			border: 1px solid #2c3148;
			cursor: pointer;
			padding: 9px 14px;
			font-size: 15px;
			border-radius: 5px;
			color: #fff;
			background: rgba(64,154,216,0.5);
		}
		.input,
		.btn{
		  width:300px;
		}
	</style>
</head>
<body>
<div class="login">
	<h1>Login</h1>
	<s:form action="login" method="post" namespace="/">
		<s:textfield name="user.username" placeholder="用户名/学号" required="required" class="input"/>
		<s:password name="user.password" placeholder="密码" required="required" class="input"/>
		<s:submit class="btn" value="登录" />
	</s:form>
</div>
</body>
</html>