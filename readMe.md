时间：2018年4月13日
Servlet:3.1
jre: 1.8.0_161
Tomcat:8.5

1. jars
   ok{
   mysql数据库驱动：--------mysql-connector-java-5.1.38.jar;
       连接池(druid-阿里巴巴):---druid-1.1.6.jar;
   JSON:-----------------fastjson-1.2.7.jar;
        验证码:-----------------kaptcha-2.3.2.jar
   Excel读写.....
        文件上传下载....
   server-----------------javax.servlet-api-3.1.0.jar
        测试：------------------junit-4.5.jar
   }    
    
          
2. 项目结构
             代码结构
            页面资源结构
       pages:页面相关 (以功能模块进行文件分隔操作)
       resources:资源(js,css,img)
       upload:文件上传目录
          
          