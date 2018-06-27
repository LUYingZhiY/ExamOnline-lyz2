<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分配试卷</title>
<style type="text/css">
 #content_div{
           /*  background:green; */
/*             position: absolute;
            left:30%;
            top:30%;
            margin-left:-100px;
            margin-top:-100px; */
        }        
</style>
</head>
<body>
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
                   在线考试系统
            <small>试卷管理</small>
          </h1>
          <ol class="breadcrumb">
            <li><a id="homePage"><i class="fa fa-dashboard"></i>主页</a></li>
            <li class="active">组卷</li>
              <li class="active">分配试卷</li>
          </ol>
        </section>
	<!-- -------------------------------------------------------------- -->
<section class="content">
<div class="col-xs-6" id="content_div">
<form action="PagerServlet?op=addPagerClass" method="post">

  <div class="form-group">
  <label for="exampleInputPassword1">考试类型</label>
  <input class="form-control" type="text" name="pc_title">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">试卷</label>
     <select name="pid" class="form-control">
	   <option value ="1">生活常识在线考试（50题）</option>
	   <option value ="2">JAVA期末考试（50题）</option>
	   </select>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">班级</label>
   	   <select name="cid" class="form-control">
	   <option value ="1">java1班</option>
	   <option value ="2">java2班</option>
	   <option value ="3">java3班</option>
	   <option value ="4">java4班</option>
	   <option value ="5">java5班</option>
	   </select>
  </div>
  <div class="form-group">
  <label for="exampleInputPassword1">开始时间</label>
  <input id="startTime" class="form-control" type="text" name="startTime">
  </div>
    <div class="form-group">
    <label for="exampleInputPassword1">结束时间</label>
    <input id="endTime" class="form-control" type="text" name="endTime">
  </div>

  <button type="submit" class="btn btn-primary btn-lg btn-block">提交</button>
  <br>
    <button type="button" id="fh" class="btn btn-warning">返回</button>
</form>
</div>
</section>
</body>
<script type="text/javascript">
//日期时间选择器
laydate.render({ 
  elem: '#startTime'
  ,type: 'datetime'
});
laydate.render({ 
	  elem: '#endTime'
	  ,type: 'datetime'
	});
$("#fh").click(function(){
	$("#page_wrapper").load("page/back/pager.jsp");
	//pagerManager.init();
   	});
</script>
</html>