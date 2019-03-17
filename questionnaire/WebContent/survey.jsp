<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.opensymphony.xwork2.ActionContext,cn.edu.zjut.po.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程教学满意度调查表</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		a{
			text-decoration:none;
		}
		ul,ol{
			list-style:none;
		}
		.bg{
            min-height:662px;
			margin: 0 auto;
			background: url(images/starrySky.webp)top;
		}
		.h_210{
			height:105px;
			opacity:0;
		}
		.h_30{
			height:30px;
			opacity:0;
		}
		.wrap{
			width:100%;
		}
		.wrap.on{
			position:fixed;
			top:0;
			background-color:#0b173a;
		}
		.nav{
			width:70%;
			height:50px;
			line-height:50px;
			margin:0 auto;
			background-color:#0b173a;
		}
		.all,
		.list{
			float:left;
			list-style:none;
			color:#fff;
			text-align:center;
			cursor:pointer;
		}
		.all{
			position:relative;
			width:215px;
			background-color:#0e131f;
		}
		.all:hover .hide{
			height:200px;
		}
		.hide{
			width:215px;
			overflow:hidden;
			position:absolute;
			left:0;
			top:50px;
			height:0;
			transition:1s;
		}
		.h_list{
			width:100%;
			background-color: #0e131f;
		}
		.h_list a{
			line-height:40px;
			border-bottom:1px solid #ccc;
			line-height:40px;
			color:#fff;
			text-align: center;
		}
		.h_list a p:hover{
			background-color: #1d2142;
		}
		.list{
			width:150px;
		}
		.list a{
		    display:block;
			color:#fff;
		}
		.list:hover{
			background-color:#351212;
		}
		.survey{
			width:70%;
			margin: 0 auto;
			background-color: #fff;
		}
		.m-88{
			margin: 0 88px;
		}
		#subject{
			color:#00AAED;
			font-size:24px;
			padding: 56px 0 21px;
			text-align: center;
		}
		#introduce{
			color:#555451;
			font:16px/26px "微软雅黑";
			padding:15px 0;
			border-bottom: 1px dashed #ccc;
		}
		.question{
			padding:48px 0 17px;
			border-bottom: 1px solid #ccc;
			font:bold 15px/22px "微软雅黑";
			overflow:hidden;
		}
		.content{
			padding:15px 0 0 25px;
		}
		.content span{
			float:left;
			margin-top: 9px;
		}
		.content li{
			margin: 4px 0;
		}
		.stars{
			float:left;
			overflow: hidden;
			margin: 0 10px;
		}
		.stars li{
			float: left;
			list-style: none;
			width: 27px;
			height: 27px;
			background: url(img/star.gif);
			cursor:pointer;
		}
		.stars .on{
			background-position: 0 -29px;
		}
		.radio li{
			font-weight: normal;
			margin: 0;
			padding: 4px 0;
		}
		.radio li:hover{
			background-color: #F0EFED;
			cursor:pointer;
		}
		.submit{
			display:block;
			margin: 72px auto 92px;
			width:82px;
			height:32px;
			background-color: #232a3c;
			color:#fff;
			border-radius: 12px;
			border:1px solid #1e263a;
			outline: none;
		}
		.submit:hover {
			cursor:pointer;
		}
		.footer{
			margin:0 10px;
			padding:20px 0;
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
					<li class="all">
						全部课程调查表
						<div class="hide">
							<div class="h_list">
							    <%-- <%
							    ActionContext ctx = ActionContext.getContext();
                                Map request1 = (Map) ctx.get("request");
                                Map session1 = (Map) ctx.get("session");
                                User u=(User)session1.get("user");
                                Set cs=u.getCourses();
                                for(Object c: cs){
                                    Course c1=(Course)c;
                                %>
                                <a href="/findQuestions?course.courseId=<%=c1.getCourseId() %>"><p><%=c1.getCname() %></p></a>
                                <%    
                                }
							    %> --%>
							    <s:iterator value="#session.user.courses">
								    <s:a href="./findQuestions?course.courseId=%{courseId}"><p><s:property value="cname" /></p></s:a>
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
				<form action="addResults" method="post">
				    <s:hidden name="course.courseId" value="%{#request.courseId}"/>
					<h1 id="subject">课程教学满意度调查表</h1>
					<div id="introduce">
				        <span style="vertical-align: middle;">同学们，为了了解情况和进一步改进本课程（${cname }）的教学，特设计本问卷，希望同学们能真实的回答这些问题，谢谢合作。</span>
				    </div>
				    <%
				    ActionContext ctx = ActionContext.getContext();
                    Map request1 = (Map) ctx.get("request");
                    Map session1 = (Map) ctx.get("session");
                    Set questions=(Set)request1.get("questions");
                    session1.put("questions",questions);
				    Iterator iterator=questions.iterator();
				    int n=0;
                    while(iterator.hasNext()){
                        n++;
                        request.setAttribute("n",n-1);
				        Question q=(Question) iterator.next();
                        switch(q.getType()){
                        case '1':{
				    %>
				    <div class="question">
                        <div class="title">
                            <p><%=n %>、<%=q.getTitle() %><font color="#FF0000">*</font></p>
                        </div>
                        <div class="content">
                            <span>不满意</span>
                            <ul class="stars">
                                <li title="不满意"></li>
                                <li title="一般"></li>
                                <li title="中等"></li>
                                <li title="良好"></li>
                                <li title="满意"></li>
                                <s:hidden name='%{"answers["+#request.n+"]"}'/>
                            </ul>
                            <span>满意</span>
                        </div>
                    </div>
                    <%
                            break;
                        }
                        case '2':{
                    %>
                    <div class="question">
                        <div class="title">
                            <p><%=n %>、<%=q.getTitle() %><font color="#FF0000">*</font></p>
                        </div>
                    <%
                            Choice c=q.getChoice();
                            Map m=new LinkedHashMap();
                            m.put(c.getOption1(), c.getOption1());
                            m.put(c.getOption2(), c.getOption2());
                            m.put(c.getOption3(), c.getOption3());
                            m.put(c.getOption4(), c.getOption4());
                            //String s="#{'"+c.getOption1()+"' : '"+c.getOption1()+"'"+"}";
                            //String ss="#{'sadsa按时发放' : '啊沙发沙发', '啊沙发上' : '艾弗森女'}";
                            request.setAttribute("m",m);
                    %>
                        <ul class="content radio">
                            <s:radio name='%{"answers["+#request.n+"]"}' list="#request.m" />
                            <%-- <s:radio name='%{"answers["+#request.n+"]"}' list="#{'sadsa按时发放' : '啊沙发沙发', '啊沙发上' : '艾弗森女'}" /> --%>
                            <%-- <li><input type="radio" name='%{"answers["+#request.n+"]"}' value="<%=c.getOption1() %>"><%=c.getOption1() %></li>
                            <li><input type="radio" name='%{"answers["+#request.n+"]"}' value="<%=c.getOption2() %>"><%=c.getOption2() %></li>
                            <li><input type="radio" name='%{"answers["+#request.n+"]"}' value="<%=c.getOption3() %>"><%=c.getOption3() %></li>
                            <li><input type="radio" name='%{"answers["+#request.n+"]"}' value="<%=c.getOption4() %>"><%=c.getOption4() %></li> --%>
                        </ul>
                    </div>
                    <%
                            break;
                        }
                        case '3':{
                    %>
                    <div class="question">
                        <div class="title">
                            <p><%=n %>、<%=q.getTitle() %></p>
                        </div>
                        <div class="content">
                            <s:textarea name='%{"answers["+#request.n+"]"}' style="overflow: auto;width:62%;height:25px;line-height: 25px;" />
                        </div>
                    </div>
                    <%
                            break;
                        }
                        }
                    }
                    %>
				    <s:submit value="提交" class="submit" />
				</form>
			</div>
			<div class="footer">JavaEE(SSH)提供技术支持</div>
		</div>
		<div class="h_30"></div>
	</div>
	<script src="js/jquery.js"></script>
	<script>
		$(document).scroll(function(){
			var top=$(document).scrollTop();//获取滚轮到顶部的距离
			if(top>=105){
				$('.wrap').addClass('on');
			}
			else{
				$('.wrap').removeClass('on');
			}
		})
	    $(function(){
	        /*
	        * 鼠标点击，该元素包括该元素之前的元素获得样式,并给隐藏域input赋值
	        * 鼠标移入，样式随鼠标移动
	        * 鼠标移出，样式移除但被鼠标点击的该元素和之前的元素样式不变
	        * 每次触发事件，移除所有样式，并重新获得样式
	        * */
	        var radios = $('.radio');
	        for(i=0;i<radios.length;i++){
		        radios.eq(i).find('li').click(function(){
		        	var $radio = $(this).find("input[type=radio]"),
		        	$flag = $radio.is(":checked");
				    if( !$flag ){
				    	$radio.attr("checked",true);   
				    }
	            });
	        }
	        var stars = $('.stars');
	        var Len = stars.length;
	        //遍历每个评分的容器
	        for(i=0;i<Len;i++){
	            //每次触发事件，清除该项父容器下所有子元素的样式所有样式
	            function clearAll(obj){
	                obj.parent().children('li').removeClass('on');
	            }
	            stars.eq(i).find('li').click(function(){
	                var num = $(this).index();
	                clearAll($(this));
	                //当前包括前面的元素都加上样式
	                $(this).addClass('on').prevAll('li').addClass('on');
	                //给隐藏域input赋值
	                $(this).siblings('input').val(num+1);
	            });
	            stars.eq(i).find('li').mouseover(function(){
	                var num = $(this).index();
	                clearAll($(this));
	                //当前包括前面的元素都加上样式
	                $(this).addClass('on').prevAll('li').addClass('on');
	            });
	            stars.eq(i).find('li').mouseout(function(){
	                clearAll($(this));
	                //触发点击事件后input有值
	                var score = $(this).siblings('input').val();
	                for(i=0;i<score;i++){
	                    $(this).parent().find('li').eq(i).addClass('on');
	                }
	            });
	        }
	    })
	</script>
</body>
</html>