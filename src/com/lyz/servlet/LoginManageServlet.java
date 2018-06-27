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

import com.lyz.dao.ManageDao;
import com.lyz.entity.ManageInfo;
import com.lyz.service.LoginManageService;

/**
 * 处理登录相关操作
 * 
 */
@WebServlet("/LoginManageServlet")
public class LoginManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * 
     */
    public LoginManageServlet() {
        super();
    }

	/**
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doPost(request, response);
	}

	/**
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*		System.out.println("LoginManageServlet//////////////////");
		String op = request.getParameter("op");
		String returnURL ="";
		LoginManageService manage=new LoginManageService();//相关的方法
		if(op!=null){
			if("resetPass".equals(op)){
				//returnURL = resetPass(request,response);
			}else if("login".equals(op)){//--------------------------验证登录
				returnURL = manage.validateLogin(request, response); 
			}else if("loginOut".equals(op)){//-----------------------退出
				returnURL = manage.loginOut(request, response);
			}else if("lockCreen".equals(op)){//----------------------锁屏
				returnURL = manage.lockCreen(request,response);
			}else if("reLogin".equals(op)){//-----------------------锁屏后重新登录
				System.out.println("reLogin...");
				returnURL = manage.reLogin(request,response);
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
		request.getRequestDispatcher(returnURL).forward(request, response);
		
		*/
		
		String op = request.getParameter("op");
		if(op!=null){
			if("resetPass".equals(op)){
				//returnURL = resetPass(request,response);
			}else if("login".equals(op)){//--------------------------验证登录
			     validateLogin(request, response); 
			}else if("loginOut".equals(op)){//-----------------------退出
				loginOut(request, response);
			}else if("lockCreen".equals(op)){//----------------------锁屏
				lockCreen(request,response);
			}else if("reLogin".equals(op)){//-----------------------锁屏后重新登录
				reLogin(request,response);
			}else{
				
			}
		}else{
			Object user = request.getSession().getAttribute("user");
			if(user!=null){
				//重定向至首页
				response.sendRedirect("page/back/index.jsp");
				return;
			}else{
				/*returnURL = "page/back/login.jsp";*/
			}
		}
	}

	/**
	    * 验证登陆
	    * @param request
	    * @param response
	    * @return login.jsp
	    */
	   private void validateLogin(HttpServletRequest request, HttpServletResponse response) {
			//用户名、密码
			String userName = request.getParameter("account");
			String userPwd = request.getParameter("inputPassword");
			ManageInfo loginUser = new ManageInfo(userName,userPwd);
			//验证登陆
			ManageInfo user = new ManageDao().validateLogin(loginUser);
			
			//获取session
			HttpSession session = request.getSession();
			
			if(user != null){
				//存入登陆的时间
				Date time=new Date();
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String times=sdf.format(time);
				session.setAttribute("loginTime",times);
				/*session.setAttribute("loginTime", String.valueOf(System.currentTimeMillis()));*/
				
				//存入ManageInfo
				session.setAttribute("user",user);
			
				String returnURL= "page/back/index.jsp";
				try {
					request.getRequestDispatcher(returnURL).forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				}catch (IOException e) {
					e.printStackTrace();
				}
			}else{
				String returnURL= "page/back/login.jsp";
				try {
					request.getRequestDispatcher(returnURL).forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	   
		//退出系统
		public void loginOut(HttpServletRequest request, HttpServletResponse response){
			HttpSession session = request.getSession();
			try{
				session.invalidate();//销毁session
			}catch(Exception ex){
			}
			try {
				response.sendRedirect("admin/login.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}  
		}
		
		//修改管理员信息
		public String resetUserName(HttpServletRequest request, HttpServletResponse response){
			
			
		return null;
			
		}
		/**
		 * --锁屏
		 * @param request
		 * @param response
		 * @return lockscreen.jsp
		 */
		public void lockCreen(HttpServletRequest request, HttpServletResponse response){
			//获取session
			HttpSession session = request.getSession();
			
			// session.removeAttribute("user");//销毁登录时的session
			
			//获取id
			int m_id = Integer.parseInt(request.getParameter("m_id"));
			
			//ManageInfo loginUser = new ManageInfo(m_id);
			ManageInfo man = new ManageInfo();
			man.setM_id(m_id);
			
			//调用Dao
			ManageInfo user = new ManageDao().selectManage(man);
		
			//存入-ManageInfo-
			session.setAttribute("user",user);
		try {
			response.sendRedirect("page/back/lockScreen.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		}
		/**
		 * 锁屏后重新登录
		 * @param request
		 * @param response
		 * @return
		 */
		public void reLogin(HttpServletRequest request, HttpServletResponse response) {
			//获取
			String m_password = request.getParameter("m_password");//用户原来密码
			String password = request.getParameter("password");//重新输入的密码
			//System.out.println(m_password+":"+password);
			
			if(m_password.equals(password)) {
				try {
					//response.sendRedirect("page/back/index.jsp");
					request.getRequestDispatcher("page/back/index.jsp").forward(request, response);
				} catch (IOException e) {
					e.printStackTrace();
				} catch (ServletException e) {
					e.printStackTrace();
				}
			}else {
				try {
					response.sendRedirect("page/back/lockScreen.jsp");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}

}
