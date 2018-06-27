package com.lyz.servlet;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * 文件上传
 */
@WebServlet("/StudentFileUploadServlet")
@MultipartConfig
public class StudentFileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * 
     */
    public StudentFileUploadServlet() {
        super();
    }

	/**
	 * 
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * 
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {

	       Collection<Part> parts= req.getParts();

	       for (Part part:parts){
	    	   //文件存放目录  
	           String path=req.getServletContext().getRealPath("/upload/Excel")+"/"+part.getSubmittedFileName();
	           part.write(path);
	       }
	}

}
