<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试卷-组卷</title>
<!-- <style type="text/css">
    td.details-control {
    background: url('resources/back/plugins/DataTables/DataTables-1.10.16/images/details_open.png') no-repeat center center;
    cursor: pointer;
     }
    tr.shown td.details-control {
    background: url('resources/back/plugins/DataTables/DataTables-1.10.16/images/details_close.png') no-repeat center center;
     }
</style> -->
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
                  <button id="addButton" class="btn btn-success">添加试卷</button>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <div id="" class="dataTables_wrapper form-inline dt-bootstrap">
                  	<div class="row">
                  		<div class="col-sm-12">
                  <table id="pagerDataTables" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                    <thead>
                      <tr role="row">
                      <!-- <th></th> -->
                      	<th>
                      		行号
                      	</th>
                      	<th>
                      	  <label class="mt-checkbox">  
                          <input type="checkbox" id="pList" class="group-checkable" />  
                          <span>全选</span>  
				         <button id="deleteList" class='btn btn-danger'>删除</button>  
                         </label>
                      	</th>
                      	<th>
                      		试卷编号
                      	</th>
                      	<th>
                      		试卷类型
                      	</th>
                      	<th>
                      		试卷标题
                      	</th>
                      	<th>
                      		试卷描述
                      	</th>
                      	 <th>
                      		操作
                      	</th>
                      </tr>
                    </thead>
                    <tbody>
                    </table>
                  		</div>
                  	</div>
                  </div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
                   	  <!-- 修改 form，默认隐藏 -->
	<form id="update_form" action="" method="post" hidden="hidden" class="form-inline">
		<div class="row">
			<div class="col-md-6 col-md-offset-4">
				         试卷编号:<br/> 
				    <input type="text" id="p_id" class="form-control" placeholder="试卷编号" disabled="disabled"/> <!-- disabled 失效-->
				    <br />试卷类型:<br /> 
					<input type="text" id="p_type" class="form-control" placeholder="试卷类型" />
					<br /> 试卷题目:<br /> 
					<input type="text" id="p_name" class="form-control" value="" placeholder="题目" /><br />
                     <br />试卷描述:<br />
                    <input type="text" id="p_description" class="form-control"  placeholder="请输入选项" /><br />
			</div>
		</div>
	</form>
	      <!-- 添加 form，默认隐藏 -->
	<form id="add_form" action="" method="post" hidden="hidden" class="form-inline">
		<div class="row">
			<div id="add" class="col-md-6 col-md-offset-4">
				    <br />试卷类型:<br /> 
					<input type="text" id="add_type" class="form-control" value=""  placeholder="试卷类型" />
					<br /> 试卷题目:<br /> 
					<input type="text" id="add_name" class="form-control" value=""  placeholder="题目" /><br />
                     <br />试卷描述:<br />
                    <input type="text" id="add_description" class="form-control" value="" placeholder="描述" /><br />
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
    /*
    // `d` 是该行的原始数据对象
    function format ( d ) {
/*     	 $.each(d,function(i,data){
    	var sData=d.q_id;
    	 //alert(sData+"cccc");
        $.each(sData,function(i,data){  
            //con+="<tr><td>"+data.name+"</td><td>"+data.score+"</td></tr>"  
            //alert(data);
            console.log(data);
        });
    	  }); 
    	
 	  
        return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
            '<tr>'+
                '<td>题编号</td>'+
                '<td>题目</td>'+
                '<td>类型</td>'+
                '<td>选项A</td>'+
                '<td>选项B</td>'+
                '<td>选项C</td>'+
                '<td>选项D</td>'+
                '<td>答案</td>'+
            '</tr>'+
            '<tr>'+
               '<td>'+d.q_id.q_id+'</td>'+ 
                '<td>'+d.q_id.q_content+'</td>'+ 
                '<td>'+d.q_id.q_type+'</td>'+
                '<td>'+d.q_id.a+'</td>'+
                '<td>'+d.q_id.b+'</td>'+
                '<td>'+d.q_id.c+'</td>'+
                '<td>'+d.q_id.d+'</td>'+
                '<td>'+d.q_id.ans+'</td>'+
                '</tr>'+  
/*             '<tr>'+
            '<td>'+d.q_id.q_id+'</td>'+ 
            '<td>'+d.q_id.q_content+'</td>'+ 
            '<td>'+d.q_id.q_type+'</td>'+
            '<td>'+d.q_id.a+'</td>'+
            '<td>'+d.q_id.b+'</td>'+
            '<td>'+d.q_id.c+'</td>'+
            '<td>'+d.q_id.d+'</td>'+
            '<td>'+d.q_id.ans+'</td>'+
        '</tr>'+ 
        '</table>';
    }
    */ //显示行的附加信息__END
  //---------------------------------------------------------------------------------
    $(document).ready(function() {
      $(function () {
    	  var table=$("#pagerDataTables").DataTable({
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
          	 url:"${pageContext.request.contextPath}/PagerServlet?op=showData", 
              dataType: "json" //数据类型
          },
          /*
  		  * 数据 
  		  */
  		   "columns":[
		     /*     { //显示行的附加信息列
		                "className":'details-control',
		                "orderable":false,
		                "data":null,
		                "defaultContent": ''
		            }, */
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
  		                data : "p_id",  //列的id
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
  		    { "data": "p_id",width : '60px'},
  		    { "data": "p_type",width : '60px'},
  		    { "data": "p_name"},
  		    { "data": "p_description"},
  		    {    //相关操作按钮
  			  "data":null, 
      	    	"orderable":false, //禁用排序	
      	      width : '280px',
      	    	"render": function (data, type, full) {
      	      //修改按钮(绑定修改事件（onclick="editStudentInfo）)
      	      edit = "<button id='editBtn' class='btn'>修改</button>&nbsp;&nbsp;&nbsp;&nbsp;";/* onclick='editStudentInfo(this)' */
      	    detailsBtn = "<button id='detailsBtn' class='btn'>编辑&nbsp/&nbsp查看</button> &nbsp;&nbsp;&nbsp;&nbsp;";
      	  addQuesBtn = "<button id='addQuesBtn' class='btn btn-info'>分发试卷</button>";
              return edit+detailsBtn+addQuesBtn;
                  }
      	    }
  		   ]
    	  });//----------------DataTable__END
          /*
           *显示行的附加信息
           *为打开和关闭细节添加事件监听器
           */ 
           /* $('#pagerDataTables tbody').on('click', 'td.details-control', function () {// "className":'details-control'
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
               }}); */
    	  //-----------------------------------------------------------
          /*
           *修改按钮点击事件
           */
           $('#pagerDataTables tbody').on('click', '#editBtn', function () {
        	   
               var tr = $(this).closest('tr');
               //console.log(tr); //在前台打印
               var row = table.row(tr); //table(var table = $("#studeneDataTables").DataTable({...)
               //alert(row.data().s_id);
               var Info=row.data();
               
           	$("#p_id").val(Info.p_id);
           	$("#p_type").val(Info.p_type);
           	$("#p_name").val(Info.p_name);
           	$("#p_description").val(Info.p_description);
           	
              	layer.open({
              		title:"修改试卷信息",
              		skin:"layui-layer-lan",
              	  	type: 1,
              	  	anim: 4, //动画类型
              	  	area: ["550px", "350px"], //宽高
              	   	btn: ["确认","取消"],//按钮
              	   	content:$("#update_form"),//
              	   	yes: function(index, layero){
              	          //获取修改的字段值
              	     //var q_id=document.getElementById("q_id").value;
              	     var p_id=$("#p_id").val();
              	     var p_type=$("#p_type").val();
              	     var p_name=$("#p_name").val();
              	     var p_description=$("#p_description").val();
              		  
              		//alert(p_id+'/'+p_type+'/'+p_name+'/'+p_description)
              		
              		    if(p_id==""||p_type==""||p_name==""||p_description==""){
              		    	layer.msg('字段不能为空！！！');
              		    	//alert("不能为空！！！")
              		    }else{
              		    	//	 processData: false,
              		     $.post("${pageContext.request.contextPath}/PagerServlet?op=updatePager",
              		    	{
              		        //带的参数
              		         "p_id":p_id,
              		    	  "p_type":p_type,
              			      "p_name":p_name,
              			      "p_description":p_description
              		    	},
              		     	function(data){
              		     		//alert(data);
              		     		if(data!=""){
              		     			pagerManager.init();//my.js
              		     			//location.reload();//刷新页面
              		     			layer.msg('修改成功', {icon:1});
						     			layer.close(index);
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
           
           /*
            *分配试卷按钮点击事件
            */
            $('#pagerDataTables tbody').on('click', '#addQuesBtn', function () {
            	
         	   
                var tr = $(this).closest('tr');
                //console.log(tr); //在前台打印
                var row = table.row(tr); //table(var table = $("#studeneDataTables").DataTable({...)
                //alert(row.data().s_id);
                var Info=row.data();
                
                var p_id=Info.p_id;//试卷id
                $("#page_wrapper").load("page/back/pagerClass.jsp");
                });//分配试卷按钮点击事件__END
//==============================================================================
        	   /*
        	   *编辑按钮点击事件
        	   */
           $('#pagerDataTables tbody').on('click', '#detailsBtn', function () {
               var tr = $(this).closest('tr');
               //console.log(tr); //在前台打印
               var row = table.row(tr); //table(var table = $("#studeneDataTables").DataTable({...)
               //alert(row.data().s_id);
               var Info=row.data();
               
               var p_id=Info.p_id;
           
        	 //  alert("p_id");
        	   $("#page_wrapper").load("page/back/paperQues.jsp?id="+p_id);
        	   //pagerManager.paperQues();
           });
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
        $(":checkbox", '#pagerDataTables').prop("checked",$(this).prop("checked"));
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
           						  $.post("${pageContext.request.contextPath}/PagerServlet?op=deletePager&&ids="+array,
           						     	function(data){
           						     		//alert(data); //响应数据
           						     		if(data!=""){
           						     		layer.msg('删除成功', {icon:1});
           						     	$("#page_wrapper").load("page/back/pager.jsp");
           						     			//paperManager.init();//重新加载class.jsp(当前页面)
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
           }else{
           	layer.msg('请至少选择一张试卷！！！', function(){/*关闭后的操作*/ });
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
         	    
         		// var q_type=document.getElementById("add_q_type").value;
         		 var type=$("#add_type").val();
         		var name=$("#add_name").val();
         		var description=$("#add_description").val();

         		  
         		alert(type+'/'+name+'/'+description)
         		    if(type==""||name==""||description==""){
         		    	layer.msg('字段不能为空！！！');
         		    	//alert("不能为空！！！")
         		    }else{
         		     $.post("${pageContext.request.contextPath}/PagerServlet?op=addPager",
         		    	{
         		         "add_type":type,
         		    	  "add_name":name,
         			      "add_description":description,
         		    	},
         		     	function(data){
         		     		//alert(data);
         		     		if(data!=""){
         		     			$("#page_wrapper").load("page/back/pager.jsp");
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
</html>