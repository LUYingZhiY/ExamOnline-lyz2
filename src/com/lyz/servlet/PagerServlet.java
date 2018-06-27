package com.lyz.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.lyz.dao.PagerDao;
import com.lyz.entity.ClassInfo;
import com.lyz.entity.DataTablePageModel;
import com.lyz.entity.PagerClassInfo;
import com.lyz.entity.PagerInfo;
import com.lyz.entity.PaperQuesInfo;
import com.lyz.entity.QuesInfo;

/**
 * 试卷-组卷
 */
@WebServlet("/PagerServlet")
public class PagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * 
     */
    public PagerServlet() {
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
			}else if("deletePager".equals(op)){//------------------删除操作
				deletePager(request, response); 
			}else if("addPager".equals(op)){//--------------------添加操作
				addPager(request, response); 
			}else if("updatePager".equals(op)){ //----------------------修改操作
				updatePager(request, response); 
			}else if("addPagerClass".equals(op)) {
				addPagerClass(request, response);
			}
			}
	}


	PagerDao pDao=new PagerDao();
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
				DataTablePageModel<PagerInfo> pages=pDao.queryPagerDataTablePage(new Integer(starString==null?"1":starString), new Integer(len==null?"10":len));
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
		 * 修改
		 * @param request
		 * @param response
		 */
		private void updatePager(HttpServletRequest request, HttpServletResponse response) {
			//System.out.println("updatePager---------------------");
			
	        //获取前台传输的数据
			int p_id=Integer.parseInt(request.getParameter("p_id"));
			String p_type=request.getParameter("p_type");
			String p_name=request.getParameter("p_name");
			String p_description=request.getParameter("p_description");
			
			PagerInfo p=new PagerInfo();
            p.setP_id(p_id);
            p.setP_type(p_type);
            p.setP_name(p_name);
            p.setP_description(p_description);
	
			  boolean flag=false;
			  flag=pDao.updatePager(p);
		       if(flag) {
					try {
					PrintWriter pw = response.getWriter();
					pw.write("true");
					pw.flush();
					pw.close();
					}catch (IOException e) {
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
		private void deletePager(HttpServletRequest request, HttpServletResponse response) {
	        //获取前台传输的id		
			String info=request.getParameter("ids");
			
			//前台是以a,b,c格式进行传输的 首先分解字符串     
	       String s[] = info.split(","); 
	   
	       boolean flag=false;
	       if (s.length > 0) {    
	           for (int i = 0; i < s.length; i++) {   
	          flag=pDao.deletePager(Integer.parseInt(s[i]));
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
		 * 添加
		 * @param request
		 * @param response
		 */
		private void addPager(HttpServletRequest request, HttpServletResponse response) {
	        //获取前台传输的数据
			String add_type=request.getParameter("add_type");
			String add_name=request.getParameter("add_name");
			String add_description=request.getParameter("add_description");

			
			PagerInfo p=new PagerInfo();
			p.setP_name(add_name);
			p.setP_type(add_type);
			p.setP_description(add_description);
			
			  boolean flag=false;
			  flag=pDao.addPager(p);
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
		 * 分配试卷
		 * @param request
		 * @param response
		 */
		private void addPagerClass(HttpServletRequest request, HttpServletResponse response) {
	        //获取前台传输的数据
			int pid=Integer.parseInt(request.getParameter("pid"));//试卷id
			int cid=Integer.parseInt(request.getParameter("cid"));//试卷id
			String pc_title=request.getParameter("pc_title");//考试类型
			String startTime=request.getParameter("startTime");//开始时间
			String endTime=request.getParameter("endTime");//结束时间
			
			System.out.println(pid+"/"+cid+"/"+startTime+"/"+endTime+"/"+pc_title);
			
			PagerClassInfo pc=new PagerClassInfo();
			PagerInfo p=new PagerInfo();
			ClassInfo c=new ClassInfo();
			
			p.setP_id(pid);
			c.setC_id(cid);
			
			pc.setP_id(p);
			pc.setC_id(c);
			pc.setPc_title(pc_title);
			pc.setStartTime(startTime);
			pc.setEndTime(endTime);
			
			  boolean flag=false;
			  flag=pDao.PagerClass(pc);
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
