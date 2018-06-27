package com.lyz.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.lyz.dao.ExamDao;
import com.lyz.entity.DataTablePageModel;
import com.lyz.entity.PagerClassInfo;
import com.lyz.entity.PagerInfo;
import com.lyz.entity.PaperQuesInfo;
import com.lyz.entity.QuesInfo;

/**
 *考生考试
 */
@WebServlet("/ExamServlet")
public class ExamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     */
    public ExamServlet() {
        super();
    }

	/**
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}

	/**
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		if(op!=null){
			if("showData".equals(op)){//-------------------------显示数据
			showData(request,response);
			}else if("topic".equals(op)){//------------------显示试题
				topic(request, response);
			}else if("inset".equals(op)){//--------------------添加操作(往试卷中添加题目)
				inset(request, response); 
			}else if("updatePager".equals(op)){ //----------------------修改操作
				//updatePager(request, response); 
			}else if("queryClass".equals(op)) {
				//queryQues(request, response);
			}
			}
	}



	ExamDao eDao=new ExamDao();
	 /**
	    * 显示 （查询）
	    * 查询要考的试卷
	    * @param request
	    * @param response
	    */
		private void showData(HttpServletRequest request, HttpServletResponse response) {
			String dString=request.getParameter("draw");
			String starString=request.getParameter("start");//从哪个字段开始显示
			String len=request.getParameter("length");//显示的字段数
			
			int cid=Integer.parseInt(request.getParameter("cid"));//班级id
			
			try {
				DataTablePageModel<PagerClassInfo> pages=eDao.queryExamDataTablePage(cid,new Integer(starString==null?"1":starString), new Integer(len==null?"10":len));
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
		 * 查询试卷内容
		 * @param request
		 * @param response
		 */
		private void topic(HttpServletRequest request, HttpServletResponse response) {
			int pid=Integer.parseInt(request.getParameter("id"));// 试卷id

			
			ArrayList<QuesInfo> list=eDao.sTopic(pid);
			request.setAttribute("topic", list);
			request.setAttribute("pid", pid);//存入试卷id

			if(list.size()>0){
			//	System.out.println("*********************************");
				try {
					request.getRequestDispatcher("page/front/pager/paper.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else{
				try {
					request.getRequestDispatcher("page/front/pager/index.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		/**
		 * 试卷提交
		 * @param request
		 * @param response
		 */
		private void inset(HttpServletRequest request, HttpServletResponse response) {
			//int cid=Integer.parseInt(request.getParameter("cid"));
			//String snumber=request.getParameter("snumber");
			
			String info=request.getParameter("ids");//考试的答案
			int pid=Integer.parseInt(request.getParameter("pid"));//试卷id
			
			   System.out.println(info+"/"+pid);

			
			//前台是以a,b,c格式进行传输的 首先分解字符串     
		       String s[] = info.split(","); 
		       

		       
			   //根据试卷id,查询正确答案
				ArrayList<QuesInfo> list=eDao.ssTopic(pid);
				request.setAttribute("topic", list);
			
			if(list.size()>0) {
				int j=0;
				int score=0; //学生做对的题数
				
				j=list.size();//试卷总题数

				for(int i=0;i<s.length;i++){
					System.out.println(list.get(i).getAns());//正确答案
					System.out.println(s[i]);//学生答案
			
					//没有选中的情况
					if(s[i]=="undefined"||s[i].equals("undefined")){
						
					}else {
						//选中的情况下
						if(list.get(i).getAns().equals(s[i])) {
							score++;
						}
					}
				}
				System.out.println(score);
				System.out.println(j);
				
			}


}
}
