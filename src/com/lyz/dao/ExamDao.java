package com.lyz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lyz.entity.ClassInfo;
import com.lyz.entity.DataTablePageModel;
import com.lyz.entity.PagerClassInfo;
import com.lyz.entity.PagerInfo;
import com.lyz.entity.PaperQuesInfo;
import com.lyz.entity.QuesInfo;
import com.lyz.util.DruidDBPoolUtil;

public class ExamDao {
	public DataTablePageModel<PagerClassInfo> queryExamDataTablePage(int id,Integer start, Integer length) {
		DataTablePageModel<PagerClassInfo> pagesModel = new DataTablePageModel<PagerClassInfo>();
		List<PagerClassInfo> users = new ArrayList<PagerClassInfo>();
		String pageSqlString ="SELECT * FROM (pager_class pc INNER JOIN pager p ON pc.p_id=p.p_id) INNER JOIN class c ON pc.c_id=c.c_id WHERE pc.c_id=? limit ?,?;";// pagemodel data
		Connection conn = DruidDBPoolUtil.getConnection();
		////   获取当前页的数据
		PreparedStatement pstm = null;
		try {
		pstm = conn.prepareStatement(pageSqlString);
		pstm.setInt(1, id);
		pstm.setInt(2, start);
		pstm.setInt(3, length);
		// select

		ResultSet rs = pstm.executeQuery();

		while (rs.next()) {
			PagerClassInfo pc = new PagerClassInfo();
			PagerInfo p=new PagerInfo();
			ClassInfo c=new ClassInfo();
			
			
			p.setP_id(rs.getInt("p_id"));
			p.setP_name(rs.getString("p_name"));//试卷标题
			p.setP_type(rs.getString("p_type"));
			p.setP_description(rs.getString("p_description"));//试卷描述
			
			c.setC_id(rs.getInt("c_id"));
			c.setC_name(rs.getString("c_name"));
			
            pc.setC_id(c);
            pc.setP_id(p);
            pc.setPc_id(rs.getInt("pc_id"));
            pc.setPc_title(rs.getString("pc_title"));
            pc.setStartTime(rs.getString("startTime"));
            pc.setEndTime(rs.getString("endTime"));
			
			users.add(pc);
		}
		
		
		/////  查询总条
		//String pageCountString = "select count(*) from ques";//查询题库总记录
		String pageCountString="SELECT count(*) FROM (pager_class pc INNER JOIN pager p ON pc.p_id=p.p_id) INNER JOIN class c ON pc.c_id=c.c_id WHERE pc.c_id=?";

		PreparedStatement pstmcount=conn.prepareStatement(pageCountString);
		pstmcount.setInt(1, id);
		
		ResultSet rsCount=pstmcount.executeQuery();
		int counts=0;
		if (rsCount.next()) {
			counts=rsCount.getInt(1);
		}
		
		pagesModel.setRecordsTotal(counts);
		pagesModel.setRecordsFiltered(counts);
		pagesModel.setData(users);
		
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//释放资源
		    try {
				conn.close();
				pstm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return pagesModel;
    }
	/**
	 * 根据试卷id查询试题
	 * @param pid
	 * @return
	 */
	public ArrayList<QuesInfo> sTopic(int pid){//查询
		  Connection con=null;
		  PreparedStatement psmt=null;
		  ResultSet rs=null;
			ArrayList<QuesInfo> qlist=new ArrayList<QuesInfo>();
			con=DruidDBPoolUtil.getConnection();
			try {
				psmt=con.prepareStatement("SELECT q.q_id,q.q_type,q.q_content,q.a,q.b,q.c,q.d,q.ans FROM (paper_ques pq INNER JOIN ques q ON pq.q_id=q.q_id) INNER JOIN pager p ON pq.p_id=p.p_id WHERE p.p_id=?;");
				psmt.setInt(1,pid);
				rs=psmt.executeQuery();
				while(rs.next()){
					QuesInfo qst=new QuesInfo(rs.getInt(1),rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)) ;
					qlist.add(qst);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return qlist;
		}
	
	/**
	 *根据试卷id,查询正确答案
	 * @param pid
	 * @return
	 */
	public ArrayList<QuesInfo> ssTopic(int pid) {
		ArrayList<QuesInfo> List = new ArrayList<QuesInfo>();
		String SqlString ="SELECT q.ans FROM (paper_ques pq INNER JOIN ques q ON pq.q_id=q.q_id) INNER JOIN pager p ON pq.p_id=p.p_id WHERE p.p_id=?;";
		Connection conn = DruidDBPoolUtil.getConnection();
		PreparedStatement pstm = null;
		try {
			pstm = conn.prepareStatement(SqlString);
			pstm.setInt(1, pid);
			
			ResultSet rs = pstm.executeQuery();

			while (rs.next()) {
				QuesInfo q=new QuesInfo();
				
				q.setAns(rs.getString("ans"));
	            List.add(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return List;
		
	}
	
 }
