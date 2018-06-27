package com.lyz.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.lyz.dao.QuesDao;
import com.lyz.entity.ClassInfo;
import com.lyz.entity.DataTablePageModel;
import com.lyz.entity.QuesInfo;
import com.lyz.entity.StudentInfo;

/**
 * 试题（题库）
 */
@WebServlet("/QuesServlet")
public class QuesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     */
    public QuesServlet() {
        super();
    }

	/**
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("QuesServlet----doPost");
		String op = request.getParameter("op");
		if(op!=null){
			if("showData".equals(op)){//-------------------------显示数据
			showData(request,response);
			}else if("deleteQues".equals(op)){//------------------删除操作
				deleteQues(request, response); 
			}else if("addQues".equals(op)){//--------------------添加操作
				addQues(request, response); 
			}else if("updateQues".equals(op)){ //----------------------修改操作
				updateQues(request, response); 
			}else if("queryClass".equals(op)) {
				//queryQues(request, response);
			}
			}
	}
	
	QuesDao qDao=new QuesDao();
	 /**
	    * 显示 （查询）
	    * @param request
	    * @param response
	    */
		private void showData(HttpServletRequest request, HttpServletResponse response) {
			String dString=request.getParameter("draw");
			String starString=request.getParameter("start");//从哪个字段开始显示
			String len=request.getParameter("length");//显示的字段数
			
			
			try {
				DataTablePageModel<QuesInfo> pages=qDao.queryQuesDataTablePage(new Integer(starString==null?"1":starString), new Integer(len==null?"10":len));
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
	      * 删除
	      * @param request
	      * @param response
	      */
		private void deleteQues(HttpServletRequest request, HttpServletResponse response) {
	        //获取前台传输的id		
			String info=request.getParameter("ids");
			
			//前台是以a,b,c格式进行传输的 首先分解字符串     
	       String s[] = info.split(","); 
	   
	       boolean flag=false;
	       if (s.length > 0) {    
	           for (int i = 0; i < s.length; i++) {   
	          flag=qDao.removeQues(Integer.parseInt(s[i]));
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
		 * 修改
		 * @param request
		 * @param response
		 */
		private void updateQues(HttpServletRequest request, HttpServletResponse response) {
	        //获取前台传输的数据
			int q_id=Integer.parseInt(request.getParameter("q_id"));
			String q_type=request.getParameter("q_type");
			String q_content=request.getParameter("q_content");
			String a=request.getParameter("a");
			String b=request.getParameter("b");
			String c=request.getParameter("c");
			String d=request.getParameter("d");
			String ans=request.getParameter("ans");
			
			QuesInfo q=new QuesInfo();
			q.setQ_id(q_id);
			q.setQ_type(q_type);
			q.setQ_content(q_content);
			q.setA(a);
			q.setB(b);
			q.setC(c);
			q.setD(d);
			q.setAns(ans);
	
			
			  boolean flag=false;
			  flag=qDao.updateQues(q);
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
		 * 添加
		 * @param request
		 * @param response
		 */
		private void addQues(HttpServletRequest request, HttpServletResponse response) {
	        //获取前台传输的数据
			String q_type=request.getParameter("q_type");
			String q_content=request.getParameter("q_content");
			String a=request.getParameter("a");
			String b=request.getParameter("b");
			String c=request.getParameter("c");
			String d=request.getParameter("d");
			String ans=request.getParameter("ans");
			
			System.out.println(q_type+"+"+q_content+"+"+a+"+"+c+"...........");
			
			QuesInfo q=new QuesInfo();
			q.setQ_type(q_type);
			q.setQ_content(q_content);
			q.setA(a);
			q.setB(b);
			q.setC(c);
			q.setD(d);
			q.setAns(ans);
	
			
			  boolean flag=false;
			  flag=qDao.addQues(q);
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
