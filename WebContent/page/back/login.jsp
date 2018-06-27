<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>在线考试系统|Login</title>
     <style>
        img{
            cursor: pointer;/*鼠标的图形形状()*/
            width: 180px;
            height: 35px;
            /*margin-left: 70px;*/
        }
    </style>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/back/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/back/dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- The fav icon(图标) -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/back/dist/img/credit/favicon.ico">
    
    <!--validation提示的样式-->
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/back/plugins/validation/site-demos.css">
</head>
<body>
    <div class="container">
            <div class="col-md-5 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">在线考试系统</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" id="signupForm" method="post" action="${pageContext.request.contextPath}/LoginManageServlet?op=login" >
                            <fieldset>
                            	<div class="">
                                <div class="form-group  col-lg-12">
                                    <input class="form-control" placeholder="账号" name="account" type="text" autofocus><!--autofocus：选中-->
                                </div>
                                <div class="form-group  col-lg-12">
                                    <input class="form-control" placeholder="密码" name="inputPassword" type="password" value="">
                                </div>
                                 </div>
								    <div class="form-group col-lg-6">
								      <input type="text" name="verify" class="form-control" id="code" placeholder="验证码">
								  
							
								    </div>
								    								     
								      <img src="${pageContext.request.contextPath}/KaptchaServlet" alt="" onclick="refreshCode(this)">
							
                               <!-- <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div> -->
                                <div class="">
                                <!-- Change this to a button or input when using this as a form -->
                                	 <!--<a href="index.html"  class="btn btn-lg btn-success btn-block">登录</a>-->
                                	 <!-- submit -->
                                	<button type="submit" id="button_login" class="btn btn-lg btn-primary btn-block">登录</button> 
                               </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
    </div>

    <!-- jQuery v2.1.3-->
    <script src="${pageContext.request.contextPath}/resources/back/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/back/bootstrap/dist/js/bootstrap.min.js"></script>

     <!-- validate 表单验证插件-->
    <script src="${pageContext.request.contextPath}/resources/back/plugins/validation/dist/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script>
    
   <!--背景插件 -->
   <script src="${pageContext.request.contextPath}/page/front/pager/dist/js/canvas-particle.js" type="text/javascript" charset="utf-8"></script>
    
</body>
<script>

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
  
 	$.validator.setDefaults({
     //debug: true,//只验证不提交表单
     success: "valid" //验证成功后显示‘正确’图标
      }); 

	$().ready(function() {
	//------------表单验证
      $("#signupForm").validate({
			rules: {
				account:{
					required:true
				},
                 inputPassword:{
                 	required:true,
                 }
                  ,verify:{
                 	required:true,
                 	rangelength: [1, 4],
                 	//判断验证码是否正确
				 	 remote: {
	    			        url: "${pageContext.request.contextPath}/VerificationCodeServlet",
	    			        type: "get",
	    			        //提交到服务器的内容
	    			        data: {
	    			        	code: function() {
	    			        	//传的验证码
	    			        	 // var code=$("#code").val();
	    			            return $( "#code" ).val();
	    			          }
	    			        }
	    			      } 
                 } 
			},
		    messages:{
		    	account:{
		    		required:"用户名不能为空！！",
		    	},
                inputPassword:{               //-----------------------------’inputAge‘是input的name属性值
                	required:"密码不能为空！！",
                }
                 ,verify:{
                   required:"验证码不能为空！！",
                	rangelength:"长度超过限制！！！",
                	remote:"验证码错误！! !" 
                } 
		    },
		     submitHandler:function(form){//验证成功后
	           // alert("提交事件!");   
	            form.submit();
	        } 
		 });
	});
      /**
       * 改变请求路径
       * **--刷新验证码--**
       * @param obj  (img)
       */
        function refreshCode(obj){
        	var time = new Date().getTime();//根据时间的不同，传的参数也不同，缓存就不起作用（刷新）
            obj.src="${pageContext.request.contextPath}/KaptchaServlet?d="+time
        }

</script>
</html>