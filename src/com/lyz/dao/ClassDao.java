package com.lyz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lyz.entity.ClassInfo;
import com.lyz.entity.DataTablePageModel;
import com.lyz.util.DruidDBPoolUtil;

/**
 * 班级数据访问层
 * @author Administrator
 *
 */
public class ClassDao {
	public static final String INSERTSQL="insert into class(c_name) values(?)";
	public static final String DELETESQL="delete from class where c_id=?";
	public static final String UPDATESQL="update class set c_name=? where c_id=?";
	public static final String SELECTSQL="select * from class";
	
	
	/**
	 * dataTable 形式进行分页操作
	 * @param currentPage
	 * @param pageSize
	 * @return DataTablePageModel
	 * @throws SQLException
	 */
	public DataTablePageModel<ClassInfo> queryClassDataTablePage(int start, int length) {
		DataTablePageModel<ClassInfo> pagesModel = new DataTablePageModel<ClassInfo>();
		List<ClassInfo> users = new ArrayList<ClassInfo>();
		String pageSqlString = "select * from class  limit ?,?";// pagemodel data
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

			ClassInfo c = new ClassInfo();
			c.setC_id(rs.getInt("c_id"));
			c.setC_name(rs.getString("c_name"));
			users.add(c);
		}
		
		
		/////  查询总条数

		String pageCountString = "select count(*) from class";
		
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
	 * 添加班级
	 * @param ClassInfo
	 * @return boolean
	 */
	public boolean addClass(ClassInfo c) {
		Connection conn = null;
		PreparedStatement pstm = null;
		
		try {
			conn = DruidDBPoolUtil.getConnection();
			pstm = conn.prepareStatement(INSERTSQL);
			pstm.setString(1, c.getC_name());
		
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
	 * 修改 班级
	 * @param ClassInfo
	 * @return 修改成功(true)或修改失败(false)
	 */
	public boolean updateClass(ClassInfo c){
		Connection conn = DruidDBPoolUtil.getConnection();
		PreparedStatement pstm = null;
		try {
			pstm = conn.prepareStatement(UPDATESQL);
			//设置参数
			pstm.setString(1, c.getC_name());
			pstm.setInt(2, c.getC_id());
		
			
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
	 * 删除 班级
	 * @param id 编号
	 * @return boolean
	 */
	public boolean removeClass(int id) {
		Connection conn = DruidDBPoolUtil.getConnection();
		PreparedStatement pstm=null;
		try {
			
			pstm = conn.prepareStatement(DELETESQL);
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
	 * 查询 班级列表
	 * @param
	 * @return ArrayList<ClassInfo>
	 */
	public ArrayList<ClassInfo> SelectClass() {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		ArrayList<ClassInfo> list = new ArrayList<ClassInfo>();
		ClassInfo c=null;
		try {
			conn = DruidDBPoolUtil.getConnection();
			pstm = conn.prepareStatement(SELECTSQL);

			// 执行查询
			rs = pstm.executeQuery();
			while(rs.next()){
				c=new ClassInfo();
				c.setC_id(rs.getInt("c_id"));
				c.setC_name(rs.getString("c_name"));

				
				list.add(c);
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
		return list;
	}
	
	
	/**
	 * 查询 班级
	 * @param c_id
	 * @return ArrayList<ClassInfo>
	 */
	public ArrayList<ClassInfo> SelectClassName(ClassInfo cl) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		ArrayList<ClassInfo> list = new ArrayList<ClassInfo>();
		String sql="select * from class where c_id=?";
		ClassInfo c=null;
		try {
			conn = DruidDBPoolUtil.getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, cl.getC_id());

			// 执行查询
			rs = pstm.executeQuery();
			while(rs.next()){
				c=new ClassInfo();
				c.setC_id(rs.getInt("c_id"));
				c.setC_name(rs.getString("c_name"));

				
				list.add(c);
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
		return list;
	}

}
