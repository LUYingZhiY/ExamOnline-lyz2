<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员的管理页面</title>
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
            <small>管理员管理</small>
          </h1>
          <ol class="breadcrumb">
            <li><a id="homePage"><i class="fa fa-dashboard"></i>主页</a></li>
            <li id="manage" class="fa fa-dashboard">管理员管理</li>
             <li class="active">管理员管理</li>
          </ol>
        </section>
   <!----------------主题 内容 ------------------------------------------------------------->
	
       <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">

					<!--
						作者：2663902841@qq.com
						时间：2018-05-20
						描述：
					-->
              <div class="box">
                <div class="box-header">
                  <button id="addButton" class="btn btn-success">新增管理人员</button>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="manageDataTables" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                      <th></th>
                       <th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending" style="width: 180px;">
                      		行号
                      	</th>
                      	<th class="sorting_desc" tabindex="0"  rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 219px;" aria-sort="descending">
                      	  <label class="mt-checkbox">  
                          <input type="checkbox" id="pList" class="group-checkable" />  
                          <span>全选</span>  
				         <button id="deleteList" class='btn btn-danger' >删除</button> 
                         </label>
                      	</th>
                        <th>管理员id</th>
                        <th>账号</th>
                        <th>密码</th>
                        <th>性别</th>
                        <th>
                      		操作
                      	</th>
                      </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <!-- <tfoot>
                    </tfoot> -->
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
                           	  <!-- 修改 form，默认隐藏 -->
	<form id="update_form" action="${pageContext.request.contextPath}/ManageServlet?op=update" method="post" hidden="hidden" class="form-inline" enctype="multipart/form-data">
		<div class="row">
			<div class="col-md-6 col-md-offset-4">
				         管理员id:<br/> 
				    <input type="text" id="m_id" class="form-control" placeholder="管理员id" disabled="disabled"/> <!-- disabled 失效-->
				    
				     <br />头像:<br /> 
				    <!--  <img id="imgShow" src="" width="100" height="100" alt="头像">  -->
				    <div id="imgdiv">
				    <img id="imgShow" src="" width="100" height="100" alt="头像"/>
				    </div>
				    <input type="file" name="file" id="up_img" onchange="ajaxFileUpload()"/> 
				     
				    <br />账号:<br /> 
					<input type="text" id="m_name" class="form-control" placeholder="账号" />
					<br /> 密码:<br /> 
					<input type="text" id="m_pwd" class="form-control" value="" placeholder="密码" /><br />
                     <br />性别:<br/>
                       <select id="m_sex" name="sex" class="form-control">
					   <option value ="男">男</option>
					   <option value ="女">女</option>
					   </select>
	            <br/>
			</div>
		</div>
	</form>
</body>
    <!-- page script -->
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
                  '<td>'+d.m_account+'上传的头像'+'</td>'+ 
             '</tr>'+
             '<tr>'+
                 '<td>头像:</td>'+
                   '<td><img src="${pageContext.request.contextPath}/'+d.m_portrait+'" width="100" height="100" alt='+d.m_account+'></td>'+
             '</tr>'+
             '<tr>'+
             '<td>路径:</td>'+
             '<td>${pageContext.request.contextPath}/'+d.m_portrait+'</td>'+
         '</tr>'+
         '</table>';
     }
    
    $(document).ready(function() {
    	   $(function () {
    	    	  var table=$("#manageDataTables").DataTable({
    	          	 "aLengthMenu": [[5,10, 15, -1], [5, 10, 15, "全部"]],//让用户选择页面记录数量 
    	        	 "processing": true,  // 加载状态 
    	        	 "serverSide": true,//开启服务端分页操作，每次对 datatable 进行操作时也是请求后台  
    		  		  /*
    		 		   * 语言
    		 		   */
    	  	      "language": { 
    	  		      "url": "${pageContext.request.contextPath}/resources/back/plugins/DataTables/language/Chinese.json"
    	  		  },
    	          "ajax": {
    	            	type: "post", 
    	            	 url:"${pageContext.request.contextPath}/ManageServlet?op=showData", 
    	                dataType: "json" //数据类型
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
	  		                data : "m_id",  //列的id
	  		                width : '180px',
	  		                render : function(data, type, row, meta) {  
	  		                    var content = '&nbsp;&nbsp;&nbsp;&nbsp;'; 
	  		                    content +='<label class="mt-checkbox">'
	  		                    content += '<input type="checkbox" name="List_Name" class="group-checkable" value="' + data + '" />';  
	  		                    content += '<span></span>';  
	  		                    content += '</label>';  
	  		                    return content;  
	  		                }  
	  		            },
    					   {"data":"m_id"},//,width:"30px"
    					   {"data":"m_account"},//,"visible": false :隐藏列
    					   {"data":"m_password"},
    					   {"data":"m_sex"},
    			  		    {    //相关操作按钮
    				  			  "data":null, 
    				      	    	"orderable":false, //禁用排序	
    				      	      /* width : '280px', */
    				      	    	"render": function (data, type, full) {
    				      	      //修改按钮(绑定修改事件（onclick="editStudentInfo）)
    				      	      edit = "<button id='editBtn' class='btn'>修改</button>&nbsp;&nbsp;&nbsp;&nbsp;";/* onclick='editStudentInfo(this)' */
    				      	    //detailsBtn = "<button id='detailsBtn' class='btn'>编辑</button>";
    				              return edit;
    				                  }
    				      	    }
    				   ],
    	            "columnDefs": [{ "targets": [1], "visible": false } ]
    	    		  });//DataTable__END
    	    		  //-------------------------------------------------
    	    	
    	              /*
    	               *修改按钮点击事件
    	               */
    	               $('#manageDataTables tbody').on('click', '#editBtn', function () {
    	            	   
     	            	   //图片上传(预览功能)
    	            	   new uploadPreview({ UpBtn: "up_img", DivShow: "imgdiv", ImgShow: "imgShow" });
     	            	   $("#up_img").val(""); //清空上次选中的文件
    	            	   
    	                   var tr = $(this).closest('tr');
    	                   //console.log(tr); //在前台打印
    	                   var row = table.row(tr); //table(var table = $("#studeneDataTables").DataTable({...)
    	                   //alert(row.data().s_id);
    	                   var Info=row.data();
    	                   
    	                 //赋值
    	               	$("#m_id").val(Info.m_id);
    	               	$("#m_name").val(Info.m_account);
    	               	$("#m_pwd").val(Info.m_password);
    	               	$("#m_sex").val(Info.m_sex);
    	               	$("#imgShow").attr("src",Info.m_portrait);
    	               	
    	                  	layer.open({
    	                  		title:"修改信息",
    	                  		skin:"layui-layer-lan",
    	                  	  	type: 1,
    	                  	  	anim: 4, //动画类型
    	                  	  	area: ["550px", "350px"], //宽高
    	                  	   	btn: ["确认","取消"],//按钮
    	                  	   	content:$("#update_form"),//
    	                  	   	yes: function(index, layero){
    	                  	          //获取修改的字段值
    	                  	     //var q_id=document.getElementById("q_id").value;
    	                  	     var m_id=$("#m_id").val();
    	                  	     var m_name=$("#m_name").val();
    	                  	     var m_pwd=$("#m_pwd").val();
    	                  	     var m_sex=$("#m_sex").val();
    	                  	     var filePath=$("#up_img").val(); //获取选中的文件
    	                  	     var flag=false;
    	                  	     if(filePath!=""){//判断是否修改了头像
    	                  	    	flag=true;
    	                  	     }
    	                  		  
    	                  		//alert(m_id+'/'+m_name+'/'+m_pwd+'/'+m_sex+"/"+filePath+"//"+flag)
    	                  		
    	                  		    if(m_id==""||m_name==""||m_pwd==""||m_sex==""){
    	                  		    	layer.msg('字段不能为空！！！');
    	                  		    	//alert("不能为空！！！")
    	                  		    }else{
    	                  		     /*    //form.submit();
    	                  		            $("#update_form").submit(); */
    	                  		            
    	                  		          $.ajax({
    	                  		        	statusCode: {
    	                  		        	    404: function() {
    	                  		    			layer.alert("抱歉，出Bug了。路径错误-404！！！",{
    	                  		            		icon: 7//图标
    	                  		            	});
    	                  		        	    }
    	                  		        	  },
    	                  		        	 url:"${pageContext.request.contextPath}/ManageServlet?op=update&m_id="+m_id+"&m_account="+m_name+"&m_password="+m_pwd+"&m_sex="+m_sex+"&flag="+flag,                      
    	                  		            type: 'POST',
    	                  		            cache: false, 
    	                  		           data: new FormData($('#update_form')[0]), 
    	                  	        /*        data:{  //带的参数        		       
    	    	                  		         "m_id":m_id,
    	    	                  		    	  "m_account":m_name,
    	    	                  			      "m_password":m_pwd,
    	    	                  			    "flag":flag,//判断是否修改了照片
    	    	                  			      "m_sex":m_sex
    	    	                  			      }, */
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
        	    						     		
        	    						     		 if(data.m_id==${sessionScope.user.m_id}){//修改自己时则刷新页面
        	    						     			location.reload();//刷新页面
        	    						     		}else{
        	    						     		layer.msg('修改成功', {icon:1});
        							     			layer.close(index);  
        							     			}     	                  		     			
        	                  		     		}else{
        	                  		     			layer.alert("操作失败！！！",{
        	                  		            		icon: 5//图标
        	                  		            	});
        	                  		     			layer.close(index);
        	                  		     		}
    	                  		            }
    	                  		            /*
    	                  		            其中关键要素：
										1、contentType:
										(默认: "application/x-www-form-urlencoded") 发送信息至服务器时内容编码类型。默认值适合大多数情况。如果你明确地传递了一个content-type给 $.ajax() 那么他必定会发送给服务器（即使没有数据要发送）
										
										2、processData
										(默认: true) 默认情况下，通过data选项传递进来的数据，如果是一个对象(技术上讲只要不是字符串)，都会处理转化成一个查询字符串，以配合默认内容类型 "application/x-www-form-urlencoded"。如果要发送 DOM 树信息或其它不希望转换的信息，请设置为 false。
										
										3、FormData
										XMLHttpRequest Level 2添加了一个新的接口FormData.利用FormData对象,我们可以通过JavaScript用一些键值对来模拟一系列表单控件,我们还可以使用XMLHttpRequest的send()方法来异步的提交这个"表单".比起普通的ajax,使用FormData的最大优点就是我们可以异步上传一个二进制文件.
										 */
										 
    	                  		        });//ajax__END      
    	                  		    
    	                  		    }
    	                  		  }
    	                  	}); //------layer--END
    	               });//----修改按钮点击事件END
    	               //*****************************************
    	               /*
    	                *显示行的附加信息
    	                *为打开和关闭细节添加事件监听器
    	                */ 
    	                $('#manageDataTables tbody').on('click', 'td.details-control', function () {// "className":'details-control'
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
    	                    }});//显示行的附加信息__END
    	    	  });
        

      });//ready__END
    //======================================================================================
      /*
      *
      *复选框点击事件
      *
      */
      $("#pList").click(function(){
      if(this.checked){
      	  // 全选  
      	  //#(表id)
          $(":checkbox", '#manageDataTables').prop("checked",$(this).prop("checked"));
      }else{ 
      	// 取消全选  
           $(":checkbox[name='List_Name']").prop('checked', false);  
      }  });
      
      /**
      *
      *删除事件
      */
      $("#deleteList").click(function(){
       	deleteClass();
          function deleteClass() {    
              //var str;    
              var array = new Array(); //用于保存 选中的那一条数据的ID     
              var flag; //判断是否一个未选  
              $("input[name='List_Name']:checkbox").each(function() { //遍历所有的name为...的 checkbox    
              	//if ($(this).attr("checked")) {
              	 if ($(this).prop("checked")) {   //判断是否选中      
              		flag = true; //只要有一个被选择 设置为 true    
                          }    
                      })    
              if (flag) { //只要有一个被选择 设置为 true 
                  $("input[name='List_Name']:checkbox").each(function(){//遍历所有的name为....的 checkbox    
                             if ($(this).prop("checked")) {   //判断是否选中  
                                  array.push($(this).val()); //将选中的值 添加到 array中    
                              }
                          })    
              			layer.alert("是否确认删除？",{
              				icon: 0,//图标
              				skin:"layui-layer-lan",//皮肤
              				btn: ["确认","取消"], //按钮
              				
              					yes: function(index, layero){
              						var flag = true;
              						//遍历数组
              						for(var i= 0;i<array.length;i++){  
              			               // console.log("第一种遍历方式\t"+array[i]);
              			               if(array[i]==1||array[i]==${sessionScope.user.m_id}){
              			            	flag=false;
              			               }
              			            }  
              						if(flag){ //没有选择自己或admin时
              						//layer.close(index); //如果设定了yes回调，需进行手工关闭
              						  $.post("${pageContext.request.contextPath}/ManageServlet?op=removes&&ids="+array,
              						     	function(data){
              						     		//alert(data); //响应数据
              						     		if(data!=""){
              						     		layer.msg('删除成功', {icon:1});
              						      	  $("#page_wrapper").load("page/back/manage.jsp"); 
              						     			//Student.init();//重新加载class.jsp(当前页面)
              						     			//location.reload();//刷新页面(F5)
              						     			layer.close(index);
              						     		}else{
              						     		  	layer.alert("操作失败！！！",{
              						            		icon: 5//图标
              						            	});
              						     			layer.close(index);
              						     		}
              						     });
              						}else{   
              						  	layer.alert("不能删除你自己或admin！！！",{
  						            		icon:2//图标
  						            	});
  						     			layer.close(index);
              						}
              						}
              				});
              } else {  
              	layer.msg('请至少选择一项！！！', function(){/*关闭后的操作*/ });
              }    
          } }); 
      //delete--END
          
           //添加管理人员
        	$("#addButton").click(function(){
        		$("#page_wrapper").load("page/back/manageAdd.jsp");
        	});
      
          //文件上传
           function ajaxFileUpload() {
               //图片格式验证
               // alert("图片格式验证");
               var x = document.getElementById("up_img");
               if (!x || !x.value) return;
               var patn = /\.jpg$|\.jpeg$|\.png$|\.gif$/i;
               if (!patn.test(x.value)) {
                 // alert("您选择的似乎不是图像文件。");
                  layer.alert("您选择的似乎不是图像文件！！");
                  x.value = "";
                  return;
              }
               } 
      
    </script>
</html>