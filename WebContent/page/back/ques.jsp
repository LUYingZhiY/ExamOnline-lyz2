<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>出题管理</title>
</head>
<body>
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
                   在线考试系统
            <small>出题管理</small>
          </h1>
          <ol class="breadcrumb">
            <li><a id="homePage"><i class="fa fa-dashboard"></i>主页</a></li>
            <li class="active">出题管理</li>
          </ol>
        </section>
	<!-- -------------------------------------------------------------- -->
        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <!-- /.box -->
              <div class="box">
                <div class="box-header">
                  	<button id="addButton" class="btn btn-success">添加试题</button>
					<!-- <button id="importStudents" class="btn btn-success">导入学生信息</button>  -->
                </div><!-- /.box-header -->
                <div class="box-body">
                  	<div class="row">
                  		<div class="col-sm-12">
                  <table id="quesDataTables" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                    <thead>
                      <tr role="row">
                      	<th style="width: 180px;">
                      		行号
                      	</th>
                      	<th>
                      		 <label class="mt-checkbox">  
                              <input type="checkbox" id="qList" class="group-checkable" /> 
                             <span>全选</span>  
				              <button id="delect_id" class='btn btn-danger' >删除</button>  
                             </label>
                      	</th>
                      	<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 199px;">
                      		试题编号
                      	</th>
                      	<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 154px;">
                      		试题类型
                      	</th>
                      	<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		标题
                      	</th>
                      	<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		选项A
                      	</th>
                      	<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		选项B
                      	</th>
                      	<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		选项C
                      	</th>
                      	 <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		选项D
                      	</th>
                      	<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		答案
                      	</th>
                      	 <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		选项
                      	</th>
                      </tr>
                    </thead>
                    <tbody>
                    </tbody>
             <!--    <tfoot>
                    </tfoot> -->
                  </table>
                  		</div>
                  	</div>
                  </div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
        </section><!-- /.content -->
        
           	  <!-- 修改 form，默认隐藏 -->
	<form id="update_form" action="" method="post" hidden="hidden" class="form-inline">
		<div class="row">
			<div class="col-md-6 col-md-offset-4">
				         试题编号:<br/> 
				    <input type="text" id="q_id" class="form-control" placeholder="试题编号" disabled="disabled"/> <!-- disabled 失效-->
				    <br />试题类型:<br /> 
					<input type="text" id="q_type" class="form-control" placeholder="试题类型" />
					<br /> 题目:<br /> 
					<input type="text" id="q_content" class="form-control" value="" placeholder="题目" /><br />
                     <br />选项A:<br />
                    <input type="text" id="a" class="form-control"  placeholder="请输入选项" /><br />
                     <br />选项B<br />
                    <input type="text" id="b" class="form-control" placeholder="请输入选项" /><br />
                     <br /> 选项C:<br />
                    <input type="text" id="c" class="form-control"  placeholder="请输入选项" /><br /> 
                     <br /> 选项D:<br />
                    <input type="text" id="d" class="form-control"  placeholder="请输入选项" /><br />  	
                      <br />答案:<br />
                    <input type="text" id="ans" class="form-control"  placeholder="请输入答案" /><br /> 		
			</div>
		</div>
	</form>
      <!-- 添加 form，默认隐藏 -->
	<form id="add_form" action="" method="post" hidden="hidden" class="form-inline">
		<div class="row">
			<div id="add" class="col-md-6 col-md-offset-4">
				    <br />试题类型:<br /> 
					<input type="text" id="add_q_type" class="form-control" value=""  placeholder="试题类型" />
					<br /> 题目:<br /> 
					<input type="text" id="add_q_content" class="form-control" value=""  placeholder="题目" /><br />
                     <br />选项A:<br />
                    <input type="text" id="add_a" class="form-control" value="" placeholder="请输入选项" /><br />
                     <br />选项B<br />
                    <input type="text" id="add_b" class="form-control" value="" placeholder="请输入选项" /><br />
                     <br /> 选项C:<br />
                    <input type="text" id="add_c" class="form-control" value="" placeholder="请输入选项" /><br /> 
                     <br /> 选项D:<br />
                    <input type="text" id="add_d" class="form-control" value="" placeholder="请输入选项" /><br />  	
                      <br />答案:<br />
                    <input type="text" id="add_ans" class="form-control" value="" placeholder="请输入答案" /><br /> 		
			</div>
		</div>
	</form>
            <!-- page script -->
    <script type="text/javascript">
    $(document).ready(function() {
      $(function () {
    	  var table=$("#quesDataTables").DataTable({
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
          	 url:"${pageContext.request.contextPath}/QuesServlet?op=showData", 
              dataType: "json" //数据类型
          },
		  /*
 		  * 数据 
 		  */
 		   "columns":[
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
 		                data : "q_id",  //列的id
 		                width : '180px',
 		                render : function(data, type, row, meta) {  
 		                    var content = '&nbsp;&nbsp;&nbsp;&nbsp;'; 
 		                    content +='<label class="mt-checkbox">'
 		                    content += '<input type="checkbox" name="qList_Name" class="group-checkable" value="' + data + '" />';  
 		                    content += '<span></span>';  
 		                    content += '</label>';  
 		                    return content;  
 		                }  
 		            },
 		  { "data": "q_id",width : "50px" },
 		 { "data": "q_type" },
 		  { "data": "q_content" },
 		 { "data": "a" },
 		 { "data": "b" },
 		 { "data": "c" },
 		{  //
             data : 'd',  
             bSortable : false,  
             //width : "30px",  
             className : "text-left", 
             render : function(data, type, row, meta) { 
            	 if (data ==""||data ==null) {
                     return '<label><span  style="color:red">没有此选项</span></label>';
                 }else{
                     return '<span title="未知">'+data+'</span>';  
                 }
             }},
 		 { "data": "ans" },
  	    {    //相关操作按钮
			  "data":null, 
    	    	"orderable":false, //禁用排序	     	  
    	    	"render": function (data, type, full) {
    	    //修改按钮(绑定修改事件（onclick="editStudentInfo）)
    	    edit = "<button id='editBtn' class='btn'>修改</button>";/* onclick='editStudentInfo(this)' */
            return edit;
                }
    	    }
        	]
        	
        	
        }); //-----..dataTable...END
        
          /*
           *修改按钮点击事件
           */
           $('#quesDataTables tbody').on('click', '#editBtn', function () {
               var tr = $(this).closest('tr');
               //console.log(tr); //在前台打印
               var row = table.row(tr); //table(var table = $("#studeneDataTables").DataTable({...)
               //alert(row.data().s_id);
               var Info=row.data();
               
           	$("#q_id").val(Info.q_id);
           	$("#q_type").val(Info.q_type);
           	$("#q_content").val(Info.q_content);
           	$("#a").val(Info.a);
           	$("#b").val(Info.b);
           	$("#c").val(Info.c);
           	$("#d").val(Info.d);
           	$("#ans").val(Info.ans);
           	
           	
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
              	     //var s_portrait2=$("#newClassName").val();
              	     var q_id=document.getElementById("q_id").value;
              		 var q_type=document.getElementById("q_type").value;
              		 var q_content=document.getElementById("q_content").value;
              		 var a=document.getElementById("a").value;
              		 var b=document.getElementById("b").value;
              		 var c=document.getElementById("c").value;
              		 var d=document.getElementById("d").value;
              		 var ans=document.getElementById("ans").value;
              		  
              		//alert(sid+'/'+s_name+'/'+s_password+'/'+s_portrait+'/'+c_id)
              		    if(q_type==""||q_content==""||a==""||b==""||c==""||ans==""){
              		    	layer.msg('字段不能为空！！！');
              		    	//alert("不能为空！！！")
              		    }else{
              		    	//	 processData: false,
              		     $.post("${pageContext.request.contextPath}/QuesServlet?op=updateQues",
              		    	{
              		        //带的参数
              		         "q_id":q_id,
              		    	  "q_type":q_type,
              			      "q_content":q_content,
              			      "a":a,
           			          "b":b,
           			          "c":c,
              			      "d":d,
              			      "ans":ans
              		    	},
              		     	function(data){
              		     		//alert(data);
              		     		if(data!=""){
              		     			paperManager.init();//my.js
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
              	}); //------layer--END
           });//----修改按钮点击事件END
           
           
      });
    });//---------ready --END
    
    /*
    *
    *复选框点击事件
    *
    */
    $("#qList").click(function(){
    if(this.checked){
    	  // 全选  
    	  //#quesDataTables(表id)
        $(":checkbox", '#quesDataTables').prop("checked",$(this).prop("checked"));
    }else{ 
    	// 取消全选  
         $(":checkbox[name='qList_Name']").prop('checked', false);  
    }  });
    
    /*
     *
     *删除事件
    */
    $("#delect_id").click(function(){
     	deleteClass();
        function deleteClass() {    
            //var str;    
            var array = new Array(); //用于保存 选中的那一条数据的ID     
            var flag; //判断是否一个未选  
            $("input[name='qList_Name']:checkbox").each(function() { //遍历所有的name为...的 checkbox    
            	//if ($(this).attr("checked")) {
            	 if ($(this).prop("checked")) {   //判断是否选中      
            		flag = true; //只要有一个被选择 设置为 true    
                        }    
                    })    
            if (flag) {    
                $("input[name='qList_Name']:checkbox").each(function(){//遍历所有的name为....的 checkbox    
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
            						  $.post("${pageContext.request.contextPath}/QuesServlet?op=deleteQues&&ids="+array,
            						     	function(data){
            						     		//alert(data); //响应数据
            						     		if(data!=""){
            						     			paperManager.init();//重新加载class.jsp(当前页面)
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
            	layer.msg('请至少选择一条试题！！！', function(){/*关闭后的操作*/ });
            }    
        } }); //delete--END
        
        /*
         *添加按钮点击事件 addButton
         */
         $("#addButton").click(function(){
           	layer.open({
          		title:"添加试题",
          		skin:"layui-layer-lan",
            	maxmin: true, //显示最大小化按钮
          	  	type: 1,
          	  	anim: 1, //动画类型
          	  	area: ["650px", "550px"], //宽高
          	   	btn: ["确认","取消"],//按钮
          	   	content:$("#add_form"),//
          	   	yes: function(index, layero){
          	    //获取字段值
          	    
          	    // var add_q_type2=$("#add_q_type").val();
          		 var q_type=document.getElementById("add_q_type").value;
          		 var q_content=document.getElementById("add_q_content").value;
          		 var a=document.getElementById("add_a").value;
          		 var b=document.getElementById("add_b").value;
          		 var c=document.getElementById("add_c").value;
          		 var d=document.getElementById("add_d").value;
          		 var ans=document.getElementById("add_ans").value;
          		  
          		alert(q_type+'/'+q_content+'/'+a+'/'+b+'/'+c)
          		    if(q_type==""||q_content==""||a==""||b==""||c==""||ans==""){
          		    	layer.msg('字段不能为空！！！');
          		    	//alert("不能为空！！！")
          		    }else{
          		     $.post("${pageContext.request.contextPath}/QuesServlet?op=addQues",
          		    	{
          		         "q_id":q_id,
          		    	  "q_type":q_type,
          			      "q_content":q_content,
          			      "a":a,
       			          "b":b,
       			          "c":c,
          			      "d":d,
          			      "ans":ans
          		    	},
          		     	function(data){
          		     		//alert(data);
          		     		if(data!=""){
          		     			paperManager.init();//my.js
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
          	}); //------layer--END
         });//添加按钮点击事件 addButton END
         
         /**
          * 导航栏的'主页'
          */
         $("#homePage").click(function(){
         	Welcome.init();
         	// $("#page_wrapper").load("page/back/homePage.jsp");
         	});
        
    </script>
</body>
</html>