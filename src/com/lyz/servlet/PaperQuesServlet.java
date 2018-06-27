package com.lyz.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.lyz.dao.PaperQuesDao;
import com.lyz.entity.DataTablePageModel;
import com.lyz.entity.PagerInfo;
import com.lyz.entity.PaperQuesInfo;
import com.lyz.entity.QuesInfo;

/**
 * 试卷-题库
 */
@WebServlet("/PaperQuesServlet")
public class PaperQuesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * 
     */
    public PaperQuesServlet() {
        super();
        
    }

	/**
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String op = request.getParameter("op");
		if(op!=null){
			if("showData".equals(op)){//-------------------------显示数据
			showData(request,response);
			}else if("deletePaperQues".equals(op)){//------------------删除操作
				deletePaperQues(request, response); 
			}else if("addPagerQues".equals(op)){//--------------------添加操作(往试卷中添加题目)
				addPagerQues(request, response); 
			}else if("updatePager".equals(op)){ //----------------------修改操作
				//updatePager(request, response); 
			}else if("queryClass".equals(op)) {
				//queryQues(request, response);
			}
			}
	
	}
	
	PaperQuesDao pqDao=new PaperQuesDao();
	 /**
	    * 显示 （查询）
	    * @param request
	    * @param response
	    */
		private void showData(HttpServletRequest request, HttpServletResponse response) {
			String dString=request.getParameter("draw");
			String starString=request.getParameter("start");//从哪个字段开始显示
			String len=request.getParameter("length");//显示的字段数
			
			int pid=Integer.parseInt(request.getParameter("id"));//试卷id

			
			try {
				DataTablePageModel<PaperQuesInfo> pages=pqDao.queryPagerDataTablePage(pid,new Integer(starString==null?"1":starString), new Integer(len==null?"10":len));
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
		 * 添加
		 * @param request
		 * @param response
		 */
		private void addPagerQues(HttpServletRequest request, HttpServletResponse response) {
	        //获取前台传输的数据
			int p_id=Integer.parseInt(request.getParameter("p_id"));//试卷id
			String info=request.getParameter("ids");//题id
			
			//前台是以a,b,c格式进行传输的 首先分解字符串     
		     String s[] = info.split(","); 
	
			PaperQuesInfo pq=new PaperQuesInfo();
			PagerInfo p=new PagerInfo();
			QuesInfo q=new QuesInfo();
			p.setP_id(p_id);
		    pq.setP_id(p);
		       boolean flag=false;
		       if (s.length > 0) {    
		           for (int i = 0; i < s.length; i++) { 
		        	   q.setQ_id(Integer.parseInt(s[i]));
		        	   //System.out.println(s[i]+"+++++++++++++++++++++++"+p_id);
		        	   pq.setQ_id(q);
		          flag=pqDao.addPagerQues(pq);
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
	      * 删除
	      * @param ids
	      * @param request 
	      * @param response
	      */
		private void deletePaperQues(HttpServletRequest request, HttpServletResponse response) {
	        //获取前台传输的id		
			int p_id=Integer.parseInt(request.getParameter("p_id"));//试卷id
			String info=request.getParameter("ids");//题id
			
			//前台是以a,b,c格式进行传输的 首先分解字符串     
	       String s[] = info.split(","); 
	       
			PaperQuesInfo pq=new PaperQuesInfo();
			PagerInfo p=new PagerInfo();
			QuesInfo q=new QuesInfo();
			p.setP_id(p_id);
		    pq.setP_id(p);
	   
	       boolean flag=false;
	       if (s.length > 0) {    
	           for (int i = 0; i < s.length; i++) {  
	        	   q.setQ_id(Integer.parseInt(s[i]));
	        	   //System.out.println(s[i]+"////////"+p_id);
	        	   pq.setQ_id(q);
	          flag=pqDao.deletePaperQues(pq);
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
		
		
}
