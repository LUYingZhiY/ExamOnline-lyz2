package com.lyz.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.lyz.dao.ClassDao;
import com.lyz.entity.ClassInfo;
import com.lyz.entity.DataTablePageModel;

public class ClassService{
	//访问数据库
	ClassDao cDao=new ClassDao();
	
	//显示班级数据
	public void showData(HttpServletRequest request, HttpServletResponse response){
		
		String dString=request.getParameter("draw");
		String starString=request.getParameter("start");//每页从哪个字段开始显示
		String len=request.getParameter("length");//每页显示的字段数
		
		
		try {
			DataTablePageModel<ClassInfo> pages=cDao.queryClassDataTablePage(new Integer(starString==null?"1":starString), new Integer(len==null?"10":len));
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
    * 删除班级操作
    * @param request
    * @param response
    */
	public void deleteClass(HttpServletRequest request, HttpServletResponse response) {
         //获取前台传输的id		
		String info=request.getParameter("ids");
		
		//前台是以a,b,c格式进行传输的 首先分解字符串     
        String s[] = info.split(","); 
    
        boolean flag=false;
        if (s.length > 0) {    
            for (int i = 0; i < s.length; i++) {   
            	//System.out.println(s[i]);
           flag=cDao.removeClass(Integer.parseInt(s[i]));
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
	 * 添加班级操作
	 * @param request
	 * @param response
	 */
	public void addClass(HttpServletRequest request, HttpServletResponse response) {
		String name=request.getParameter("className");//获取班级名称
		ClassInfo c=new ClassInfo();
		c.setC_name(name);
		boolean flag=cDao.addClass(c);
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
	 * 修改班级操作
	 * @param request
	 * @param response
	 */
	public void updateClass(HttpServletRequest request, HttpServletResponse response) {
		int cid=Integer.parseInt(request.getParameter("classid"));
		String cName=request.getParameter("newclassName");
		//System.out.println(cid+":"+cName);
		
		ClassInfo c=new ClassInfo();
		c.setC_id(cid);
		c.setC_name(cName);
		
		boolean flag=cDao.updateClass(c);
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


}
