package com.lyz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lyz.entity.DataTablePageModel;
import com.lyz.entity.ManageInfo;
import com.lyz.entity.PagerInfo;
import com.lyz.util.DruidDBPoolUtil;

public class ManageDao2 {
	
	public DataTablePageModel<ManageInfo> queryQuesDataTablePage(Integer start, Integer length) {
		DataTablePageModel<ManageInfo> pagesModel = new DataTablePageModel<ManageInfo>();
		List<ManageInfo> users = new ArrayList<ManageInfo>();
		String pageSqlString = "SELECT * FROM manage limit ?,?";
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

			ManageInfo m= new ManageInfo();
           m.setM_id(rs.getInt("m_id"));
           m.setM_account(rs.getString("m_account"));
           m.setM_password(rs.getString("m_password"));
           m.setM_sex(rs.getString("m_sex"));
           m.setM_portrait(rs.getString("m_portrait"));
			
			users.add(m);
		}
		
		
		/////  查询总条数

		String pageCountString = "select count(*) from manage";
		
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
	 * 删除 
	 * @param id 编号
	 * @return boolean
	 */
	public boolean removes(int id) {
		Connection conn = DruidDBPoolUtil.getConnection();
		PreparedStatement pstm=null;
		String sql="DELETE FROM manage WHERE m_id=?";
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
	 * 修改 信息(修改了头像信息)
	 * @param 
	 * @return 修改成功(true)或修改失败(false)
	 */
	public boolean update(ManageInfo m){
		Connection conn = DruidDBPoolUtil.getConnection();
		PreparedStatement pstm = null;
		String sql="UPDATE manage SET m_account=?,m_password=?,m_sex=?,m_portrait=? where m_id=?; ";
		try {
			pstm = conn.prepareStatement(sql);
			//设置参数
			pstm.setString(1,m.getM_account());
			pstm.setString(2,m.getM_password());
			pstm.setString(3,m.getM_sex());
			pstm.setString(4,m.getM_portrait());
			pstm.setInt(5,m.getM_id());

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
	 * 修改 信息(不修改头像信息)
	 * @param 
	 * @return 修改成功(true)或修改失败(false)
	 */
	public boolean update2(ManageInfo m){
		Connection conn = DruidDBPoolUtil.getConnection();
		PreparedStatement pstm = null;
		String sql="UPDATE manage SET m_account=?,m_password=?,m_sex=? where m_id=?; ";
		try {
			pstm = conn.prepareStatement(sql);
			//设置参数
			pstm.setString(1,m.getM_account());
			pstm.setString(2,m.getM_password());
			pstm.setString(3,m.getM_sex());
			pstm.setInt(4,m.getM_id());

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
	 * 添加（上传头像）
	 * @param QuesInfo
	 * @return boolean
	 */
	public boolean add(ManageInfo m) {
		Connection conn = null;
		PreparedStatement pstm = null;
		String sql="INSERT INTO manage(m_account,m_password,m_sex,m_portrait) VALUES(?,?,?,?);";
		try {
			conn = DruidDBPoolUtil.getConnection();
			pstm = conn.prepareStatement(sql);
			//设置参数
			pstm.setString(1,m.getM_account());
			pstm.setString(2,m.getM_password());
			pstm.setString(3,m.getM_sex());
			pstm.setString(4,m.getM_portrait());

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
	 * 添加(未上传头像)
	 * @param QuesInfo
	 * @return boolean
	 */
	public boolean add2(ManageInfo m) {
		Connection conn = null;
		PreparedStatement pstm = null;
		String sql="INSERT INTO manage(m_account,m_password,m_sex) VALUES(?,?,?);";
		try {
			conn = DruidDBPoolUtil.getConnection();
			pstm = conn.prepareStatement(sql);
			//设置参数
			pstm.setString(1,m.getM_account());
			pstm.setString(2,m.getM_password());
			pstm.setString(3,m.getM_sex());

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
