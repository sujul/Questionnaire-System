<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.opensymphony.xwork2.ActionContext,cn.edu.zjut.po.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>findCourseSuccess</title>
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

.clearfix:after {
	context: "";
	display: block;
	clear: both
}

.clearfix {
	zoom: 1
}

.fl {
	float: left
}

.fr {
	float: right
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
.text2 {
    margin-left: 14px;
    line-height: 20px;
}
.count{
    padding:0 8px;
    background-color: #e7e7e7;
    border: 1px solid #9e9e9e;
    color:#000;
    font:16px/23px "微软雅黑";
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
				<table>
					<tr>
						<td>课程信息：
							<p>
						</td>
					</tr>
					<tr>
						<td>课程名：</td>
						<td><s:property value="#request.course.cname" /></td>
					</tr>
					<s:iterator value="#request.course.questions" status="st">
						<s:form action="CoursedelQues" method="post">
							<s:hidden name="course.courseId"
								value="%{#request.course.courseId}" />
							<s:hidden name="question.questionId" value="%{questionId}" />
							<tr>
								<td>题目<s:property value="#st.count" />：
								</td>
							<tr>
							<tr>
								<td>标题：</td>
								<td><s:property value="title" /></td>
							<tr>
							<tr>
								<td>类型：</td>
								<td><s:if test="%{type=='1'}">满意度</s:if> <s:elseif
										test="%{type=='2'}">选择题</s:elseif> <s:elseif
										test="%{type=='3'}">简答题</s:elseif></td>
							<tr>
								<s:if test="%{type=='2'}">
									<tr>
										<td>选项：</td>
										<td><s:property value="choice.option1" /> <s:property
												value="choice.option2" /> <s:property
												value="choice.option3" /> <s:property
												value="choice.option4" /></td>
									<tr>
								</s:if>
							<tr>
								<td colspan="2" class="clearfix">
								    <s:a href="./countResults?course.courseId=%{#request.course.courseId}&course.cname=%{#request.course.cname}&question.questionId=%{questionId}"
										class="bt fr count">统计</s:a> <s:submit class="bt" value="删除" /></td>
							<tr>
						</s:form>
					</s:iterator>
				</table>
				<hr>
				添加新题目：
				<p>
				<form action="CourseaddQues" method="post" namespace="/" class="add">
					<s:hidden name="course.courseId"
						value="%{#request.course.courseId}" />
					<s:textfield class="text2" name="question.title" label="标题" />
					<br>
					<s:radio name="question.type" class="radio"
						list="#{'1':'满意度','2':'选择题','3':'简答题'}"></s:radio>
					<div class="hide">
						<label for="CourseaddQues_question_choice_option1" class="label">选项1:</label><input
							type="text" class="text"
							id="CourseaddQues_question_choice_option1"
							name="question.choice.option1" /></br> <label
							for="CourseaddQues_question_choice_option2" class="label">选项2:</label><input
							type="text" class="text"
							id="CourseaddQues_question_choice_option2"
							name="question.choice.option2" /></br> <label
							for="CourseaddQues_question_choice_option3" class="label">选项3:</label><input
							type="text" class="text"
							id="CourseaddQues_question_choice_option3"
							name="question.choice.option3" /></br> <label
							for="CourseaddQues_question_choice_option4" class="label">选项4:</label><input
							type="text" class="text"
							id="CourseaddQues_question_choice_option4"
							name="question.choice.option4" /></br>
					</div>
					<%-- <s:textfield class="text hide" name="question.choice。option1" label="选项1" />
                        <s:textfield class="text hide" name="question.choice。option2" label="选项2" />
                        <s:textfield class="text hide" name="question.choice。option3" label="选项3" />
                        <s:textfield class="text hide" name="question.choice。option4" label="选项4" /> --%>
					<s:submit class="bt" value="添加" />
				</form>
				<s:property value="#request.tip" />
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