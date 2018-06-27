<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>在线考试系统|锁屏</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
   
    <!--* Bootstrap 3.3.7-Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/back/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  
    <!-- *-Theme style 主题样式-->
    <link href="${pageContext.request.contextPath}/resources/back/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css">
    
            <!-- The fav icon(图标) -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/back/dist/img/credit/favicon.ico">
    
 
<link type="text/css" rel="stylesheet" charset="UTF-8" href="https://translate.googleapis.com/translate_static/css/translateelement.css"></head>
<body class="lockscreen">
    <!-- Automatic element centering -->
    <div class="lockscreen-wrapper">
      <div class="lockscreen-logo">
        <b><font style="vertical-align: inherit;">
        <font style="vertical-align: inherit;">在线考试</font></font></b>
        <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">系统</font></font>
      </div>
      <!-- User name -->
      <div class="lockscreen-name"><font style="vertical-align: inherit;">
      <!-- 用户名 -->
      <font style="vertical-align: inherit;">${sessionScope.user.m_account}</font></font>
      </div>

      <!-- START LOCK SCREEN ITEM -->
      <div class="lockscreen-item">
        <!-- lockscreen image -->
        <div class="lockscreen-image">
        <!-- 头像 -->
          <img src="${pageContext.request.contextPath}/${sessionScope.user.m_portrait}" alt="用户图像">
        </div>
        <!-- /.lockscreen-image -->

        <!-- (form表单) -->
        <form class="lockscreen-credentials" method="post" action="${pageContext.request.contextPath}/LoginManageServlet?op=reLogin">
           <input type="hidden" name="m_id" value="${sessionScope.user.m_id}" />
            <input type="hidden" name="m_password" value="${sessionScope.user.m_password}" />
          
          <div class="input-group">
            <input type="password" class="form-control" name="password" placeholder="password" autofocus>
            <div class="input-group-btn">
              <button type="submit" class="btn"><i class="fa fa-arrow-right text-muted"></i></button>
            </div>
          </div>
        </form>

      </div><!-- /.lockscreen-item -->
      <div class="help-block text-center"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
        输入您的密码来检索您的会话
      </font></font></div>
      <div class="text-center">
        <a href="${pageContext.request.contextPath}/page/back/login.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">或者以其他用户身份登录</font></font></a>
      </div>
      <div class="lockscreen-footer text-center">
      <font style="vertical-align: inherit;">
        版权所有©2018.3-
        <script type="text/javascript">
         var today=new Date();
         var s=today.getFullYear()+"."+(today.getMonth()+1)+"."+today.getDate();
        document.write(""+s);
       </script></font>
        <b><a href="#" class="text-black">
        <font style="vertical-align: inherit;">
        陆映质</font></a></b>
        <br><font style="vertical-align: inherit;"> 
        保留所有权利
      </font></div>
    </div><!-- /.center -->

    <!-- jQuery 2.1.3 -->
    <script src="${pageContext.request.contextPath}/resources/back/jquery/dist/jquery.min.js"></script>
    <!-- *Bootstrap 3.3.7 JS -->
    <script src="${pageContext.request.contextPath}/resources/back/bootstrap/dist/js/bootstrap.min.js"></script>   
    
</body>
</html>