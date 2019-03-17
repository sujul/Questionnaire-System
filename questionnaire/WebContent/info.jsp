<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.opensymphony.xwork2.ActionContext,cn.edu.zjut.po.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>info</title>
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
		.nav ul{
			margin:0;
			padding:0;
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
			height:40px;
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
		.cname{
			font:24px/40px "微软雅黑";
			color:#00AAED;
		}
		.total{
			padding: 40px 0;
		}
		.result{
			border-bottom: 1px solid #ccc;
		}
		.title,
		.answer{
			font:16px/30px "微软雅黑";
		}
		.title span,
		.answer span{
			font-size:18px;
			padding-right: 5px;
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
			    <%
                ActionContext ctx = ActionContext.getContext();
                Map request1 = (Map) ctx.get("request");
                List rs=(List)request1.get("results");
                List<String> l=new ArrayList<String>();
                int t=0,i=0;
                String cname="";
                boolean flag=true;
                while(t<rs.size()){
                    Result r=(Result)rs.get(i);
                    Course c=r.getCourse();
                    if(flag){
                        if(l.contains(c.getCname())){
                            i++;
                            if(i>=rs.size()){
                                i=0;
                                flag=true;
                            }
                            continue;
                        }
                        if(t!=0){
                %>
                </div>
                <%            
                        }
                        cname=c.getCname();
                        l.add(cname);
                        flag=false;
                %>
                <div class="total">
                    <div class="cname"><%=cname %></div>
                <%
                    }
                    if(c.getCname()!=cname){
                        i++;
                        if(i>=rs.size()){
                            i=0;
                            flag=true;
                        }
                        continue;
                    }
                    Question q=r.getQuestion();
                %>
                    <div class="result">
                        <div class="title"><span>Title:</span><%=q.getTitle() %></div>
                        <div class="answer"><span>Answer:</span><%=r.getAnswer() %></div>
                    </div>
                <%  
                    t++;
                    i++;
                    if(i>=rs.size()){
                        i=0;
                        flag=true;
                    }
                    if(t==rs.size()){
                %>
                </div>
                <%         
                    }
                }
                %>
			    <%-- <%
			    ActionContext ctx = ActionContext.getContext();
                Map request1 = (Map) ctx.get("request");
                List rs=(List)request1.get("results");
                List<String> l=new ArrayList<String>();
                int t=0,i=0;
                String cname="";
                boolean flag=true;
                while(t<rs.size()){
                    Result r=(Result)rs.get(i);
                    Course c=r.getCourse();
                    if(flag){
                        if(l.contains(c.getCname())){
	                        i++;
	                        if(i>=rs.size()){
	                            i=0;
	                            flag=true;
	                        }
	                        continue;
	                    }   
                        cname=c.getCname();
                        l.add(cname);
                        flag=false;
                %>
                <div class="total">
                    <div class="cname"><%=cname %></div>
                <%
                    }
                    if(c.getCname()!=cname){
                        i++;
                        if(i>=rs.size()){
                            i=0;
                            flag=true;
                        }
                        continue;
                    }
                    Question q=r.getQuestion();
                %>
                    <div class="result">
                        <div class="title"><span>Title:</span><%=q.getTitle() %></div>
                        <div class="answer"><span>Answer:</span><%=r.getAnswer() %></div>
                    </div>
                <%  
                    t++;
                    i++;
                    if(i>=rs.size()){
                        i=0;
                        flag=true;
                    }
                %>
                </div>
                <%
                }
			    %>
			    </div> --%>
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
	</script>
</body>
</html>