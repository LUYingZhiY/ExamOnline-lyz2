package com.lyz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lyz.entity.ClassInfo;
import com.lyz.entity.DataTablePageModel;
import com.lyz.entity.QuesInfo;
import com.lyz.entity.StudentInfo;
import com.lyz.util.DruidDBPoolUtil;

public class QuesDao {

	public DataTablePageModel<QuesInfo> queryQuesDataTablePage(Integer start, Integer length) {
		DataTablePageModel<QuesInfo> pagesModel = new DataTablePageModel<QuesInfo>();
		List<QuesInfo> users = new ArrayList<QuesInfo>();
		String pageSqlString = "SELECT * FROM ques limit ?,?";// pagemodel data
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

			QuesInfo q = new QuesInfo();
			q.setQ_id(rs.getInt("q_id"));
			q.setQ_content(rs.getString("q_content"));//题目
			q.setQ_type(rs.getString("q_type"));//题型
		    q.setA(rs.getString("a"));
		    q.setB(rs.getString("b"));
		    q.setC(rs.getString("c"));
		    q.setD( rs.getString("d"));
		    q.setAns(rs.getString("ans"));//正确
			
			users.add(q);
		}
		
		
		/////  查询总条数

		String pageCountString = "select count(*) from ques";
		
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
	 * 删除 题
	 * @param id 编号
	 * @return boolean
	 */
	public boolean removeQues(int id) {
		Connection conn = DruidDBPoolUtil.getConnection();
		PreparedStatement pstm=null;
		String sql="delete from ques where q_id=?";
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
	 * 修改 信息
	 * @param QuesInfo
	 * @return 修改成功(true)或修改失败(false)
	 */
	
	public boolean updateQues(QuesInfo q){
		Connection conn = DruidDBPoolUtil.getConnection();
		PreparedStatement pstm = null;
		String sql="update ques set q_type=?,q_content=?,a=?,b=?,c=?,d=?,ans=? where q_id=?";
		try {
			pstm = conn.prepareStatement(sql);
			//设置参数
			pstm.setString(1,q.getQ_type());
			pstm.setString(2, q.getQ_content());
			pstm.setString(3,q.getA());
			pstm.setString(4,q.getB());
			pstm.setString(5,q.getC());
			pstm.setString(6,q.getD());
			pstm.setString(7, q.getAns());
			pstm.setInt(8, q.getQ_id());
			
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
	 * 添加试题
	 * @param QuesInfo
	 * @return boolean
	 */
	public boolean addQues(QuesInfo q) {
		Connection conn = null;
		PreparedStatement pstm = null;
		String sql="insert into ques(q_type,q_content,a,b,c,d,ans) values(?,?,?,?,?,?,?)";
		
		try {
			conn = DruidDBPoolUtil.getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,q.getQ_type());
			pstm.setString(2,q.getQ_content());
			pstm.setString(3,q.getA());
			pstm.setString(4,q.getB());
			pstm.setString(5,q.getC());
			pstm.setString(6,q.getD());
			pstm.setString(7,q.getAns());
		
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
