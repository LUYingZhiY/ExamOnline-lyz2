package com.lyz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lyz.entity.DataTablePageModel;
import com.lyz.entity.PagerInfo;
import com.lyz.entity.PaperQuesInfo;
import com.lyz.entity.QuesInfo;
import com.lyz.util.DruidDBPoolUtil;

/**
 * 试卷-题库
 * @author Administrator
 *
 */
public class PaperQuesDao {

	public DataTablePageModel<PaperQuesInfo> queryPagerDataTablePage(int id,Integer start, Integer length) {
		DataTablePageModel<PaperQuesInfo> pagesModel = new DataTablePageModel<PaperQuesInfo>();
		List<PaperQuesInfo> users = new ArrayList<PaperQuesInfo>();
		String pageSqlString ="SELECT * FROM (paper_ques pq INNER JOIN ques q ON pq.q_id=q.q_id) INNER JOIN pager p ON pq.p_id=p.p_id WHERE p.p_id=? limit ?,?;";// pagemodel data
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
			PaperQuesInfo pq = new PaperQuesInfo();
			QuesInfo q=new QuesInfo();
			PagerInfo p=new PagerInfo();
			
			q.setQ_id(rs.getInt("q_id"));//题库 id
			q.setQ_type(rs.getString("q_type"));
			q.setQ_content(rs.getString("q_content"));
			q.setA(rs.getString("a"));
			q.setB(rs.getString("b"));
			q.setC(rs.getString("c"));
			q.setD(rs.getString("d"));
			q.setAns(rs.getString("ans"));
			
			p.setP_id(rs.getInt("p_id"));
			p.setP_name(rs.getString("p_name"));//试卷标题
			p.setP_type(rs.getString("p_type"));
			p.setP_description(rs.getString("p_description"));//试卷描述
			
			pq.setPq_id(rs.getInt("pq_id"));//关系表id
			pq.setP_id(p);
			pq.setQ_id(q);
			
			users.add(pq);
		}
		
		
		/////  查询总条
		//String pageCountString = "select count(*) from ques";//查询题库总记录
		 //查询该试卷的总题数
		String pageCountString="SELECT  count(*) FROM (paper_ques pq INNER JOIN ques q ON pq.q_id=q.q_id) INNER JOIN pager p ON pq.p_id=p.p_id WHERE p.p_id=?";

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
	 * 往试卷添加试题
	 * @param QuesInfo
	 * @return boolean
	 */
	public boolean addPagerQues(PaperQuesInfo pq) {
		Connection conn = null;
		PreparedStatement pstm = null;
		String sql="INSERT INTO paper_ques(p_id,q_id) VALUES(?,?);";
		try {
			conn = DruidDBPoolUtil.getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1,pq.getP_id().getP_id());
			pstm.setInt(2,pq.getQ_id().getQ_id());

		
			int count  = pstm.executeUpdate();
			if(count>0){
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//释放资源
		    try {
				conn.close();
				pstm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	/**
	 * 删除 
	 * @param id 编号
	 * @return boolean
	 */
	public boolean deletePaperQues(PaperQuesInfo pq) {
		Connection conn = DruidDBPoolUtil.getConnection();
		PreparedStatement pstm=null;
		String sql="DELETE FROM paper_ques WHERE p_id=? AND q_id=?";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1,pq.getP_id().getP_id());//试卷id
			pstm.setInt(2,pq.getQ_id().getQ_id());//题id
			int rowCount = 0;
			rowCount = pstm.executeUpdate();
			if (rowCount > 0) {
				return true;
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}finally {
			//释放资源
		    try {
				conn.close();
				pstm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
}
