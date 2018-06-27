package com.lyz.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

/**
 * Servlet 基础处理类(提供Servlet常用的公共方法)
 * 
 *   printJSON(data):响应json数据
 *   
 *   renderView(String viewName):展示视图
 *   
 *   获取属性
 *   
 *   获取参数
 *   
 *   获取session
 *   
 *   获取application
 * 
 * @author Administrator
 *
 */
public class BaseServlet extends HttpServlet {

	private HttpServletRequest request;
	private HttpServletResponse response;

	/* 
	 *  req ------> service(判断依据)----->调用不同请求方法
	 * (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#service(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//進行赋值操作
		this.request=req;
		this.response=resp;
		super.service(req, resp);
	}
	
	
	/**
	 * 响应json格式数据
	 * 
	 * @param data 响应的数据
	 */
	public void printJSON(Object data) {
		
		response.setContentType("application/json;charset=utf-8");
		try {
			PrintWriter pwPrintWriter=response.getWriter();
			String jsonDataString=JSON.toJSONString(data);
			pwPrintWriter.write(jsonDataString);
			pwPrintWriter.flush();
			pwPrintWriter.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
    /**
     * 
     * 页面渲染,响应页面操作
     * 
     *   1. request
     *   
     *   2. response:外部跳转
     *   
     * 
     */
    public void renderViewByRedirect(String viewName) {
		String contextPathString=request.getContextPath();
    	try {
			response.sendRedirect(contextPathString+"/"+viewName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	/**
	 * 获取param 值
	 * @param name 参数名
	 * @return
	 */
	public String getStringParam(String name) {
	  return request.getParameter(name);
	}
	
	
	public String getStringAttr(String name) {
		  return (String)request.getAttribute(name);
	}
	
}
