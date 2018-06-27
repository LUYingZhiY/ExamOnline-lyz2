<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--Head-->
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学生登录</title>

     <meta name="description" content="login page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">

    <!-- Basic Styles -->
    <link href="${pageContext.request.contextPath}/resources/front/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link id="bootstrap-rtl-link" href="" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/front/assets/css/font-awesome.min.css" rel="stylesheet" /> 

    
        <!-- The fav icon(图标) -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/back/dist/img/credit/favicon.ico">
    

    <!--Beyond styles-->
    <link id="beyond-link" href="${pageContext.request.contextPath}/resources/front/assets/css/beyond.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/front/assets/css/demo.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/front/assets/css/animate.min.css" rel="stylesheet" />
    <link id="skin-link" href="" rel="stylesheet" type="text/css" /> 

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
     <script src="${pageContext.request.contextPath}/resources/front/assets/js/skins.min.js"></script>
</head>
<!--Head Ends-->
<!--Body-->
<body>
    <div class="login-container animated fadeInDown">
        <div class="loginbox bg-white">
            <div class="loginbox-title">登录</div>
            <div class="loginbox-social">
                <div class="social-title ">使用社交账号登录。</div>
                <div class="social-buttons">
                    <a href="" class="button-facebook">
                        <i class="social-icon fa fa-facebook"></i>
                    </a>
                    <a href="" class="button-twitter">
                        <i class="social-icon fa fa-twitter"></i>
                    </a>
                    <a href="" class="button-google">
                        <i class="social-icon fa fa-google-plus"></i>
                    </a>
                </div>
            </div>
            <div class="loginbox-or">
                <div class="or-line"></div>
                <div class="or">或</div>
            </div>
            
          <form role="form" id="signupForm" method="post" action="${pageContext.request.contextPath}/LoginStudentServlet?op=login">
            <div class="loginbox-textbox">
                <input type="text" class="form-control" name="account" placeholder="账号" />
            </div>
            <div class="loginbox-textbox">
                <input type="text" class="form-control" name="inputPassword" placeholder="密码" />
            </div>
            <div class="loginbox-forgot">
                <a href="">忘记密码?</a>
            </div>
            <div class="loginbox-submit">
                <input type="submit" class="btn btn-primary btn-block" value="登录">
            </div>
            <div class="loginbox-signup">
                <a href="#">注册</a>
            </div>
         </form>
        </div>
<!--         <div class="logobox">
        </div> -->
    </div>


</body>
    <!-- jQuery v2.1.3-->
    <script src="${pageContext.request.contextPath}/resources/back/jquery/dist/jquery.min.js"></script>

   <!--背景插件 -->
   <script src="${pageContext.request.contextPath}/page/front/pager/dist/js/canvas-particle.js" type="text/javascript" charset="utf-8"></script>
    
    <script type="text/javascript">
    window.onload = function(){//背景（初始化画布）
    	var config = {
    		vx: 4,
    		vy:  4,
    		height: 2,
    		width: 2,
    		count: 100,
    		color: "121, 162, 185",
    		stroke: "100,200,180",
    		dist: 6000,
    		e_dist: 20000,
    		max_conn: 10
    	}
    	CanvasParticle(config);
    }
    </script>
</html>