<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息修改</title>
</head>
<body>
	<form id="update_form" action="" method="post" class="form-inline">
		<div class="row">
			<div class="col-md-6 col-md-offset-4">
				         编号:<br /> 
				    <input type="text" id="id" class="form-control" placeholder="这里显示班级编号" disabled="disabled" /> <!-- disabled 失效-->
				    <br />照片:<br /> 
				     <img id="s_portrait" src="" width="100" height="100" alt=""> 
					<br /> 姓名:<br /> 
					<input type="text" id="s_name" class="form-control" placeholder="请输入姓名" />
					<br /> 学号:<br /> 
					<input type="text" id="s_number" class="form-control" value="" placeholder="请输入学号" /><br />
                     <br /> 身份证号码:<br />
                    <input type="text" id="s_identity" class="form-control" value="" placeholder="请输入身份证号码" /><br />
                     <br />出生日期:<br />
                    <input type="text" id="s_Birthdate" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" class="form-control" value="" placeholder="请输入出生日期" /><br />
                     <br /> 密码:<br />
                    <input type="text" id="s_password" class="form-control" value="" placeholder="请输入密码" /><br /> 
                     <br /> 性别:<br />
                    <input type="text" id="s_sex" class="form-control" value="" placeholder="请输入性别" /><br />  	
                      <br /> 班级:<br />
                    <input type="text" id="c_id" class="form-control" value="" placeholder="请输入班级" /><br /> 		
			</div>
		</div>
	</form>
</body>
</html>