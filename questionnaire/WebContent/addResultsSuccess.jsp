<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>填写信息提交成功</title>
<style>
* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
}

ul, ol {
	list-style: none;
}

.bg {
	min-height: 662px;
	margin: 0 auto;
	background: url(images/starrySky.webp) top;
}

.h_210 {
	height: 105px;
	opacity: 0;
}

.h_30 {
	height: 30px;
	opacity: 0;
}

.wrap {
	width: 100%;
}

.wrap.on {
	position: fixed;
	top: 0;
	background-color: #0b173a;
}

.nav {
	width: 70%;
	height: 50px;
	line-height: 50px;
	margin: 0 auto;
	background-color: #0b173a;
}

.nav ul {
	margin: 0;
	padding: 0;
}

.all, .list {
	float: left;
	list-style: none;
	color: #fff;
	text-align: center;
	cursor: pointer;
}

.all {
	position: relative;
	width: 215px;
	background-color: #0e131f;
}

.all:hover .hide {
	height: 200px;
}

.hide {
	width: 215px;
	overflow: hidden;
	position: absolute;
	left: 0;
	top: 50px;
	height: 0;
	transition: 1s;
}

.h_list {
	width: 100%;
	background-color: #0e131f;
}

.h_list a {
	height: 40px;
	border-bottom: 1px solid #ccc;
	line-height: 40px;
	color: #fff;
	text-align: center;
}

.h_list a p:hover {
	background-color: #1d2142;
}

.list {
	width: 150px;
}

.list a {
	display: block;
	color: #fff;
}

.list:hover {
	background-color: #351212;
}

.survey {
	width: 70%;
	margin: 0 auto;
	background-color: #fff;
}

.m-88 {
	margin: 0 88px;
}

.cname {
	font: 24px/40px "微软雅黑";
	color: #00AAED;
}

.total {
	padding: 40px 0;
}

.result {
	border-bottom: 1px solid #ccc;
}

.title, .answer {
	font: 16px/30px "微软雅黑";
}

.title span, .answer span {
	font-size: 18px;
	padding-right: 5px;
}

.tip {
	padding: 20px;
}

.footer {
	margin: 0 10px;
	padding: 20px 0;
	border-top: 1px solid #ccc;
	text-align: center;
}
</style>
</head>
<body>
	<div class="bg">
		<div class="h_210"></div>
		<div class="wrap">
			<div class="nav">
				<ul>
					<li class="all">全部课程调查表
						<div class="hide">
							<div class="h_list">
								<s:iterator value="#session.user.courses">
									<s:a href="./findQuestions?course.courseId=%{courseId}">
										<p>
											<s:property value="cname" />
										</p>
									</s:a>
								</s:iterator>
							</div>
						</div>
					</li>
					<li class="list"><a href="./findResults">我的填写信息</a></li>
				</ul>
			</div>
		</div>
		<div class="survey">
			<div class="m-88">
				<div class="tip">
					<s:property value="#request.tip" />
				</div>
			</div>
			<div class="footer">JavaEE(SSH)提供技术支持</div>
		</div>
		<div class="h_30"></div>
	</div>
	<script src="js/jquery.js"></script>
	<script>
		$(document).scroll(function() {
			var top = $(document).scrollTop();//获取滚轮到顶部的距离
			if (top >= 105) {
				$('.wrap').addClass('on');
			} else {
				$('.wrap').removeClass('on');
			}
		})
	</script>
</body>
</html>