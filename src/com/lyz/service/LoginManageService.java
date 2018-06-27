package com.lyz.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.lyz.dao.ManageDao;
import com.lyz.entity.ManageInfo;

/**
 * 管理员相关的方法（登陆、修改密码....）
 * @author Administrator
 *
 */
public class LoginManageService {
	
	   /**
	    * 验证登陆
	    * @param request
	    * @param response
	    * @return login.jsp
	    */
		public String validateLogin(HttpServletRequest request, HttpServletResponse response){
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
			
				return "page/back/index.jsp";
			}else{
				return "page/back/login.jsp";
			}
			
		}
		
		
		//退出系统
		public String loginOut(HttpServletRequest request, HttpServletResponse response){
			HttpSession session = request.getSession();
			try{
				session.invalidate();//销毁session
			}catch(Exception ex){
			}
			return "../admin/login.jsp";
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
		public String lockCreen(HttpServletRequest request, HttpServletResponse response){
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
		return "lockScreen.jsp";
		}
		/**
		 * 锁屏后重新登录
		 * @param request
		 * @param response
		 * @return
		 */
		public String reLogin(HttpServletRequest request, HttpServletResponse response) {
			//获取
			String m_password = request.getParameter("m_password");//用户原来密码
			String password = request.getParameter("password");//重新输入的密码
			//System.out.println(m_password+":"+password);
			
			if(m_password.equals(password)) {
				return "page/back/index.jsp";
			}else {
				//return "page/back/lockscreen.jsp";
				return "WebContent/page/back/lockScreen.jsp";
			}

		}
}
