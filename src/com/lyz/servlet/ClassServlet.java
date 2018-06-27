package com.lyz.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.lyz.dao.StudentDao;
import com.lyz.entity.DataTablePageModel;
import com.lyz.entity.StudentInfo;
import com.lyz.service.ClassService;

/**
 * 班级管理
 */
@WebServlet("/ClassServlet")
public class ClassServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * 
     */
    public ClassServlet() {
        super();
    }

	/**
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String op = request.getParameter("op");
		ClassService cService=new ClassService();//相关的方法
		if(op!=null){
			if("showData".equals(op)){//-------------------------显示班级数据
				cService.showData(request,response);
			}else if("deleteClass".equals(op)){//------------------删除班级操作
				cService.deleteClass(request, response); 
			}else if("addClass".equals(op)) {//--------------------添加班级操作
				cService.addClass(request, response); 
			}else if("updateClass".equals(op)){ //----------------------修改班级操作
				cService.updateClass(request, response); 
			}else if("showStudent".equals(op)) {//--------------------显示学生信息
				showStudent(request, response);
			}
			}
	}

	private void showStudent(HttpServletRequest request, HttpServletResponse response) {
		
		String dString=request.getParameter("draw");
		String starString=request.getParameter("start");//每页从哪个字段开始显示
		String len=request.getParameter("length");//每页显示的字段数

		//获取前台数据
		//int cid=Integer.parseInt(request.getParameter("id"));//班级id
		String cid=request.getParameter("id");
		
		StudentDao sDao=new StudentDao();
		try {
			DataTablePageModel<StudentInfo> pages=sDao.queryStudentDataTablePage2(cid,new Integer(starString==null?"1":starString), new Integer(len==null?"10":len));
			pages.setDraw(new Integer(dString));
			
			//System.out.println(pages);
			
			response.setContentType("application/json;charset=utf-8");//设置响应格式
			
			PrintWriter pw=response.getWriter();
			
			/**
			 * {data:[{},{},{}]}
			 * 
			 */
			String dataString=JSON.toJSONString(pages);
			System.out.println(dataString);
			
			pw.write(dataString);
			pw.flush();
			pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		String returnURL ="";
		ClassService cService=new ClassService();//相关的方法
		if(op!=null){
			if("showData".equals(op)){//-------------------------显示班级数据
				//cService.showData(request,response);
			}else if("login".equals(op)){//--------------------------
				//returnURL = cService.validateLogin(request, response); 
			}else if("loginOut".equals(op)){//-----------------------
				//returnURL = cService.loginOut(request, response);
			}else if("lockCreen".equals(op)){//----------------------
				//returnURL = cService.lockCreen(request,response);
			}else if("reLogin".equals(op)){//-----------------------
				System.out.println("reLogin...");
				//returnURL = cService.reLogin(request,response);
			}else{
				returnURL = "../page/back/error.jsp";
			}
		}else{
			Object user = request.getSession().getAttribute("user");
			if(user!=null){
				//重定向至首页
				response.sendRedirect("page/back/index.jsp");
				return;
			}else{
				returnURL = "page/back/login.jsp";
			}
		}
		//String path=request.getContextPath()+"/";//获取根路径
		request.getRequestDispatcher(returnURL).forward(request, response);
	}

}
