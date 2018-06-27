<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加管理员</title>
<!-- 	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.mockjax.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
 -->

</head>
<body>

        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
                   在线考试系统
            <small>管理员管理</small>
          </h1>
          <ol class="breadcrumb">
            <li><a id="homePage"><i class="fa fa-dashboard"></i>主页</a></li>
            <li id="manage" class="fa fa-dashboard">管理员管理</li>
             <li class="active">添加管理员</li>
          </ol>
        </section>
   <!----------------主题 内容 ------------------------------------------------------------->
	
	<section class="content">
	<div class="col-xs-6" id="content_div">
		<form id="signupform" action="" method="post" enctype="multipart/form-data" >

			<div class="form-group">
				<label for="exampleInputPassword1">设置管理员账号</label> 
				<input class="form-control" type="text" name="name" id="m_name">
			</div>
			<br>
			<div class="form-group">
				<label for="exampleInputPwd">密码</label> <input class="form-control"
					type="password" id="password" name="pwd">
			</div>
			<br>
			<div class="form-group">
				<label for="exampleInputPwd">重新输入密码</label> 
				<input class="form-control" type="password" id="password_confirm"
					name="pwd_confirm">
			</div>
			<br>
			<div class="form-group">
				<label for="exampleInputSex">性别</label> 
				<select id="sex" name="sex" class="form-control">
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
			</div>
         <!--    <br> -->
			<div class="form-group">
				<label for="exampleInputSex">头像</label>
			<div id="imgdiv">
				<img id="imgShow" src="" width="100" height="100" alt="头像" />
			</div>
			<input type="file" name="file" id="up_img" name="up_ing_file" onchange="ajaxFileUpload()" />
			</div>


			<button type="submit" class="btn btn-primary btn-lg btn-block">提交</button>
			<br>
			<button type="button" id="fh" class="btn btn-warning">返回</button>
		</form>
	</div>
	</section>
</body>
<script type="text/javascript">

var filePath=$("#up_img").val(); //获取选中的文件
  var flag=false;
  if(filePath!=""){//判断是否上传了头像
 	flag=true;
  }

 //图片上传(预览功能)
new uploadPreview({ UpBtn: "up_img", DivShow: "imgdiv", ImgShow: "imgShow" });
$("#up_img").val(""); //清空上次选中的文件

	$.validator.setDefaults({
		//debug: true,//只验证不提交表单
		success : "valid" //验证成功后显示‘正确’图标
	});
	$(document).ready(function() {
		 $("#signupform").validate({
			rules : {
				pwd : {
					required : true,
					minlength : 5
				},
				pwd_confirm : {
					required : true,
					minlength : 5,
					equalTo : "#password"
				},
				name : {
					required : true,
					minlength : 3
				},
			/* 	up_ing_file:"required" */
			},
			messages : {
				pwd : {
					required : "密码不能为空。",
					minlength : "请输入至少5个字符。"
				},
				pwd_confirm : {
					required : "请输入重复密码。",
					equalTo : "请输入与上面相同的密码。"
				},
				name : {
					required : "请输入用户名。",
					minlength : "请输入至少3个字符。"
				},
				/* up_ing_file:"请上传头像！！！" */
			},
			submitHandler : function(form) {//验证成功后 
				// alert("提交事件!");   
				//form.submit();
				
		          //获取字段值
         	     //var q_id=document.getElementById("q_id").value;
         	     var m_name=$("#m_name").val();
         	     var m_pwd=$("#password").val();
         	     var m_sex=$("#sex").val();
         	     var filePath=$("#up_img").val(); //获取选中的文件
         	     var flag=false;
         	     if(filePath!=""){//判断是否修改了头像
         	    	flag=true;
         	     }
         	    alert(m_name+'/'+m_pwd+'/'+m_sex+"/"+filePath+"//"+flag)
		          $.ajax({
    		        	statusCode: {
    		        	    404: function() {
    		    			layer.alert("抱歉，出Bug了。路径错误-404！！！",{
    		            		icon: 7//图标
    		            	});
    		        	    }
    		        	  },
    		        	url:"${pageContext.request.contextPath}/ManageServlet?op=add&m_account="+m_name+"&m_password="+m_pwd+"&m_sex="+m_sex+"&flag="+flag,                      
    		            type: 'POST',
    		            cache: false, 
    		           data: new FormData($('#signupform')[0]), 
    		            processData: false,
    		            contentType: false, 
    		            dataType:"json", 
    		             //dataType:'text',
    		             beforeSend: function(){
    		                uploading = true;
    		            }, 
    		            success : function(data) {
        		     		//alert(data);
        		     		if(data!=""){
        		     			$("#page_wrapper").load("page/back/manage.jsp");
					     		layer.msg('添加成功', {icon:1});
				     			/* layer.close(index);  */      	                  		     			
        		     		}else{
        		     			layer.alert("操作失败！！！",{
        		            		icon: 5//图标
        		            	});
        		     			/* layer.close(index); */
        		     		}
    		            }
    		        });//ajax__END  
			} 
	 	}); 
		
        function ajaxFileUpload() {
            //图片格式验证
            // alert("图片格式验证");
            var x = document.getElementById("up_img");
            if (!x || !x.value) return;
            var patn = /\.jpg$|\.jpeg$|\.png$|\.gif$/i;
            if (!patn.test(x.value)) {
               //alert("您选择的似乎不是图像文件。");
               layer.alert("您选择的似乎不是图像文件！！");
               x.value = "";
               return;
           }
            } 	

	});//ready_END
</script>
</html>