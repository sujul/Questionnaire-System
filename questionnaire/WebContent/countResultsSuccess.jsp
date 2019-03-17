<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.opensymphony.xwork2.ActionContext,cn.edu.zjut.po.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>countResultsSuccess</title>
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

.title {
	font: 16px/30px "微软雅黑";
	padding-top: 100px;
}

.title span {
	font-size: 18px;
	padding-right: 10px;
}

.statistics table td {
	width: 130px;
	text-align: center;
}

.statistics .ans {
	padding: 2px 0 2px 10px;
	border-bottom: 1px dashed #ccc;
}

.m-88 a {
	display: block;
	padding: 10px 0;
	margin-bottom: 90px;
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
				<div class="statistics">
					<%
					    ActionContext ctx = ActionContext.getContext();
								Map session1 = (Map) ctx.getSession();
								Map request1 = (Map) ctx.get("request");
								List l = (List) request1.get("answers");
								Question q = (Question) request1.get("question");
					%>
					<div class="title">
						<span>Title:</span><%=q.getTitle()%></div>
					<%
					    double a1, a2, a3, a4, a5, a6;
								a1 = a2 = a3 = a4 = a5 = 0.0;
								switch (q.getType()) {
									case '1' : {
										for (int i = 0; i < l.size(); i++) {
											String answer = (String) l.get(i);
											switch (answer) {
												case "不满意" : {
													a1++;
													break;
												}
												case "一般" : {
													a2++;
													break;
												}
												case "中等" : {
													a3++;
													break;
												}
												case "良好" : {
													a4++;
													break;
												}
												case "满意" : {
													a5++;
													break;
												}
											}
										}
										a6 = a1 + a2 + a3 + a4 + a5;
					%>
					<table>
						<tr>
							<td>不满意</td>
							<td>一般</td>
							<td>中等</td>
							<td>良好</td>
							<td>满意</td>
						</tr>
						<tr>
							<td><%=a1 * 100 / a6%>%</td>
							<td><%=a2 * 100 / a6%>%</td>
							<td><%=a3 * 100 / a6%>%</td>
							<td><%=a4 * 100 / a6%>%</td>
							<td><%=a5 * 100 / a6%>%</td>
						</tr>
					</table>
					<%
					    break;
									}
									case '2' : {
										String option1 = q.getChoice().getOption1();
										String option2 = q.getChoice().getOption2();
										String option3 = q.getChoice().getOption3();
										String option4 = q.getChoice().getOption4();
										for (int i = 0; i < l.size(); i++) {
										    String answer = (String) l.get(i);
											if (answer.equals(option1))
												a1++;
											else if (answer.equals(option2))
												a2++;
											else if (answer.equals(option3))
												a3++;
											else if (answer.equals(option4))
												a4++;
										}
										a6 = a1 + a2 + a3 + a4;
					%>
					<table>
						<tr>
							<td><%=option1%></td>
							<td><%=option2%></td>
							<td><%=option3%></td>
							<td><%=option4%></td>
						</tr>
						<tr>
							<td><%=a1 * 100 / a6%>%</td>
							<td><%=a2 * 100 / a6%>%</td>
							<td><%=a3 * 100 / a6%>%</td>
							<td><%=a4 * 100 / a6%>%</td>
						</tr>
					</table>
					<%
					    break;
									}
									case '3' : {
										for (int i = 0; i < l.size(); i++) {
										    String answer = (String) l.get(i);
					%>
					<p class="ans"><%=answer%></p>
					<%
					    }
										break;
									}
								}
					%>
				</div>
				<s:a href="./findCourse?course.cname=%{#request.cname}">返回</s:a>
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
		$(function() {
			var radios = $('.radio');
			/* console.log(radios); */
			radios
					.eq(0)
					.click(
							function() {
								var $radio = $(this).find("input[type=radio]"), $flag = $radio
										.is(":checked");
								if (!$flag) {
									$('.hide').removeClass('on');
									/* for(i=0;i<$('.hide').length;i++){
									    $('.hide').eq(i).removeClass('on');
									} */
								}
							});
			radios
					.eq(2)
					.click(
							function() {
								var $radio = $(this).find("input[type=radio]"), $flag = $radio
										.is(":checked");
								if (!$flag) {
									$('.hide').addClass('on');
									/* for(i=0;i<$('.hide').length;i++){
									    $('.hide').eq(i).addClass('on');
									} */
								}
							});
			radios
					.eq(4)
					.click(
							function() {
								var $radio = $(this).find("input[type=radio]"), $flag = $radio
										.is(":checked");
								if (!$flag) {
									$('.hide').removeClass('on');
									/* for(i=0;i<$('.hide').length;i++){
									    $('.hide').eq(i).removeClass('on');
									} */
								}
							});
		})
	</script>
</body>
</html>