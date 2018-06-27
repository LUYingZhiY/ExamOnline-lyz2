package com.lyz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lyz.entity.DataTablePageModel;
import com.lyz.entity.PagerClassInfo;
import com.lyz.entity.PagerInfo;
import com.lyz.entity.PaperQuesInfo;
import com.lyz.entity.QuesInfo;
import com.lyz.util.DruidDBPoolUtil;

/**
 * 
 * 试卷
 * @author Administrator
 *
 */
public class PagerDao {
	public DataTablePageModel<PagerInfo> queryPagerDataTablePage(Integer start, Integer length) {
		DataTablePageModel<PagerInfo> pagesModel = new DataTablePageModel<PagerInfo>();
		List<PagerInfo> users = new ArrayList<PagerInfo>();
		//String pageSqlString ="SELECT * FROM (paper_ques pq INNER JOIN ques q ON pq.q_id=q.q_id) right JOIN pager p ON pq.p_id=p.p_id group by p.p_id limit ?,?;";// pagemodel data
		  String pageSqlString="SELECT * FROM pager limit ?,?";
		Connection conn = DruidDBPoolUtil.getConnection();
		////   获取当前页的数据
		PreparedStatement pstm = null;
		try {
		pstm = conn.prepareStatement(pageSqlString);
		pstm.setInt(1, start);
		pstm.setInt(2, length);
		// select

		ResultSet rs = pstm.executeQuery();

		while (rs.next()) {
			
			
			PagerInfo p=new PagerInfo();
			
/*			QuesInfo q=new QuesInfo();
 *          q.setQ_id(rs.getInt("q_id"));//题库 id
			q.setQ_type(rs.getString("q_type"));
			q.setQ_content(rs.getString("q_content"));
			q.setA(rs.getString("a"));
			q.setB(rs.getString("b"));
			q.setC(rs.getString("c"));
			q.setD(rs.getString("d"));
			q.setAns(rs.getString("ans"));*/
			
			p.setP_id(rs.getInt("p_id"));
			p.setP_name(rs.getString("p_name"));//试卷标题
			p.setP_type(rs.getString("p_type"));
			p.setP_description(rs.getString("p_description"));//试卷描述
			
/*			PaperQuesInfo pq = new PaperQuesInfo();
			pq.setPq_id(rs.getInt("pq_id"));//关系表id
			pq.setP_id(p);
			pq.setQ_id(q);
			*/
			users.add(p);
		}
		
		
		/////  查询总条数

		String pageCountString = "select count(*) from pager";//查询试卷总记录
		
		PreparedStatement pstmcount=conn.prepareStatement(pageCountString);
		
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
	 * 修改 信息
	 * @param PagerInfo
	 * @return 修改成功(true)或修改失败(false)
	 */
	
	public boolean updatePager(PagerInfo p){
		Connection conn = DruidDBPoolUtil.getConnection();
		PreparedStatement pstm = null;
		String sql="update pager set p_name=?,p_type=?,p_description=? where p_id=?";
		try {
			pstm = conn.prepareStatement(sql);
			//设置参数
			pstm.setString(1,p.getP_name());
			pstm.setString(2,p.getP_type());
			pstm.setString(3,p.getP_description());
			pstm.setInt(4,p.getP_id());

			int rowCount = 0;
			rowCount = pstm.executeUpdate();
			if (rowCount > 0) {
				return true;
			}
		} catch (SQLException e) {
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
	public boolean deletePager(int id) {
		Connection conn = DruidDBPoolUtil.getConnection();
		PreparedStatement pstm=null;
		String sql="delete from pager where p_id=?";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, id);
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
	
	/**
	 * 添加试卷
	 * @param QuesInfo
	 * @return boolean
	 */
	public boolean addPager(PagerInfo p) {
		Connection conn = null;
		PreparedStatement pstm = null;
		String sql="INSERT INTO pager(p_name,p_description,p_type) VALUES(?,?,?)";
		
		try {
			conn = DruidDBPoolUtil.getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,p.getP_name());
			pstm.setString(2,p.getP_description());
			pstm.setString(3,p.getP_type());

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
	 * 分配试卷
	 * @param PagerClassInfo
	 * @return boolean
	 */
	public boolean PagerClass(PagerClassInfo pc) {
		Connection conn = null;
		PreparedStatement pstm = null;
		String sql="INSERT pager_class(pc_title,p_id,c_id,startTime,endTime) VALUES(?,?,?,?,?)";
		
		try {
			conn = DruidDBPoolUtil.getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,pc.getPc_title());
			pstm.setInt(2,pc.getP_id().getP_id());
			pstm.setInt(3,pc.getC_id().getC_id());
			pstm.setString(4,pc.getStartTime());
			pstm.setString(5,pc.getEndTime());

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

}
