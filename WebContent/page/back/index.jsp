<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>在线考试系统| Dashboard</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    
   <!--* Bootstrap 3.3.7-Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/back/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    
     <!-- Ionicons 2.0.0 (主体内容图标)-->
   <!--  <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css"> -->    
    <link href="${pageContext.request.contextPath}/resources/back/dist/css/Ionicons/css/ionicons.min.css" rel="stylesheet" type="text/css">
    
     <!-- The fav icon(图标) -->
   <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/back/dist/img/credit/favicon.ico">
    
    <!-- FontAwesome 4.3.0 (页面图标)-->
    <link href="${pageContext.request.contextPath}/resources/back/dist/css/FontAwesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
  
    <!-- *-Theme style 主题样式-->
    <link href="${pageContext.request.contextPath}/resources/back/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css">
    
    <!-- 皮肤样式. -->
    <link href="${pageContext.request.contextPath}/resources/back/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css">

    
    <!-- DataTables -css-->
   <link  href="${pageContext.request.contextPath}/resources/back/plugins/DataTables/datatables.min.css" rel="stylesheet" type="text/css" />
  
  <!-- 弹窗 -->
   <link  href="${pageContext.request.contextPath}/resources/back/plugins/layer/theme/default/layer.css" />
   <link  href="${pageContext.request.contextPath}/resources/back/plugins/layer/layDate-v5.0.9/laydate/theme/default/laydate.css" />

<!--validation提示的样式-->
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/back/plugins/validation/site-demos.css">
	 
<!--   <style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style>
   -->
   

   
       <!-- jQuery 2.1.3 -->
    <script src="${pageContext.request.contextPath}/resources/back/jquery/dist/jquery.min.js"></script>
    
    <!-- jsp页面带参 -->
    <script src="${pageContext.request.contextPath}/resources/back/jquery/myJquery/jquery.params.js"></script>
 
    <!-- jQuery UI 1.11.2 -->
    <!-- <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.min.js" type="text/javascript"></script> -->
              <!-- 弹窗 -->
    <script src="${pageContext.request.contextPath}/resources/back/plugins/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/back/plugins/layer/layDate-v5.0.9/laydate/laydate.js"></script>
    
        <!-- *dataTablesjs -->
    <script src="${pageContext.request.contextPath}/resources/back/plugins/DataTables/DataTables-1.10.16/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/back/plugins/DataTables/datatables.min.js"></script> 
    <script src="${pageContext.request.contextPath}/resources/back/plugins/DataTables/DataTables-1.10.16/js/dataTables.bootstrap.min.js"></script>
    
     <script>
     /*  $.widget.bridge('uibutton', $.ui.button); */
    </script> 
    <!-- *Bootstrap 3.3.7 JS -->
    <script src="${pageContext.request.contextPath}/resources/back/bootstrap/dist/js/bootstrap.min.js"></script>   
 
    <!-- *AdminLTE App -->
    <script src="${pageContext.request.contextPath}/resources/back/dist/js/app.min.js" type="text/javascript"></script>
    
    <!-- validate 表单验证插件-->
   <script src="${pageContext.request.contextPath}/resources/back/plugins/validation/dist/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script>
  
   <!-- my js --> 
   <script src="${pageContext.request.contextPath}/resources/back/my.js" type="text/javascript"></script>
       
        
   <!-- 图片上传 js --> 
   <script src="${pageContext.request.contextPath}/resources/back/uploadPreview.js" type="text/javascript"></script>
         
  </head>
	<body class="skin-blue sidebar-mini wysihtml5-supported">
    <div class="wrapper">
      
      <header class="main-header">
        <!-- Logo -->
        <a href="index2.html" class="logo">
          <!-- 小图标，侧边栏mini 50x50像素-->
          <span class="logo-mini"><b>导</b>航</span>
          <!-- 用于常规状态和移动设备的标识 -->
          <span class="logo-lg"> <img src="${pageContext.request.contextPath}/resources/back/dist/img/credit/logo20.png" alt="logo"/>&nbsp;<b>在线考试</b>系统</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
  
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <!--右- 头像 -->
                  <img src="${pageContext.request.contextPath}/${sessionScope.user.m_portrait}" class="user-image" alt="User Image">
                  <span class="hidden-xs">账 号：${sessionScope.user.m_account}</span><!-- 用户名 -->     
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                   <!--右下- 头像 -->
                    <img src="${pageContext.request.contextPath}/${sessionScope.user.m_portrait}" class="img-circle" alt="User Image">
                    <p>
                         ${sessionScope.user.m_account}  <!-- 用户名 -->                
                      <small>登录时间：${sessionScope.loginTime}</small>
                    </p>
                  </li>
                  <!-- Menu Body -->
                  <li class="user-body">
                    <div class="col-xs-4 text-center">
                      <a href="#">Followers</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Sales</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Friends</a>
                    </div>
                  </li>
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">详细信息</a>
                    </div>
                    <div class="pull-right">
                      <a href="#" class="btn btn-default btn-flat">退出登录</a>
                    </div>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!-- 左列。包含徽标和侧栏。 -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar" style="height: auto;">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
             <!---- 左侧   头 像  ----->
              <img src="${pageContext.request.contextPath}/${sessionScope.user.m_portrait}" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p>${sessionScope.user.m_account}</p>

              <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
          </div>
          <!-- search form -->
          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">主要内容导航</li>

               <li id="home_page"><a><i class="fa fa-book"></i> 
                <span>首页</span></a>
                </li>
    
            <li class="treeview">
              <a href="#">
                <i class="fa fa-laptop"></i>
                <span>学生管理</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu" style="display: none;">
                <li id="classManage"><a ><i class="fa fa-circle-o text-aqua"></i> 班级管理</a></li>
                <li id="studentManage"><a ><i class="fa fa-circle-o text-red"></i>学生管理</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-edit"></i> <span>试卷管理</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu" style="display: none;">
                <li id="ques"><a><i class="fa fa-circle-o text-aqua"></i>出题管理</a></li>
                <li>
                <a id="pager"><i class="fa fa-circle-o text-yellow"></i>组卷<!-- <i class="fa fa-angle-left pull-right"></i> -->
                </a>
<!--                <ul class="treeview-menu">
                    <li id="pager_class"><a><i class="fa fa-circle-o text-red"></i>已发试卷</a></li>
                  </ul> -->
                </li>
                <li id="pager_class2"><a><i class="fa fa-circle-o text-red"></i>已发试卷</a></li>
              </ul>
            </li>
            
            <li class="treeview">
              <a href="#">
                <i class="fa fa-dashboard"></i> <span>管理员管理</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu" style="display: none;">
                <li id="manage"><a><i class="fa fa-circle-o text-aqua"></i>管理员管理</a></li>
                <li id="manageMyInfo"><a><i class="fa fa-circle-o text-yellow"></i>我的</a></li> <!-- href="index2.html" -->
              </ul>
            </li>
     
   
            <li class="treeview">
              <a href="#">
                <i class="fa fa-share"></i> <span>Multilevel</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu" style="display: none;">
                <li><a href="${pageContext.request.contextPath}/page/front/login.jsp">
                <i class="fa fa-circle-o text-red"></i>前台</a></li>
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> Level One <i class="fa fa-angle-left pull-right"></i></a>
                  <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                    <li>
                      <a href="#"><i class="fa fa-circle-o"></i> Level Two <i class="fa fa-angle-left pull-right"></i></a>
                      <ul class="treeview-menu">
                        <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                        <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                      </ul>
                    </li>
                  </ul>
                </li>
                <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
              </ul>
            </li>
        
            <li class="header">LABELS</li>
            <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      
     <!--
     	作者：2663902841@qq.com
     	时间：2018-04-14
     	描述：主体内容
     --> 
      <div id="page_wrapper" class="content-wrapper" style="min-height: 770px;">
 <!-----=================---主题 内容 ---------=====================================------------------->
      
 <!--================================ 主题内容END=========================================- -->
      </div>
      <!-- /.content-wrapper -->
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>版本</b> 0.2.1
        </div>
        <strong>著作权 © 2018.3-
        <script type="text/javascript">
         var today=new Date();
         var s=today.getFullYear()+"."+(today.getMonth()+1)+"."+today.getDate();
        document.write(""+s);
       </script>
 <a href="#">陆映质</a>.</strong> 保留所有权利.
      </footer>

      
    </div><!-- ./wrapper -->

     

 <script type="text/javascript">
 $(document).ready(function() {
	// $("#page_wrapper").load("page/back/homePage.jsp");
	   Welcome.init();
 });
 $("#classManage").click(function(){
	 clssManager.init();
	//$("#page_wrapper").load("page/back/class.jsp");
	});
 $("#studentManage").click(function(){
	 StudentManager.init();
	//$("#page_wrapper").load("page/back/student.jsp"); 
});
 $("#ques").click(function(){
	 quesManager.init();
	//$("#page_wrapper").load("page/back/ques.jsp"); ques
});
$("#pager").click(function(){
	$("#page_wrapper").load("page/back/pager.jsp");
	pagerManager.init();
});
$("#pager_class").click(function(){
	//alert("1");
	$("#page_wrapper").load("page/back/pagerClassEd.jsp");
});
$("#pager_class2").click(function(){
	$("#page_wrapper").load("page/back/pagerClassEd.jsp");
});

$("#manage").click(function(){//管理员
	$("#page_wrapper").load("page/back/manage.jsp");
});
$("#manageMyInfo").click(function(){//管理员(我的信息)
	$("#page_wrapper").load("page/back/manageMyInfo.jsp");
});

$("#home_page").click(function(){//首页
	Welcome.init();
});

 </script>
</html>
