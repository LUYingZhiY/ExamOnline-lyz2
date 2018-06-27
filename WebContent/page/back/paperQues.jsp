<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试卷详细信息</title>
<!-- 试卷-组卷--》编辑--》试卷详细信息 -->
</head>
<body>
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
                   在线考试系统
            <small>试卷管理</small>
          </h1>
          <ol class="breadcrumb">
            <li  id="homePage"><a><i class="fa fa-dashboard"></i>主页</a></li>
            <li id="pagerPage"><a>组卷</a></li>
            <li class="active">编辑</li>
          </ol>
        </section>
	<!-- -------------------------------------------------------------- -->
        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <!-- /.box -->
              <div class="box">
              <div style="text-align: center;">
              <!-- hr -->
               <hr style="height:1px;border:none;border-top:1px double red;" />
              <table>
                 <tr>
                  <td>试卷:</td>
                  <td id="p_name_header"></td>
                 </tr>
              </table>
              <!-- hr -->
                 <hr style="height:1px;border:none;border-top:1px double red;" />
              </div>
                <div class="box-header">
                	<button id="addButton" class="btn btn-success">添加试题</button>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                  	<div class="row">
                  		<div class="col-sm-12">
                  			
                  			<table id="pagerQuesDataTables" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                    <thead>
                      <tr role="row">
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
 
                      	<th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 199px;">
                      		题编号
                      	</th>
                      	<th class="sorting" tabindex="0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 154px;">
                      		题类型
                      	</th>
                      	<th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		标题
                      	</th>
                      <th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		选项A
                      	</th>
                      	<th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		选项B
                      	</th>
                      	 <th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                       	选项C
                      	</th>
                      	 <th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      	选项D
                      	</th>
                      	 <th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      	答案
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
                  		  <button id="return" type="button" class="btn btn-warning">返回</button>
                  </div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
        
        <!-- ------------------------------------------------------------ -->
        <table id="quesDataTables" hidden="hidden">
	        <thead>
	               <tr role="row">
                      	<th style="width: 180px;">
                      		行号
                      	</th>
                      	<th class="sorting" tabindex="0" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 199px;">
                      		试题编号
                      	</th>
                      	<th class="sorting" tabindex="0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 154px;">
                      		试题类型
                      	</th>
                      	<th class="sorting" tabindex="0" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		标题
                      	</th>
                      	<th class="sorting" tabindex="0" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		选项A
                      	</th>
                      	<th class="sorting" tabindex="0" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		选项B
                      	</th>
                      	<th class="sorting" tabindex="0" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		选项C
                      	</th>
                      	 <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		选项D
                      	</th>
                      	<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		答案
                      	</th>
                      	<th>
                      		 <label class="mt-checkbox">  
                              <input type="checkbox" id="qList" class="group-checkable" /> 
                             <span>全选</span>  
				             <!--  <button id="add_id" class='btn btn-info'>添加</button>  --> 
                             </label>
                      	</th>
                      </tr>
	        </thead>
	         <tbody>
             </tbody>
             
        </table>
</body>
<script type="text/javascript">
var pack_number = "<%=request.getParameter("id") %>";  
 //alert(pack_number);
$(document).ready(function() {
	  var table=$("#pagerQuesDataTables").DataTable({
		 
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
            	 url:"${pageContext.request.contextPath}/PaperQuesServlet?op=showData&id="+pack_number, 
                dataType: "json" //数据类型
            },
             /*
	  		  * 数据 
	  		  */
	  		   "columns":[
	  		            { //行号 并显示试卷标题
	  		                data : "p_id.p_name",  
	  		               // bSortable : false, 
	  		                orderable : false,  //禁用排序
	  		                //className : "text-left", //左对齐 
	  		                className : "text-center",  //居中
	  		                width :"50px", //行宽
	  		                render : function(data, type, row, meta) { 
	  		                	
	  		                	$("#p_name_header").html('&nbsp;&nbsp;&nbsp;'+data);//显示试卷标题
	  		                	
	  		                    // 显示行号  
	  		                    var startIndex = meta.settings._iDisplayStart; 
	  		                    return startIndex + meta.row + 1;  
	  		                        }
	  		            },
	  		          {   // 复选框单元格  
	  		                className: "td-checkbox",  
	  		                orderable : false,  //禁用排序	
	  		                bSortable : false, 
	  		                data : "q_id.q_id",  //列的id
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
	  		            {
	  		            	"data":"q_id.q_id"
	  		            },
	  		          {"data":"q_id.q_type"},
	  		          {"data":"q_id.q_content"},
	  		          {"data":"q_id.a"},
	  		          {"data":"q_id.b"},
	  		          {"data":"q_id.c"},
	  		 		{  //
	  		             data : 'q_id.d',  
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
	  	           	  {"data":"q_id.ans"}
	  		   ]
	  });//DataTable__END

});
/*
 *添加按钮点击事件 addButton
 */
 
 $("#addButton").click(function(){
	 
	 table2();//显示数据事件
   	layer.open({
  		title:"添加试题",
  		skin:"layui-layer-lan",
    	maxmin: true, //显示最大小化按钮
  	  	type: 1,
  	  	anim: 1, //动画类型
  	  	area: ["650px", "550px"], //宽高
  	   	btn: ["确认","取消"],//按钮
  	   	content:$("#quesDataTables"),//
  	   	yes: function(index, layero){
            //var str;    
            var array = new Array(); //用于保存 选中的那一条数据的ID     
            var flag; //判断是否一个未选  
            $("input[name='qList_Name']:checkbox").each(function() { //遍历所有的name为...的 checkbox    
            	//if ($(this).attr("checked")) {
            	 if ($(this).prop("checked")) {   //判断是否选中      
            		flag = true; //只要有一个被选择 设置为 true    
                     } })    
            if (flag){    
                $("input[name='qList_Name']:checkbox").each(function(){//遍历所有的name为....的 checkbox    
                           if ($(this).prop("checked")) {   //判断是否选中  
                                array.push($(this).val()); //将选中的值 添加到 array中    
                            }    
                   });
					  $.post("${pageContext.request.contextPath}/PaperQuesServlet?op=addPagerQues&ids="+array+"&p_id="+pack_number,
						     	function(data){
						     		//alert(data); //响应数据
						     		if(data!=""){
						     			$("#page_wrapper").load("page/back/paperQues.jsp?id="+pack_number);
						     		layer.msg('添加成功', {icon:1});
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

 //---------table2-------------------------------**********************************************--------------------
 function table2(){ 
 
	  var table2=$("#quesDataTables").DataTable({
			 "processing": true,  // 加载状态 
	    	 "serverSide": true,//开启服务端分页操作，每次对 datatable 进行操作时也是请求后台
	    	 
	    	 destroy:true, // DataTable,解决重新加载表格内容问题
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
	         }
	     	]
			 
		 });//DataTable__END
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
  };
  //*************_table2__END_********************************************************************************

  /*
  *
  *复选框点击事件
  *
  */
  $("#pList").click(function(){
  if(this.checked){
  	  // 全选  
  	  //#quesDataTables(表id)
      $(":checkbox", '#pagerQuesDataTables').prop("checked",$(this).prop("checked"));
  }else{ 
  	// 取消全选  
       $(":checkbox[name='qList_Name']").prop('checked', false);  
  }  });
	 
  /*
  *
  *删除事件
 */
 $("#deleteList").click(function(){
  	deleteC();
     function deleteC() {    
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
         						  $.post("${pageContext.request.contextPath}/PaperQuesServlet?op=deletePaperQues&ids="+array+"&p_id="+pack_number,
         						     	function(data){
         						     		//alert(data); //响应数据
         						     		if(data!=""){
         						     			$("#page_wrapper").load("page/back/paperQues.jsp?id="+pack_number);
         						     			layer.msg('删除成功', {icon:1});
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
         }else{
         	layer.msg('请至少选择一条试题！！！', function(){/*关闭后的操作*/ });
         }    
     } }); //delete--END
     
     /**
      * 导航栏的'主页'
      */
     $("#homePage").click(function(){
     	Welcome.init();
     	// $("#page_wrapper").load("page/back/homePage.jsp");
     	});
     /**
      * 导航栏的'组卷' 
      */
     $("#pagerPage").click(function(){
    	// alert("test");
    	 //pagerManager.init();
     	 $("#page_wrapper").load("page/back/pager.jsp");
     	}); 
     /*
     *
     *返回按钮点击事件
     */
     $("#return").click(function(){
      	 $("#page_wrapper").load("page/back/pager.jsp");
      	}); 
</script>
</html>