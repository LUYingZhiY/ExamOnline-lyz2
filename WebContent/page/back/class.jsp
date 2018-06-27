<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>在线考试系统|班级管理</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    
        <!--* Bootstrap 3.3.7-Core CSS -->
<%--     <link href="${pageContext.request.contextPath}/resources/back/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
   
   <link  href="${pageContext.request.contextPath}/resources/back/plugins/DataTables/datatables.min.css" rel="stylesheet" type="text/css" />
   <link  href="${pageContext.request.contextPath}/resources/back/plugins/layer/theme/default/layer.css" />
 --%>
</head>
	<body>

        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
                   在线考试系统
            <small>班级管理</small>
          </h1>
          <ol class="breadcrumb">
            <li><a id="homePage"><i class="fa fa-dashboard"></i>主页</a></li>
            <li class="active">班级管理</li>
          </ol>
        </section>
   <!----------------主题 内容 ------------------------------------------------------------->
	<div class="box">
		<div class="box-header">
			<button id="addclass" class="btn btn-success">添加班级</button>
			<!-- style="margin-left: 1150px" -->
		</div>
		<!-- /.box-header -->
		<div class="box-body">
			<div id="example1_wrapper"
				class="dataTables_wrapper form-inline dt-bootstrap">
				<div class="row">
					<div class="col-sm-12">
						<table id="classDataTables" class="display" style="width: 100%">
							<thead>
								<tr>
									<th><label
										class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
											<input type="checkbox" id="ClassList" class="group-checkable" />
											<span>全选</span>
											<button id="delectClass_id" class='btn btn-danger'>删除</button>
									</label></th>
									<th>班级编号</th>
									<th>编辑名称</th>
									<th>编辑</th>

								</tr>
							</thead>
							<tbody></tbody>

						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- /.box-body -->
	</div>
	<!-- /.box -->
    
    
    <!-- 添加班级form，默认隐藏 -->
	<form id="add_form" method="post" hidden="hidden" class="form-inline">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				班级名称: <input type="text" id="className" class="form-control"
					placeholder="请输入班级名称" /><br />
			</div>
		</div>
	</form>
	  <!-- 修改班级form，默认隐藏 -->
	<form id="update_form" action="" method="post" hidden="hidden" class="form-inline">
		<div class="row">
			<div class="col-md-6 col-md-offset-4">
				         编号:<br /> 
				    <input type="text" id="id" class="form-control" placeholder="这里显示班级编号" disabled="disabled" />
					<br /> 原班级名称:<br /> 
					<input type="text" id="oldClassName" class="form-control" placeholder="这里显示班级名" disabled="disabled" />
					<br /> 新班级名称:<br /> 
					<input type="text" id="newClassName" class="form-control" value="" placeholder="请输入班级名称" /><br />
			</div>
		</div>
	</form>

	 <!-- 班级详细信息form-->
		<form id="show_form" action="" method="post" hidden="hidden" class="form-inline">
		<div class="row">
			<div class="col-md-6 col-md-offset-4">
				         编号:<br /> 
				    <input type="text" id="id" class="form-control" placeholder="这里显示班级编号" disabled="disabled" />
					<br /> 原班级名称:<br /> 
					<input type="text" id="oldClassName" class="form-control" placeholder="这里显示班级名" disabled="disabled" />
					<br /> 新班级名称:<br /> 
					<input type="text" id="newClassName"  class="form-control"  placeholder="请输入班级名称" /><br />
			</div>
		</div>
	</form>
	
	<!-- 主体内容END--------------------------------------------------------------- -->

<%--       	
    <!-- jQuery 2.1.3 -->
    <script src="${pageContext.request.contextPath}/resources/back/jquery/dist/jquery.min.js"></script>
     <!-- *DataTables js -->
 
     <!-- *dataTables.bootstrap js -->
     <script src="${pageContext.request.contextPath}/resources/back/plugins/DataTables/DataTables-1.10.16/js/jquery.dataTables.min.js" type="text/javascript"></script>
    
          <!-- 弹窗 -->
    <script src="${pageContext.request.contextPath}/resources/back/plugins/layer/layer.js"></script>
      --%>
</body>
<script type="text/javascript">
$(document).ready(function() {

    var table=$('#classDataTables').DataTable( {
    	
 	   "processing": true,  // 加载状态 
       "serverSide": true,//开启服务端分页操作，每次对 datatable 进行操作时也是请求后台  
       "order": [],  // 默认排序查询,为空则表示取消默认排序否则复选框一列会出现小箭头 
       "paging" : true,   // 分页,默认打开  
       // "searching": false, // 是否禁用(显示)原生搜索  
      // "scrollX" : true, //为true加了滚动条，表头和表体成了两个表格
        "ajax": {
        	type: "GET",  
        	url:"${pageContext.request.contextPath}/ClassServlet?op=showData",
                dataType: "json", //数据类型
                error : function(XMLHttpRequest, textStatus, errorThrown) {  
                    bootboxAlert({  
                        message : '获取列表失败：' + getAjaxErrorResponseContent(XMLHttpRequest, textStatus, errorThrown)  
                    });  
                }
        },
	      "language": { 
		      "url": "${pageContext.request.contextPath}/resources/back/plugins/DataTables/language/Chinese.json"
		  },
	     "columns":[
	          {   // 复选框单元格  
	                className: "td-checkbox",  
	                orderable : false,  //禁用排序	
	                bSortable : false, 
	                data : "c_id",  //列的id
	                width : '110px',
	                render : function(data, type, row, meta) {  
	                    var content = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'; 
	                    content +='<label class="mt-checkbox">'
	                    content += '<input type="checkbox" name="classList_Name" class="group-checkable" value="' + data + '" />';  
	                    content += '<span></span>';  
	                    content += '</label>';  
	                    return content;  
	                }  
	            },
	     	    { "data": "c_id" },//班级id
	     	    {"data": "c_name" },//班级
	     	    {"data":null,
	     	    	"orderable":false, //禁用排序	     	  
	     	    	"render": function (data, type, full) {
	     	    //修改按钮(绑定修改事件（onclick="editClassInfo）)
	     	    edit = "<button onclick='editClassInfo(this)' class='btn btn-info btn-sm'>修改</button>";
	     	    
	     	    //详情
               var detail = '\t\t\t<button id="editBtn" class="btn btn-primary btn-sm">详情</button>';
                
                 return edit+detail;
                  // return data;
                     }
	     	    }
	     	    ]
    } );//DataTable-END
    /*
     *详情按钮点击事件
     */
     $('#classDataTables tbody').on('click', '#editBtn', function () {
         var tr = $(this).closest('tr');
         //console.log(tr); //在前台打印
         var row = table.row(tr); //table(var table = $("#studeneDataTables").DataTable({...)
         //alert(row.data().s_id);
         var Info=row.data();
         
         
        // alert(Info.c_id); 
         $("#page_wrapper").load("page/back/classParticulars.jsp?id="+Info.c_id+"&c_name="+Info.c_name);//Info.c_id:班级id
    	 
     });//详情按钮点击事件__END
  	   
    /*
    *
    *复选框点击事件
    *
    */
    $("#ClassList").click(function(){
    if(this.checked){
    	  // 全选  
    	  //#classDataTables-->表id
        $(":checkbox", '#classDataTables').prop("checked",$(this).prop("checked"));
        //$("[name=items]:checkbox").attr("checked",this.checked);
    }else{ 
    	// 取消全选  
         $(":checkbox[name='classList_Name']").prop('checked', false);  
    }
    /*
      //方法二（有bug(第二次全选失效)）
       if(this.checked){
            $("[name=classList_Name]").attr("checked",true);}
        else{ $("[name=classList_Name]").attr("checked",false);}
    */
    });
    
    /**
    *
    *删除事件
    */
    $("#delectClass_id").click(function(){
    	deleteClass();
        function deleteClass() {    
            //var str;    
            var array = new Array(); //用于保存 选中的那一条数据的ID     
            var flag; //判断是否一个未选  
            $("input[name='classList_Name']:checkbox").each(function() { //遍历所有的name为selectFlag的 checkbox    
            	//if ($(this).attr("checked")) {
            	 if ($(this).prop("checked")) {   //判断是否选中      
            		flag = true; //只要有一个被选择 设置为 true    
                        }    
                    })    
            if (flag) {    
                $("input[name='classList_Name']:checkbox").each(function(){//遍历所有的name为classList_Name的 checkbox    
                          // if ($(this).attr("checked")) { 
                           if ($(this).prop("checked")) {   //判断是否选中  
                               // alert($(this).val());    
                                array.push($(this).val()); //将选中的值 添加到 array中    
                            }    
                        })    
                //将要集体删除的数据 传递给action处理     
               // window.self.location = "deleteUser?info=" + array; 
            			layer.alert("是否确认删除？",{
            				icon: 0,//图标
            				skin:"layui-layer-lan",//皮肤
            				btn: ["确认","取消"], //按钮
            					yes: function(index, layero){
            						//layer.close(index); //如果设定了yes回调，需进行手工关闭
            						  $.get("${pageContext.request.contextPath}/ClassServlet?op=deleteClass&&ids="+array,
            						     	function(data){
            						     		//alert(data); //响应数据
            						     		if(data!=""){
            						     			layer.msg('删除成功', {icon:1});
            						     			clssManager.init();//重新加载class.jsp(当前页面)
            						     			//location.reload();//刷新页面
            						     			layer.close(index);
            						     		}else{
            						     		  	layer.alert("操作失败！！！只能删除没有学生的班级。",{
            						            		icon: 5//图标
            						            	});
            						     			layer.close(index);
            						     		}
            						     });
            						}
            				});
            } else {  
            	layer.msg('请至少选择一个班级！！！', function(){
            		//关闭后的操作
            		});
          /*   	layer.alert("请至少选择一个班级！！！",{
            		icon: 0//图标
            	});
                */
            }    
        }//delete--END
    });
});
//});


/*
 * 
 *
 * 修改班级信息 
 */
function editClassInfo(Dom){
	//var id=obj.parent().siblings("td:eq(1)").html();
	var jqr=$(Dom);//DOM对象转JQR对象、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、
	var cid=jqr.parent().siblings("td:eq(1)").text();
	var className=jqr.parent().siblings("td:eq(2)").text();
	
	
	/* 设置表格中的默认属性及值 */
	$("#id").attr("placeholder",cid);//给修改表中的placeholder属性赋值
	$("#oldClassName").attr("placeholder",className);
	//$("#newClassName").attr("value",className);
	$("#newClassName").val("");//清空文本框的值
	$("#newClassName").val(className);
	
	
	layer.open({
		title:"修改班级",
		skin:"layui-layer-lan",
	  	type: 1,
	  	anim: 4, //动画类型
	  	area: ["550px", "350px"], //宽高
	   	btn: ["确认","取消"],//按钮
	   	content:$("#update_form"),//
	   	yes: function(index, layero){
		    //layer.close(index); //如果设定了yes回调，需进行手工关闭
		    
		     var Name=document.getElementById("newClassName").value;//获取修改的班级名
		     //var Name=$("#newClassName").val;
		   
		    if(Name==""||Name==null){
		    	layer.msg('班级名不能为空！！！');
		    	//alert("班级名不能为空！！！")
		    }else{
		     $.get("${pageContext.request.contextPath}/ClassServlet?op=updateClass",
		    	{
		    	 "classid":cid,//get带的参数
			     "newclassName":Name
		    	},
		     	function(data){
		     		//alert(data);
		     		if(true||data!=" "){
		     			layer.msg('修改成功', {icon:1});
		     			clssManager.init();//重新加载class.jsp(当前页面)
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
} 

/**
 * 
 *添加班级
 */
$("#addclass").click(function(){
	layer.open({
		title:"添加班级",
		skin:"layui-layer-molv",
	  	type: 1,
	  	scrollbar:false,
	  	//skin:"layui-layer-rim", //加上边框
	  	area: ["620px", "240px"], //宽高
	   	btn: ["确认","取消"],//按钮
	   	resize:false,
		content:$("#add_form"),//内容
	   	yes: function(index, layero){
		    //do something
		    //layer.close(index); //如果设定了yes回调，需进行手工关闭
		    var className=document.getElementById("className").value;
		    if(className==""||className==null){
		    	layer.msg('班级名不能为空！！！');
		    	//alert("班级名不能为空！！！")
		    }else{
		      $.get("${pageContext.request.contextPath}/ClassServlet?op=addClass",
			    	{
			    	 "className":className,
			    	},
			     	function(data){
			     		//alert(data);
			     	   if(true||data!="0"){
			     	    clssManager.init();//重新加载class.jsp(当前页面)
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
})
/**
 * 导航栏的'主页'
 */
$("#homePage").click(function(){
	Welcome.init();
	// $("#page_wrapper").load("page/back/homePage.jsp");
	});
	
/*
 * 
 *
 * 班级详细信息 
 */
function classParticulars(Dom){
	//var jqr=$(Dom);//DOM对象转JQR对象、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、
	//var cid=jqr.parent().siblings("td:eq(0)").text();//单选框
	//var cid=jqr.parent().siblings("td:eq(1)").text();//id
	//var className=jqr.parent().siblings("td:eq(2)").text();//班级名
	layer.open({
		  type: 2,
		  content: '${pageContext.request.contextPath}/page/back/classParticulars.jsp',
		// content:,
		  area: ['820px', '520px'],
		  maxmin: true
		});
}

</script>

</html>