package com.lyz.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import com.alibaba.druid.pool.DruidDataSource;

/**
 * 连接池
 * Druid（alibaba）
 * return Connection
 * @author 26639
 *
 */
public class DruidDBPoolUtil {
	private static DruidDataSource  dataSource=new DruidDataSource();
	
	public static void init(){
		//基于当前类查找项目跟路径
		String path=DruidDBPoolUtil.class.getResource("/").getPath();
		//System.out.println(path);
		//创建属性文件的解析操作
		Properties  properties=new Properties();
		try {
		properties.load(new FileInputStream(new File(path+"/jdbc.properties")));
	    String username=properties.getProperty("dbcp.username");
	    String password=properties.getProperty("dbcp.password");
	    String url=properties.getProperty("dbcp.url");
	    String driverClassName=properties.getProperty("dbcp.driverClassName");
		
		//数据库连接基本配置(url,username,.......)
	    dataSource.setUsername(username);
	    dataSource.setPassword(password);
		dataSource.setUrl(url);
		dataSource.setDriverClassName(driverClassName);
		//连接池初始化配置
		dataSource.setMaxActive(30);
		dataSource.setMinIdle(3);
		dataSource.setMaxWait(3000);
		}catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
   public static  Connection getConnection(){
		try {
			init();
			return dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}



	public static void main(String[] args) {
		System.out.println(DruidDBPoolUtil.getConnection());
	}

}
