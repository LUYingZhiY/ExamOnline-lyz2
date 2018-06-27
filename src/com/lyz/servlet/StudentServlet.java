package com.lyz.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.lyz.dao.ClassDao;
import com.lyz.dao.StudentDao;
import com.lyz.entity.ClassInfo;
import com.lyz.entity.DataTablePageModel;
import com.lyz.entity.StudentInfo;


/**
 */
@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     */
    public StudentServlet() {
        super();
    }

	/**
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       System.out.println("StudentServlet--doget");	
	}

	/**
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("StudentServlet---dopost");
		
		String op = request.getParameter("op");
		if(op!=null){
			if("showData".equals(op)){//-------------------------显示班级数据
			showData(request,response);
			}else if("deleteStuden".equals(op)){//------------------删除操作
				deleteStuden(request, response); 
			}else if("addStuden".equals(op)){//--------------------添加操作
				addStuden(request, response); 
			}else if("updateStuden".equals(op)){ //----------------------修改操作
				updateStuden(request, response); 
			}else if("queryClass".equals(op)) {
				queryClass(request, response);
			}
			}
	}
	
	
	
	   //访问数据库
		StudentDao sDao=new StudentDao();
   /**
    * 显示 （查询）
    * @param request
    * @param response
    */
	private void showData(HttpServletRequest request, HttpServletResponse response) {
		String dString=request.getParameter("draw");
		String starString=request.getParameter("start");//从哪个字段开始显示
		String len=request.getParameter("length");//显示的字段数
		
		
		try {
			DataTablePageModel<StudentInfo> pages=sDao.queryStudentDataTablePage(new Integer(starString==null?"1":starString), new Integer(len==null?"10":len));
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
      * 删除
      * @param request
      * @param response
      */
	private void deleteStuden(HttpServletRequest request, HttpServletResponse response) {
        //获取前台传输的id		
		String info=request.getParameter("ids");
		
		//前台是以a,b,c格式进行传输的 首先分解字符串     
       String s[] = info.split(","); 
   
       boolean flag=false;
       if (s.length > 0) {    
           for (int i = 0; i < s.length; i++) {   
          flag=sDao.removeStudent(Integer.parseInt(s[i]));
           }   
       }    
       if(flag) {
  
			try {
			PrintWriter pw = response.getWriter();
			pw.write("true");
			pw.flush();
			pw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
       }
	}
	
	/**
	 * 添加
	 * @param request
	 * @param response
	 */
	private void addStuden(HttpServletRequest request, HttpServletResponse response) {
		
	}
	
	/**
	 * 修改
	 * @param request
	 * @param response
	 */
	private void updateStuden(HttpServletRequest request, HttpServletResponse response) {
        //获取前台传输的数据
		int sid=Integer.parseInt(request.getParameter("sId"));
		String sName=request.getParameter("sName");
		String sPassword=request.getParameter("sPassword");
		String sPortrait=request.getParameter("sPortrait");
		int cid=Integer.parseInt(request.getParameter("cid"));
		String sBirthdate =request.getParameter("sBirthdate");
		String sIdentity=request.getParameter("sIdentity");
		String sNumber=request.getParameter("sNumber");
		String sSex=request.getParameter("sSex");
		
		StudentInfo s=new StudentInfo();
		ClassInfo c=new ClassInfo();
		c.setC_id(cid);
		
		s.setS_id(sid);
		s.setC_id(c);
		s.setS_Birthdate(sBirthdate);
		s.setS_identity(sIdentity);
		s.setS_name(sName);
		s.setS_password(sPassword);
		s.setS_sex(sSex);
		s.setS_portrait(sPortrait);
		s.setS_number(sNumber);
		  boolean flag=false;
		  flag=sDao.updateStudent(s);
	
	       if(flag) {
				try {
					PrintWriter pw = response.getWriter();

				pw.write("true");
				pw.flush();
				pw.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				}
		
	       
		
	}
	
	/**
	 * 查询班级
	 * @param request
	 * @param response
	 */
	private void queryClass(HttpServletRequest request, HttpServletResponse response) {
		int c_id=Integer.parseInt(request.getParameter("id"));
		ClassInfo c=new ClassInfo();
		c.setC_id(c_id);
		
		ClassDao cDao=new ClassDao();
		ArrayList<ClassInfo> cInfo=cDao.SelectClassName(c);
		
		response.setContentType("application/json;charset=utf-8");
		try {
			PrintWriter pw=response.getWriter();
			String jsonData=JSON.toJSONString(cInfo);
			System.out.println(jsonData);
			pw.write(jsonData);
			pw.flush();
			pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
