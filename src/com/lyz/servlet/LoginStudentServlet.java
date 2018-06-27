package com.lyz.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lyz.dao.StudentDao;
import com.lyz.entity.StudentInfo;

/**
 *学生登录
 */
@WebServlet("/LoginStudentServlet")
public class LoginStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     */
    public LoginStudentServlet() {
        super();
    }

	/**
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		if(op!=null){
			if("login".equals(op)){//-------------------------显示数据
				validateLogin(request,response);
			}else if("deletePaperQues".equals(op)){//------------------删除操作
			
			}else if("addPagerQues".equals(op)){//--------------------添加操作(往试卷中添加题目)
			
			}else if("updatePager".equals(op)){ //----------------------修改操作
			
			}
			}
	}
	
	   /**
	    * 验证登陆
	    * @param request
	    * @param response
	    */
		public void validateLogin(HttpServletRequest request, HttpServletResponse response){
			//用户名、密码
			String userName = request.getParameter("account");
			String userPwd = request.getParameter("inputPassword");
			
			StudentInfo loginUser = new StudentInfo(userName,userPwd);
			//验证登陆
			StudentInfo user = new StudentDao().validateLogin(loginUser);
			
		
			//获取session
			HttpSession session = request.getSession();

			if(user != null){
				//存入登陆的时间
				Date time=new Date();
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String times=sdf.format(time);
				session.setAttribute("loginTime",times);
				/*session.setAttribute("loginTime", String.valueOf(System.currentTimeMillis()));*/
				
				session.setAttribute("user",user);
			
				
				try {
					//response.sendRedirect("page/front/index.jsp");
					request.getRequestDispatcher("page/front/index.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				try {
					request.getRequestDispatcher("page/front/login.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		}

}
