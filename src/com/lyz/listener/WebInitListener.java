package com.lyz.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.lyz.util.DruidDBPoolUtil;


/**
 * 监听器
 * 
 * 项目初始化相关操作
 *
 */
@WebListener
public class WebInitListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public WebInitListener() {

    }

	/**
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 

    }

	/**
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
/*	System.out.println("项目初始化相关操作....");
		//连接池相关初始化操作
		DruidDBPoolUtil.init();
		
		System.out.println("项目初始化相完毕....");
*/
    }
	
}
