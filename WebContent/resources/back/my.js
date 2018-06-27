var clssManager = {
	/**
	 *   用户管理初始化方法
	 *   
	 *   1. ajax 获取数据并展示
	 *   2. 绑定相关事件
	 *   
	 *   
	 */
	init : function() {
		$("#page_wrapper").load("page/back/class.jsp");
	},
	stu : function() {
		//$("#page-wrapper").load("pages/end/Admin/studentmanage.jsp");//刷新班级管理页面
	}

};
var Welcome ={
		init : function() {
			$("#page_wrapper").load("page/back/homePage.jsp");
		}

};
var StudentManager={
		init : function() {
			$("#page_wrapper").load("page/back/student.jsp"); 
		}
};
var quesManager={
		init : function() {
			$("#page_wrapper").load("page/back/ques.jsp"); 
		}
};
var pagerManager={
		init : function() {
			$("#page_wrapper").load("page/back/pager.jsp");
		},
		paperQues:function(){
			$("#page_wrapper").load("page/back/paperQues.jsp");
		}
};

