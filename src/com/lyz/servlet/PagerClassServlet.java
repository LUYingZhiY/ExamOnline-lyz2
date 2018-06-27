package com.lyz.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.lyz.dao.PagerClassDao;
import com.lyz.entity.DataTablePageModel;
import com.lyz.entity.PagerClassInfo;
import com.lyz.entity.PagerInfo;

/**
 * 试卷分配
 */
@WebServlet("/PagerClassServlet")
public class PagerClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     */
    public PagerClassServlet() {
        super();
    }

	/**
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		if(op!=null){
			if("showData".equals(op)){//-------------------------显示数据
			showData(request,response);
			}else if("deletePager".equals(op)){//------------------删除操作
				//deletePager(request, response); 
			}else if("addPager".equals(op)){//--------------------添加操作
				//addPager(request, response); 
			}else if("updatePager".equals(op)){ //----------------------修改操作
				//updatePager(request, response); 
			}else if("addPagerClass".equals(op)) {
				//addPagerClass(request, response);
			}
			}

	}
	
	
	PagerClassDao pcDao=new PagerClassDao();
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
					DataTablePageModel<PagerClassInfo> pages=pcDao.queryPagerDataTablePage(new Integer(starString==null?"1":starString), new Integer(len==null?"10":len));
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

	}

