package com.lyz.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Date;

/**
 * 
 *  统一编码处理过滤器
 *
 */
@WebFilter(filterName ="CharacterEncodingFilter",urlPatterns = {"/*"},initParams = {@WebInitParam(name = "encode",value = "utf-8")},dispatcherTypes ={DispatcherType.REQUEST,DispatcherType.INCLUDE,DispatcherType.FORWARD})
public class CharacterEncodingFilter implements Filter {

	 //存储编码格式信息  
	 private String encode = null; 
	 
    public CharacterEncodingFilter() {
    	
    }

	/**
	 * 该方法用于释放过滤器中使用的资源。
	 */
	public void destroy() {
		
	}

	/**
	 * 实现过滤。
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
     /*   Date d=new Date();
		System.out.println("过滤器...doFilter"+"^"+d.getTime());*/
		//转换  
		  HttpServletRequest request = (HttpServletRequest)req;  
		  HttpServletResponse response = (HttpServletResponse)resp;  
		    
		  /* 
		   * 如果web.xml文件中未配置编码格式的信息 
		   * 
		   * 判断在web.xml文件中是否配置了编码格式的信息 
		   * 如果为空，则设置编码格式为配置文件中的编码格式 
		   * 否则编码格式设置为utf-8
		   */  
		  if(this.encode != null && !this.encode.equals("")){  
		   request.setCharacterEncoding(this.encode);  
		   response.setCharacterEncoding(this.encode);  
		  }else{
		   request.setCharacterEncoding("utf-8");  
		   response.setCharacterEncoding("utf-8");  
		  }  
		    
		  /* 
		   * 使用doFilter方法调用链中的下一个过滤器或目标资源（servlet或JSP页面）。 
		   * chain.doFilter处理过滤器的其余部分（如果有的话），最终处理请求的servlet或JSP页面。 
		   */  
		  chain.doFilter(request, response);  
	}

	/**
	 * 
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		
		//获取在web.xml文件中配置了的编码格式的信息  
		  this.encode = fConfig.getInitParameter("encode");  
		
	}

}
