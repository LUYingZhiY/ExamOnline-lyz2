package com.lyz.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.ddf.EscherColorRef.SysIndexSource;

import com.alibaba.fastjson.JSON;
import com.lyz.dao.ManageDao2;
import com.lyz.entity.DataTablePageModel;
import com.lyz.entity.ManageInfo;

/**
 */
@WebServlet("/ManageServlet")
public class ManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

       
    /**
     */
    public ManageServlet() {
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
		//System.out.println("进入ManageServlet-----dopost..........");
		
		String op = request.getParameter("op");
		if(op!=null){
			if("showData".equals(op)){//-------------------------显示数据
			showData(request,response);
			}else if("removes".equals(op)){//------------------删除操作
				removes(request, response); 
			}else if("add".equals(op)){//--------------------添加操作
				add(request, response); 
			}else if("update".equals(op)){ //----------------------修改操作
				update(request, response); 
			}else if("addPagerClass".equals(op)) {
				//addPagerClass(request, response);
			}else {
				
			}
			}

	}





	ManageDao2 mDao=new ManageDao2();
	
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
					DataTablePageModel<ManageInfo> pages=mDao.queryQuesDataTablePage(new Integer(starString==null?"1":starString), new Integer(len==null?"10":len));
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
	private void removes(HttpServletRequest request, HttpServletResponse response) {
		 //获取前台传输的id		
		String info=request.getParameter("ids");
		
		//前台是以a,b,c格式进行传输的 首先分解字符串     
       String s[] = info.split(","); 
   
       boolean flag=false;
       if (s.length > 0) {    
           for (int i = 0; i < s.length; i++) {   
          flag=mDao.removes(Integer.parseInt(s[i]));
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
	private void update(HttpServletRequest req, HttpServletResponse resp) {
		int m_id=Integer.parseInt(req.getParameter("m_id"));
		String m_account=req.getParameter("m_account");
		String m_password=req.getParameter("m_password");
		String m_sex=req.getParameter("m_sex");
		
		String flag=req.getParameter("flag");
		
		System.out.println(flag+"/"+m_id+"/"+m_account+"/"+m_password+"/"+m_sex);
		
		String fileName=null; //文件名
		if(flag.equals("true")){//判断是否修改了头像
		//判断是否是上传文件的请求
		boolean  isMulitpart=ServletFileUpload.isMultipartContent(req);
		
		//获取上传文件的根路径
		String uploadPath=req.getServletContext().getRealPath("/upload");
		
		System.out.println("上传文件的根路径(上传到):"+uploadPath);
		System.out.println("判断是否是上传文件的请求:"+isMulitpart);
		
		if (isMulitpart) {
			//创建fileItem工厂
			DiskFileItemFactory factory=new DiskFileItemFactory();
			//创建文件上传的解析器
			ServletFileUpload fileUpload=new ServletFileUpload(factory);
			try {
				//解析当前请求中的文件
				List<FileItem> fileItems=fileUpload.parseRequest(req);
				
				
				for (FileItem fileItem : fileItems) {
					//是普通的表單元素
					if (fileItem.isFormField()) {
						String name=fileItem.getFieldName();
						String valueString=fileItem.getString();
					}else{
					//koala12312312312312312.png
						String filePathString=uploadPath+"/"+fileItem.getName();
						
						fileName="upload/"+fileItem.getName();
						System.out.println("文件名："+fileName);
						
						
						System.out.println("上传的文件："+filePathString);
						try {
							//进行文件上传操作
							fileItem.write(new File(filePathString));
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
		}
	}//__文件上传
		System.out.println("文件名2："+fileName);
		if(fileName!=null) {
			ManageInfo m=new ManageInfo();
			m.setM_id(m_id);
			m.setM_account(m_account);
			m.setM_password(m_password);
			m.setM_portrait(fileName);
			m.setM_sex(m_sex);
			
		  
			  boolean flag2=false;
			  flag2= mDao.update(m);
		       if(flag2) {
					try {
					PrintWriter pw = resp.getWriter();
					//pw.write("true");
					pw.write(JSON.toJSONString(m));//返回
				
					pw.flush();
					pw.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
		       }
		}else {
			ManageInfo m=new ManageInfo();
			m.setM_id(m_id);
			m.setM_account(m_account);
			m.setM_password(m_password);
			m.setM_sex(m_sex);
			
			  boolean flag2=false;
			  flag2= mDao.update2(m);
		       if(flag2) {
					try {
					PrintWriter pw = resp.getWriter();
					pw.write("true");
					pw.flush();
					pw.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
		       }
			
		}
		
		
	}
	/**
	 * 添加管理员
	 * @param request
	 * @param response
	 */
	private void add(HttpServletRequest req, HttpServletResponse response) {
		String m_account=req.getParameter("m_account");
		String m_password=req.getParameter("m_password");
		String m_sex=req.getParameter("m_sex");
		
		String flag=req.getParameter("flag");
		
		System.out.println(flag+"/"+"/"+m_account+"/"+m_password+"/"+m_sex);
			
		String fileName=null; //文件名
		if(flag.equals("true")){//判断是否上传了头像
		//判断是否是上传文件的请求
		boolean  isMulitpart=ServletFileUpload.isMultipartContent(req);
		
		//获取上传文件的根路径
		String uploadPath=req.getServletContext().getRealPath("/upload");
		
		System.out.println("上传文件的根路径(上传到):"+uploadPath);
		System.out.println("判断是否是上传文件的请求:"+isMulitpart);
		
		if (isMulitpart) {
			
			//创建fileItem工厂
			DiskFileItemFactory factory=new DiskFileItemFactory();
			//创建文件上传的解析器
			ServletFileUpload fileUpload=new ServletFileUpload(factory);
			try {
				//解析当前请求中的文件
				List<FileItem> fileItems=fileUpload.parseRequest(req);
				
				
				for (FileItem fileItem : fileItems) {
					//是普通的表單元素
					if (fileItem.isFormField()) {
						String name=fileItem.getFieldName();
						String valueString=fileItem.getString();
					}else{
					//koala12312312312312312.png
						String filePathString=uploadPath+"/"+fileItem.getName();
						
						fileName="upload/"+fileItem.getName();
						System.out.println("文件名："+fileName);
						
						System.out.println("上传的文件："+filePathString);
						try {
							//进行文件上传操作
							fileItem.write(new File(filePathString));
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
		}
	}//__文件上传
		if(fileName!=null) {
			ManageInfo m=new ManageInfo();
			m.setM_account(m_account);
			m.setM_password(m_password);
			m.setM_portrait(fileName);
			m.setM_sex(m_sex);
			
		  
			  boolean flag2=false;
			  flag2= mDao.add(m);
		       if(flag2) {
					try {
					PrintWriter pw = response.getWriter();
					//pw.write("true");
					pw.write(JSON.toJSONString(m));//返回
				
					pw.flush();
					pw.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
		       }
		}else {
			ManageInfo m=new ManageInfo();
			m.setM_account(m_account);
			m.setM_password(m_password);
			m.setM_sex(m_sex);
			
			  boolean flag2=false;
			  flag2= mDao.add2(m);
		       if(flag2) {
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
	}//Add_END
	
	
	
}
