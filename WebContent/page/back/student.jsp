<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生管理</title>
<style type="text/css">
    td.details-control {
    background: url('resources/back/plugins/DataTables/DataTables-1.10.16/images/details_open.png') no-repeat center center;
    cursor: pointer;
     }
    tr.shown td.details-control {
    background: url('resources/back/plugins/DataTables/DataTables-1.10.16/images/details_close.png') no-repeat center center;
     }
</style>


</head>
<body>
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
                   在线考试系统
            <small>学生管理</small>
          </h1>
          <ol class="breadcrumb">
            <li><a id="homePage"><i class="fa fa-dashboard"></i>主页</a></li>
            <li class="active">学生管理</li>
          </ol>
        </section>
	<!-- -------------------------------------------------------------- -->
     <div class="box">
          <div class="box-header">
              <!--   <h3 class="box-title">学生信息管理</h3> -->
					<button id="addStudent" class="btn btn-success">添加学生信息</button>
					<button id="importStudents" class="btn btn-success">导入学生信息</button>  <!-- style="margin-left: 1150px" -->
           </div><!-- /.box-header -->
        <div class="box-body">
        <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
         <div class="row">
         <div class="col-sm-12">
      <table id=studeneDataTables class="display" style="width:100%">
        <thead>
            <tr>
                <th></th>
                <th>行号</th>
                <th>
                <label class="mt-checkbox">  
                    <input type="checkbox" id="studentList" class="group-checkable" />  
                    <span>全选</span>  
				   <button id="delectStudent_id" class='btn btn-danger' >删除</button>  
                </label>
                </th>
                <th>学生标识</th>
                <th>姓名</th>
                  <th>学号</th>
                <th>身份证号码</th>
                <th>出生日期</th>
                <th>密码</th>
                <th>性别</th>
                 <th>班级</th>
                 <th>操作</th>
            </tr>
        </thead>
<!--         <tfoot>
            <tr>
                <th></th>
                <th>行号</th>
            </tr>
        </tfoot> -->
    </table>
      </div>
      </div>
     </div>
       </div><!-- /.box-body -->
   </div><!-- /.box -->
   	  <!-- 修改班级form，默认隐藏 -->
	<form id="update_form" action="" method="post" hidden="hidden" class="form-inline">
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
                    <input type="text" id="s_Birthdate" class="form-control" value="" placeholder="请输入出生日期" /><br />
                     <br /> 密码:<br />
                    <input type="text" id="s_password" class="form-control" value="" placeholder="请输入密码" /><br /> 
                     <br /> 性别:<br />
                    <input type="text" id="s_sex" class="form-control" value="" placeholder="请输入学号性别" /><br />  	
                      <br /> 班级:<br />
                    <input type="text" id="c_id" class="form-control" value="" placeholder="请输入班级" /><br /> 		
			</div>
		</div>
	</form>
</body>
   <script type="text/javascript">
   /*
   *
   *显示行的附加信息
   */
   function format ( d ) {
	   // `d` 是该行的原始数据对象
	   
        return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
            '<tr>'+
                '<td>说明:</td>'+
                 '<td>'+d.s_name+'上传的头像'+'</td>'+ 
            '</tr>'+
            '<tr>'+
                '<td>头像:</td>'+
                  '<td><img src="${pageContext.request.contextPath}/'+d.s_portrait+'" width="100" height="100" alt='+d.s_name+'></td>'+
            '</tr>'+
            '<tr>'+
            '<td>路径:</td>'+
            '<td>${pageContext.request.contextPath}/'+d.s_portrait+'</td>'+
        '</tr>'+
        '</table>';
    }
   
   $(document).ready(function() {
	   
	   var table = $("#studeneDataTables").DataTable({
	   
      	    "processing": true,  // 加载状态 
      	   "aLengthMenu": [[5,10, 15, -1], [5, 10, 15, "全部"]],//让用户选择页面记录数量 
      	   // "iDisplayLength": 10, //默认页面中的记录数量。 
           "serverSide": true,//开启服务端分页操作，每次对 datatable 进行操作时也是请求后台  
           "aoColumnDefs": [ { "bSortable": false, "aTargets": [ 0 ] }],//设置第一列不可排序
           //"aaSorting": [[ 0, "desc" ]], //设置第一列默认降序 
            //"bSort": false, //禁用排序 
            "ajax": {
            	type: "post", 
            	 url:"${pageContext.request.contextPath}/StudentServlet?op=showData", 
                dataType: "json" //数据类型
            },
	  		  /*
	 		   * 语言
	 		   */
    	      "language": { 
    		      "url": "${pageContext.request.contextPath}/resources/back/plugins/DataTables/language/Chinese.json"
    		  },
    		  
    		  /*
    		  * 数据 
    		  */
    		   "columns":[
    		         { //显示行的附加信息列
    		                "className":'details-control',
    		                "orderable":false,
    		                "data":null,
    		                "defaultContent": ''
    		            },
    		            { //行号
    		                data : null,  
    		               // bSortable : false, 
    		                orderable : false,  //禁用排序
    		                //className : "text-left", //左对齐 
    		                className : "text-center",  //居中
    		                width :"50px", //行宽
    		                render : function(data, type, row, meta) {  
    		                    // 显示行号  
    		                    var startIndex = meta.settings._iDisplayStart; 
    		                    return startIndex + meta.row + 1;  
    		                        }
    		            },
    			          {   // 复选框单元格  
    		                className: "td-checkbox",  
    		                orderable : false,  //禁用排序	
    		                bSortable : false, 
    		                data : "s_id",  //列的id
    		                width : '110px',
    		                render : function(data, type, row, meta) {  
    		                    var content = '&nbsp;'; 
    		                    content +='<label class="mt-checkbox">'
    		                    content += '<input type="checkbox" name="studentList_Name" class="group-checkable" value="' + data + '" />';  
    		                    content += '<span></span>';  
    		                    content += '</label>';  
    		                    return content;  
    		                }  
    		            },
    		  { "data": "s_id" },//学生标识
    		  { "data": "s_name" },
    		  { "data": "s_number" },
    		  { "data": "s_identity" },
    		  {"data":"s_Birthdate"},
    		  { "data": "s_password" },
    		  { "data": "s_sex" },
  		      { "data": "c_id.c_name" }, //班级id
    		   /*  {  //班级
                  data : 'c_id.c_id',  
                  bSortable : false,  
                  width : "30px",  
                  className : "text-center",  //居中
                  render : function(data, type, row, meta) {  
                	 // alert(data)
                	 var id=data;
                	 var className='';
                 	     $.ajax({
						        url:"${pageContext.request.contextPath}/StudentServlet?op=queryClass&id="+id,
						        type:"post",
						        dataType:"json",
						        //data:传的数据
						        success: function(data) {
						        // alert(data[0].c_name)
						        //$('#add').append(className);
						        
						        	className='<label><span>'+data[0].c_name+'</span></label>';
						        	
						        	//console.log(data[0]);
						        }
                	     })
                	   //return '<label><span>JAVA班</span></label>';
                	     return className;
                  }
                    /* if (data == 1) {
                          return '<label><span>JAVA班</span></label>';
                      } else if (data == 2) {
                    	  return  '<span title="未知">C++班</span>';  
                      }else{
                          return '<span title="未知">未知</span>';  
                      }
                     /
              }, */
	     	    {    //相关操作按钮
    			  "data":null, 
	     	    	"orderable":false, //禁用排序	     	  
	     	    	"render": function (data, type, full) {
	     	    //修改按钮(绑定修改事件（onclick="editStudentInfo）)
	     	    edit = "<button id='editBtn' class='btn'>修改</button>";/* onclick='editStudentInfo(this)' */
                 return edit;
                     }
	     	    }
        	],
        	"order": [[1, 'asc']]
    		  
        });//DataTable__END
	   
       //*2.* $("div.toolbar").html('<hr><b style="color:red">自定义文字、图片等等</b><hr><br>');
       
        /*
        *显示行的附加信息
        *为打开和关闭细节添加事件监听器
        */ 
        $('#studeneDataTables tbody').on('click', 'td.details-control', function () {// "className":'details-control'
            var tr = $(this).closest('tr');
            var row = table.row(tr);
           
            if (row.child.isShown() ) {
                //这一行已经打开了-关闭它
                row.child.hide();
                tr.removeClass('shown');
            }
            else {
                //打开这一行
                row.child( format(row.data())).show(); // alert(row.data().s_id)
                tr.addClass('shown');
            }});
        
        /*
        *修改按钮点击事件
        */
        $('#studeneDataTables tbody').on('click', '#editBtn', function () {
            var tr = $(this).closest('tr');
            //console.log(tr); //在前台打印
            var row = table.row(tr); //table(var table = $("#studeneDataTables").DataTable({...)
            //alert(row.data().s_id);
            var stuInfo=row.data();
            
        	$("#id").val(stuInfo.s_id);
        	$("#s_name").val(stuInfo.s_name);
        	$("#s_password").val(stuInfo.s_password);
        	$("#s_portrait").attr("src",stuInfo.s_portrait);
        	$("#c_id").val(stuInfo.c_id.c_name);
        	$("#s_Birthdate").val(stuInfo.s_Birthdate);
        	$("#s_identity").val(stuInfo.s_identity);
        	$("#s_number").val(stuInfo.s_number);
        	$("#s_sex").val(stuInfo.s_sex);
        	
           	layer.open({
           		title:"修改学生信息",
           		skin:"layui-layer-lan",
           	  	type: 1,
           	  	anim: 4, //动画类型
           	  	area: ["550px", "350px"], //宽高
           	   	btn: ["确认","取消"],//按钮
           	   	content:$("#update_form"),//
           	   	yes: function(index, layero){
           	          //获取修改的字段值
           	     //var s_portrait2=$("#newClassName").val;
           		 var sid=document.getElementById("id").value;
           		 var s_name=document.getElementById("s_name").value;
           		 var s_password=document.getElementById("s_password").value;
           		 /**
           		 *注：班级和头像暂时不能修改
           		 */
           		 var s_portrait=stuInfo.s_portrait;
           		 var c_id=stuInfo.c_id.c_id;
           		 
           		 var s_Birthdate=document.getElementById("s_Birthdate").value;
           		 var s_identity=document.getElementById("s_identity").value;
           		 var s_number=document.getElementById("s_number").value;
           		 var s_sex=document.getElementById("s_sex").value;
           		  
           		//alert(sid+'/'+s_name+'/'+s_password+'/'+s_portrait+'/'+c_id)
           		    if(s_Birthdate==""||s_name==""||s_password==""||s_portrait==""||c_id==""||s_Birthdate==""){
           		    	layer.msg('字段不能为空！！！');
           		    	//alert("不能为空！！！")
           		    }else{
           		    	//	 processData: false,
           		     $.post("${pageContext.request.contextPath}/StudentServlet?op=updateStuden",
           		    	{
           		        //带的参数
           		    	  "sId":sid,
           			      "sName":s_name,
           			      "sPassword":s_password,
           			      
           			      "sPortrait":s_portrait,
        			      "cid":c_id,
        			      "sBirthdate":s_Birthdate,
        			      
           			      "sIdentity":s_identity,
           			      "sNumber":s_number,
        			      "sSex":s_sex
           		    	},
           		     	function(data){
           		     		//alert(data);
           		     		if(data!=""){
           		     			
           		     		layer.msg('修改成功', {icon:1});
           		     		StudentManager.init();//my.js
           		     			//location.reload();//刷新页面
           		     			layer.close(index);
           		     		}else{
           		     			layer.alert("操作失败！！！",{
           		            		icon: 5//图标
           		            	});
           		     			layer.close(index);
           		     		}
           		     		
           		     	});
           		    }
           		  }
           	  	
           	}); 
            
        });
        
        
      });
   
/*       $("#s_Birthdate").click(function(){
 	     //执行一个laydate实例
          laydate.render({
           elem: '#s_Birthdate' //指定元素
         });  
      }); */
      
        
   /*
   *
   *复选框点击事件
   *
   */
   $("#studentList").click(function(){
   if(this.checked){
   	  // 全选  
   	  //#studeneDataTables-->表id
       $(":checkbox", '#studeneDataTables').prop("checked",$(this).prop("checked"));
   }else{ 
   	// 取消全选  
        $(":checkbox[name='studentList_Name']").prop('checked', false);  
   }  });

   /**
   *
   *删除事件
   */
   $("#delectStudent_id").click(function(){
    	deleteClass();
       function deleteClass() {    
           //var str;    
           var array = new Array(); //用于保存 选中的那一条数据的ID     
           var flag; //判断是否一个未选  
           $("input[name='studentList_Name']:checkbox").each(function() { //遍历所有的name为...的 checkbox    
           	//if ($(this).attr("checked")) {
           	 if ($(this).prop("checked")) {   //判断是否选中      
           		flag = true; //只要有一个被选择 设置为 true    
                       }    
                   })    
           if (flag) {    
               $("input[name='studentList_Name']:checkbox").each(function(){//遍历所有的name为....的 checkbox    
                          if ($(this).prop("checked")) {   //判断是否选中  
                               array.push($(this).val()); //将选中的值 添加到 array中    
                           }    
                       })    
           			layer.alert("是否确认删除？",{
           				icon: 0,//图标
           				skin:"layui-layer-lan",//皮肤
           				btn: ["确认","取消"], //按钮
           					yes: function(index, layero){
           						//layer.close(index); //如果设定了yes回调，需进行手工关闭
           						  $.post("${pageContext.request.contextPath}/StudentServlet?op=deleteStuden&&ids="+array,
           						     	function(data){
           						     		//alert(data); //响应数据
           						     		if(data!=""){
           						     		layer.msg('删除成功', {icon:1});
           						      	  $("#page_wrapper").load("page/back/student.jsp"); 
           						     			//Student.init();//重新加载class.jsp(当前页面)
           						     			//location.reload();//刷新页面
           						     			layer.close(index);
           						     		}else{
           						     		  	layer.alert("操作失败！！！",{
           						            		icon: 5//图标
           						            	});
           						     			layer.close(index);
           						     		}
           						     });
           						}
           				});
           } else {  
           	layer.msg('请至少选择一名学生！！！', function(){/*关闭后的操作*/ });
           }    
       } }); //delete--END
/*        
       $("#s_Birthdate").click(function(){

       }); */  
       
       /**
        * 导航栏的'主页'
        */
       $("#homePage").click(function(){
       	Welcome.init();
       	// $("#page_wrapper").load("page/back/homePage.jsp");
       	});
   
    </script>
</html>