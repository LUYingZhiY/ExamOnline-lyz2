<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <meta charset="utf-8">
    <title>在线考试系统</title>

    <meta name="description" content="blank page">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">

    <!--基本 Styles-->
    <link href="${pageContext.request.contextPath}/resources/front/assets/css/bootstrap.min.css" rel="stylesheet">
   <link id="bootstrap-rtl-link" href="" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/front/assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/front/assets/css/weather-icons.min.css" rel="stylesheet">

     <!-- The fav icon(图标) -->
   <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/back/dist/img/credit/favicon.ico">
    

    <!--Beyond styles-->
   <link id="beyond-link" href="${pageContext.request.contextPath}/resources/front/assets/css/beyond.min.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/resources/front/assets/css/demo.min.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/resources/front/assets/css/typicons.min.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/resources/front/assets/css/animate.min.css" rel="stylesheet"> 
   <link id="skin-link" href="" rel="stylesheet" type="text/css"> 

 <!-- DataTables -css-->
   <link  href="${pageContext.request.contextPath}/resources/back/plugins/DataTables/datatables.min.css" rel="stylesheet" type="text/css" />
  
    <!--皮肤脚本：将这个脚本放在头部，以加载用于皮肤和rtl支持的脚本-->
    <script src="${pageContext.request.contextPath}/resources/front/assets/js/skins.min.js"></script>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <div class="navbar-inner">
            <div class="navbar-container">
                <!-- Navbar Barnd -->
                <div class="navbar-header pull-left">
                    <a href="#" class="navbar-brand">
                        <small>
                        	在线考试
                          <!--img src="assets/img/logo.png" alt="">-->
                        </small>
                         <img src="${pageContext.request.contextPath}/resources/back/dist/img/credit/logo20.png" height="40" width="40" alt="logo"/>
                    </a>
                </div>
                <!-- /Navbar Barnd -->
                <!-- Sidebar Collapse -->
                <div class="sidebar-collapse" id="sidebar-collapse">
                    <i class="collapse-icon fa fa-bars"></i>
                </div>
                <!-- /Sidebar Collapse -->
                <!-- Account Area and Settings --->
                <div class="navbar-header pull-right">
                    <div class="navbar-account">
                        <ul class="account-area">
                            <li>
                                <a class="login-area dropdown-toggle" data-toggle="dropdown">
                                    <div class="avatar" title="View your public profile">
                                        <img src="${pageContext.request.contextPath}/${sessionScope.user.s_portrait}">
                                    </div>
                                    <section>
                                        <h2><span class="profile"><span>${sessionScope.user.s_name}</span></span></h2>
                                    </section>
                                </a>
                                <!--Login Area Dropdown-->
                                <ul class="pull-right dropdown-menu dropdown-arrow dropdown-login-area">
                                    <li class="username"><a>${sessionScope.user.s_name}</a></li>
                                    <li class="email"><a>${sessionScope.user.c_id.c_name}</a></li>
                                    <!--Avatar Area-->
                                    <li>
                                        <div class="avatar-area">
                                            <img src="${pageContext.request.contextPath}/${sessionScope.user.s_portrait}" class="avatar">
                                            <span class="caption">${sessionScope.user.s_name}</span>
                                        </div>
                                    </li>
                                    <!--Avatar Area-->
                                    <li class="edit">
                                        <a href="#" class="pull-left">详细信息</a>
                                        <a href="#" class="pull-right">设置</a>
                                    </li>
                                    <!--主题选择器-->
                                  <li class="theme-area">
                                        <ul class="colorpicker" id="skin-changer">
                                            <li><a class="colorpick-btn" href="#" style="background-color:#5DB2FF;" rel="assets/css/skins/blue.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#2dc3e8;" rel="assets/css/skins/azure.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#03B3B2;" rel="assets/css/skins/teal.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#53a93f;" rel="assets/css/skins/green.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#FF8F32;" rel="assets/css/skins/orange.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#cc324b;" rel="assets/css/skins/pink.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#AC193D;" rel="assets/css/skins/darkred.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#8C0095;" rel="assets/css/skins/purple.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#0072C6;" rel="assets/css/skins/darkblue.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#585858;" rel="assets/css/skins/gray.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#474544;" rel="assets/css/skins/black.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#001940;" rel="assets/css/skins/deepblue.min.css"></a></li>
                                        </ul>
                                    </li>
                                    <!--/主题选择器-->
                                    <li class="dropdown-footer">
                                        <a href="login.html">
                                            	退出登录
                                        </a>
                                    </li>
                                </ul>
                                <!--/Login Area Dropdown-->
                            </li>
                            <!-- /Account Area -->
                            <!--Note: notice that setting div must start right after account area list.
                            no space must be between these elements-->
                            <!-- Settings -->
                        </ul>
                        <div class="setting">
                            <a id="btn-setting" title="Setting" href="#">
                                <i class="icon glyphicon glyphicon-cog"></i>
                            </a>
                        </div><div class="setting-container">
                            <label>
                                <input type="checkbox" id="checkbox_fixednavbar">
                                <span class="text">Fixed Navbar</span>
                            </label>
                            <label>
                                <input type="checkbox" id="checkbox_fixedsidebar">
                                <span class="text">Fixed SideBar</span>
                            </label>
                            <label>
                                <input type="checkbox" id="checkbox_fixedbreadcrumbs">
                                <span class="text">Fixed BreadCrumbs</span>
                            </label>
                            <label>
                                <input type="checkbox" id="checkbox_fixedheader">
                                <span id="back" class="text">后台</span>
                            </label>
                        </div>
                        <!-- Settings -->
                    </div>
                </div>
                <!-- /Account Area and Settings -->
            </div>
        </div>
    </div>
    <!-- /Navbar -->
    <!-- Main Container -->
    <div class="main-container container-fluid">
        <!-- Page Container -->
        <div class="page-container">
            <!-- Page Sidebar -->
            <div class="page-sidebar" id="sidebar">
                <!-- Page Sidebar Header-->
                <div class="sidebar-header-wrapper">
                    <input type="text" class="searchinput">
                    <i class="searchicon fa fa-search"></i>
                    <div class="searchhelper">Search Reports, Charts, Emails or Notifications</div>
                </div>
                <!-- /Page Sidebar Header -->
                <!-- Sidebar Menu -->
                <ul class="nav sidebar-menu">
                    <!--Dashboard-->
                    <li id="body_b">
                        <a >
                            <i class="menu-icon glyphicon glyphicon-home"></i>
                            <span class="menu-text">考生须知</span>
                        </a>
                    </li>
                    <!--Databoxes-->
                    <li id="exam">
                        <a href="#">
                            <i class="menu-icon glyphicon glyphicon-tasks"></i>
                            <span class="menu-text"> 开始考试 </span>
                        </a>
                    </li>
                    <!--Widgets-->
                    
                    <!--UI Elements-->
                    
                    <!--Tables-->
                    
                    <!--Forms-->
                    <li>
                        <a href="#" class="menu-dropdown">
                            <i class="menu-icon fa fa-pencil-square-o"></i>
                            <span class="menu-text"> Forms </span>

                            <i class="menu-expand"></i>
                        </a>

                        <ul class="submenu">
                            <li>
                                <a href="#">
                                    <span class="menu-text">Form Layouts</span>
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <span class="menu-text">Form Inputs</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="menu-text">Data Pickers</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="menu-text">Wizard</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="menu-text">Validation</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="menu-text">Editors</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!--Charts-->
                    <li>
                        <a href="#" class="menu-dropdown">
                            <i class="menu-icon fa fa-align-right"></i>
                            <span class="menu-text"> Charts </span>

                            <i class="menu-expand"></i>
                        </a>

                        <ul class="submenu">
                            <li>
                                <a href="#">
                                    <span class="menu-text">Flot Charts</span>
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <span class="menu-text"> Morris Charts</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="menu-text">Sparkline Charts</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="menu-text">Easy Pie Charts</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="menu-text"> ChartJS</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- /Sidebar Menu -->
            </div>
            <!-- /Page Sidebar -->
            <!-- Page Content -->
            <div class="page-content">
                <!-- Page Breadcrumb -->
                <div class="page-breadcrumbs">
                    <ul class="breadcrumb">
                        <li>
                            <i class="fa fa-home"></i>
                            <a href="#">Home</a>
                        </li>
                        <li>
                            <a href="#">More Pages</a>
                        </li>
                        <li class="active">Blank Page</li>
                    </ul>
                </div>
                <!-- /Page Breadcrumb -->
                <!-- Page Header -->
                <div class="page-header position-relative">
                    <div class="header-title">
                        <h1>
                                                                 在线考试
                        </h1>
                    </div>
                    <!--Header Buttons-->
                    <div class="header-buttons">
                        <a class="sidebar-toggler" href="#">
                            <i class="fa fa-arrows-h"></i>
                        </a>
                        <a class="refresh" id="refresh-toggler" href="">
                            <i class="glyphicon glyphicon-refresh"></i>
                        </a>
                        <a class="fullscreen" id="fullscreen-toggler" href="#">
                            <i class="glyphicon glyphicon-fullscreen"></i>
                        </a>
                    </div>
                    <!--Header Buttons End-->
                </div>
                <!-- /Page Header -->
                <!-- Page Body -->
                <div id="page_body" class="page-body">
                    主体内容
                </div>
                <!-- /Page Body -->
            </div>
            <!-- /Page Content -->
        </div>


    </div>

    <!--Basic Scripts-->
    <script src="assets/js/jquery-2.0.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!--Beyond Scripts-->
    <script src="assets/js/beyond.min.js"></script>
    
            <!-- *dataTablesjs -->
    <script src="${pageContext.request.contextPath}/resources/back/plugins/DataTables/DataTables-1.10.16/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/back/plugins/DataTables/datatables.min.js"></script> 
    <script src="${pageContext.request.contextPath}/resources/back/plugins/DataTables/DataTables-1.10.16/js/dataTables.bootstrap.min.js"></script>
    

</body>
<script type="text/javascript">
$(document).ready(function() {
	 $("#page_body").load("page/front/homePage.jsp");
 });
$("#body_b").click(function(){
	$("#page_body").load("page/front/homePage.jsp");
	});
$("#exam").click(function(){
	$("#page_body").load("page/front/exam.jsp");
	});
$("#back").click(function(){
	window.location.href="page/back/login.jsp";
	});

</script>
</html>