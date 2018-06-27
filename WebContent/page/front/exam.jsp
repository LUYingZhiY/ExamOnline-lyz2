<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考试</title>
</head>
<body>
        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <!-- /.box -->
              
              <div class="box">
                <div class="box-header">
                	<h2>试卷</h2>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                  	<div class="row">
                  		<div class="col-sm-12">
                  			<table id="examDataTables" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                    <thead>
                      <tr role="row">
                      	<th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending" style="width: 180px;">
                      		行号
                      	</th>
                     <th class="sorting_desc" tabindex="0"  rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 219px;" aria-sort="descending">
                        	班级
                      	</th>
                      	<th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 199px;">
                      		考试类型
                      	</th>
                      	<th class="sorting" tabindex="0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 154px;">
                      		时间标题
                      	</th>
                      	<th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		试卷说明
                      	</th>
                      <th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		开始时间
                      	</th>
                      	<th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		结束时间
                      	</th>
                      	<th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 110px;">
                      		操作
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
          </div><!-- /.row -->
        </section><!-- /.content -->

</body>
<script type="text/javascript">
$(document).ready(function(){
	var cid=${sessionScope.user.c_id.c_id};
	  var table=$("#examDataTables").DataTable({
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
	            	 url:"${pageContext.request.contextPath}/ExamServlet?op=showData&cid="+cid, 
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
				  { "data": "c_id.c_name",width : "50px" },
				  { "data": "pc_title",width : "50px" },
				  { "data": "p_id.p_name" },
				  { "data": "p_id.p_description" },
				  { "data": "endTime" },
				  { "data": "startTime" },
		     	    {    //相关操作按钮
	    			  "data":null, 
		     	    	"orderable":false, //禁用排序	     	  
		     	    	"render": function (data, type, full) {
		     	    //修改按钮(绑定修改事件（onclick="editStudentInfo）)
		     	    edit = "<button id='editBtn' class='btn'>开始考试</button>";/* onclick='editStudentInfo(this)' */
	                 return edit;
	                     }
		     	    }
		     	]
	  });//DataTable__END
	  /*
	  *进入考试按钮
	  */
      $('#examDataTables tbody').on('click', '#editBtn', function () {
          var tr = $(this).closest('tr');
          //console.log(tr); //在前台打印
          var row = table.row(tr); //table(var table = $("#studeneDataTables").DataTable({...)
          var Info=row.data();
          
          var p_id=Info.p_id.p_id;//试卷id
      
   	   //alert(p_id);
          
   	   //$("#page_body").load("page/front/pager/paper.jsp?id="+p_id);
   	  //window.location.href="page/front/pager/paper.jsp?id="+p_id;
     location.href="${pageContext.request.contextPath}/ExamServlet?op=topic&id="+p_id;
      });
 });
	  
	//  });
	
</script>
</html>