package com.lyz.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

/**
 * 判断验证码
 */
@WebServlet("/VerificationCodeServlet")
public class VerificationCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * 
     */
    public VerificationCodeServlet() {
        super();
        
    }

    /**
    *
    * 验证码验证操作
    * @param req
    * @param resp
    * @throws ServletException
    * @throws IOException
    */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  System.out.println("VerificationCodeServlet");
		
		   String code=req.getParameter("code");//用户输入的验证码
	        //System.out.println(code);

	         //生成的验证码
	        //正确的验证码??? (生成验证码的Servlet已经存放在session,只需根据指定的名称进行获取操作)
	        // req.getSession().setAttribute(this.sessionKeyValue, capText);
	        //kaptcha.session.key 所对应的值 : 默认值：KAPTCHA_SESSION_KEY
	        String correctCode= (String) req.getSession().getAttribute("KAPTCHA_SESSION_KEY");
	       // System.out.println(correctCode);

	        boolean status= correctCode.equals(code);
	        
	        resp.setContentType("application/json;charset=utf-8");//设置响应格式

	        PrintWriter pw=resp.getWriter();
	        
	        //判断用户名是否存在
/*		       if(status==true){
		    	   pw.print("true");
				}else if(status==true){
					pw.print("false");
				}else {
					  pw.print("null");
				}*/
	        pw.write(JSON.toJSONString(status));

	        pw.flush();

	        pw.close();
	}

	/**
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     System.out.println("doPost");
	}

}
