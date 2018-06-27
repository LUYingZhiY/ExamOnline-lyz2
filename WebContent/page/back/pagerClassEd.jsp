<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已发试卷</title>
</head>
<body>
      <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <!-- /.box -->
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">已发试卷</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                  	<div class="row">
                  		<div class="col-sm-12">
                  <table id="pagerClassDataTables" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                    <thead>
                      <tr role="row">
                      	<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending" style="width: 180px;">
                      		行号
                      	</th>
                      	<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending" style="width: 180px;">
                      	  <label class="mt-checkbox">  
                          <input type="checkbox" id="pList" class="group-checkable" />  
                          <span>全选</span>  
				         <button id="deleteList" class='btn btn-danger' >删除</button>  
                         </label>
                      	</th>
                      	<th class="sorting_desc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 219px;" aria-sort="descending">
                      		分配编号
                      	</th>
                      	<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 199px;">
                      		考试类型
                      	</th>
                      	<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 199px;">
                      		试卷
                      	</th>
                      	<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 154px;">
                      		班级
                      	</th>
                      	<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		考试时间
                      	</th>
                      	<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		结束时间
                      	</th>
                      	<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		操作
                      	</th>
                      </tr>
                    </thead>
                    <tbody>
                    </tbody>
               <!--      <tfoot>
                    </tfoot> -->
                  </table>
                  		</div>
                  	</div>
                  </div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
</body>
<script type="text/javascript">
$(document).ready(function() {
	  var table=$("#pagerClassDataTables").DataTable({
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
      	 url:"${pageContext.request.contextPath}/PagerClassServlet?op=showData", 
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
		                data : "pc_id",  //列的id
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
		  { "data": "pc_id",width : "50px" },
		  { "data": "pc_title"},
		 { "data": "p_id.p_name" },
		  { "data": "c_id.c_name" },
		 { "data": "startTime" },
		 { "data": "endTime" },
	    {    //相关操作按钮
		  "data":null, 
	    	"orderable":false, //禁用排序	     	  
	    	"render": function (data, type, full) {
	    //修改按钮(绑定修改事件（onclick="editStudentInfo）)
	    edit = "<button id='editBtn' class='btn'>修改</button>";// onclick='editStudentInfo(this)' 
        return edit;
            }
	    }
    	]
	  });//DataTable__END
});//ready__END
/*
*
*复选框点击事件
*
*/
$("#pList").click(function(){
if(this.checked){
	  // 全选  
	  //#(表id)
    $(":checkbox", '#pagerClassDataTables').prop("checked",$(this).prop("checked"));
}else{ 
	// 取消全选  
     $(":checkbox[name=' List_Name']").prop('checked', false);  
}  
});//复选框点击事件__END


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
</script>

</html>