<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页（欢迎页面）</title>
</head>
<body>
      <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
                   在线考试系统
            <small>主页显示</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>主页</a></li>
            <li class="active">*</li>
          </ol>
        </section>
        
        <!-- -------------------------------------------- -->
         <!-- Main content -->
        <section class="content">
          <!-- Small boxes (Stat box) -->
          <div class="row">
            <div class="col-lg-3 col-xs-6">
            
            
              <!-- small box -->
              <div class="small-box bg-aqua" id="class">
                <div class="inner">
                  <h3><font style="vertical-align: inherit;">
                                                        学生管理
                     </font>
                  </h3>
                  <p><font style="vertical-align: inherit;">
                                            班级</font></p>
                </div>
                <div class="icon" style="margin-top:20px !important;" ><!-- style="margin-top:20px !important;" -->
                  <i class="ion ion-bag"></i>
                </div>
                <a class="small-box-footer">
                <font style="vertical-align: inherit;">
                                       更多信息 </font><i class="fa fa-arrow-circle-right"></i>
              </a>
              </div>
            </div><!-- ./col -->
            
            
            
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-green" id="ques">
                <div class="inner">
                  <h3><font style="vertical-align: inherit;">
                                       试卷管理 </font></h3>
                  <p><font style="vertical-align: inherit;">
                                    出题</font></p>
                </div>
                <div class="icon" style="margin-top:20px !important;">
                  <i class="ion ion-stats-bars"></i>
                </div>
                <a href="#" class="small-box-footer"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">更多信息 </font></font><i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
            
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">管理员</font></font></h3>
                  <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">添加管理员</font></font></p>
                </div>
                <div class="icon" style="margin-top:20px !important;">
                  <i class="ion ion-person-add"></i>
                </div>
                <a href="#" class="small-box-footer"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">更多信息 </font></font><i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
            
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
                  <h3>
                  <font style="vertical-align: inherit;">锁屏</font>
                  </h3>
                  <p>
                  <font style="vertical-align: inherit;">暂时离开</font></p>
                </div>
                <div class="icon" style="margin-top:20px !important;">
                  <i class="ion ion-pie-graph"></i>
                </div>
              
                <!--锁屏之前获取用户id  -->
                 <input type="hidden" name="m_id" value="${sessionScope.user.m_id}" />
                 <%-- <input type="text" name="m_id" value="${sessionScope.user.m_id}" /> --%>
                <a href="${pageContext.request.contextPath}/LoginManageServlet?op=lockCreen&m_id=${sessionScope.user.m_id}" class="small-box-footer">
                <font style="vertical-align: inherit;">确认锁屏 </font>
                <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
          </div><!-- /.row -->
          <!-- Main row -->
          <!-- /.row (main row) -->

        </section><!-- /.content -->
        
</body>
<script type="text/javascript">
$("#class").click(function(){
	 clssManager.init();
	//$("#page_wrapper").load("page/back/class.jsp");
	});
$("#ques").click(function(){//试题
	 quesManager.init();
	//$("#page_wrapper").load("page/back/ques.jsp"); ques
});

</script>
</html>