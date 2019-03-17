<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.opensymphony.xwork2.ActionContext,cn.edu.zjut.po.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>findUserFail</title>
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
        .list{
            float:left;
            list-style:none;
            color:#fff;
            text-align:center;
            cursor:pointer;
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
        .search{
            width:370px;
            margin:0 auto;
            padding-top:80px;
        }
        .search .bt{
            width:40px;
        }
        .search .text{
            margin: 0 10px;
        }
        .add{
            margin:0 auto;
            padding-top:80px;
        }
        .submit{
            display:block;
            margin:0 auto;
            width:260px;
            height: 30px;
        }
        .report{
            margin:0 auto 120px;
            padding-top:80px;
        }
        .report th,
        .report td{
            width:100px;
        }
        .report td{
            text-align: center;
        }
        .tip {
		    padding: 20px 0;
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
                    <li class="list"><a href="manageUserCourse.jsp">学生课程管理</a></li>
                    <li class="list"><a href="manageCourseQuestion.jsp">课程题目管理</a></li>
                    <li class="list"><a href="searchResults.jsp">调查记录查询</a></li>
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