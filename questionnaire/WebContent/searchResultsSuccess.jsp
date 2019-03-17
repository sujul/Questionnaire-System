<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.opensymphony.xwork2.ActionContext,cn.edu.zjut.po.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>searchResultsSuccess</title>
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

.list {
	float: left;
	list-style: none;
	color: #fff;
	text-align: center;
	cursor: pointer;
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
	padding: 20px 0;
	margin: 0 88px;
}

table {
	padding: 10px 0;
}

.search {
	width: 370px;
	margin: 0 auto;
	padding-top: 80px;
}

.bt {
	padding: 1px 10px;
	margin-top: 5px;
}

.text {
	margin-left: 10px;
	line-height: 20px;
}

.add {
	width: 229px;
}

.add input {
	margin-top: 5px;
}

.submit {
	display: block;
	margin: 0 auto;
	width: 260px;
	height: 30px;
}

.hide {
	display: none;
}

.hide.on {
	display: block;
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
					<li class="list"><a href="manageUserCourse.jsp">学生课程管理</a></li>
					<li class="list"><a href="manageCourseQuestion.jsp">课程题目管理</a></li>
					<li class="list"><a href="searchResults.jsp">调查记录查询</a></li>
				</ul>
			</div>
		</div>
		<div class="survey">
			<div class="m-88">
				<%
				    ActionContext ctx = ActionContext.getContext();
					Map request1 = (Map) ctx.get("request");
					List rs = (List) request1.get("results");
					String cname = (String) request1.get("cname");
				%>
				<div class="total">
					<div class="cname"><%=cname%></div>
					<%
				    for (Object o : rs) {
						Result r = (Result) o;
						Course c = r.getCourse();
						if (!c.getCname().equals(cname)) {
							continue;
						}
						Question q = r.getQuestion();
					%>
					<div class="result">
						<div class="title">
							<span>Title:</span><%=q.getTitle()%></div>
						<div class="answer">
							<span>Answer:</span><%=r.getAnswer()%></div>
					</div>
					<%
					    }
					%>
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