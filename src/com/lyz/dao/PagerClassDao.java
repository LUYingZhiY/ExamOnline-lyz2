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
import com.lyz.util.DruidDBPoolUtil;
/**
 * 试卷分配
 * @author Administrator
 *
 */
public class PagerClassDao {
	public DataTablePageModel<PagerClassInfo> queryPagerDataTablePage(Integer start, Integer length) {
		DataTablePageModel<PagerClassInfo> pagesModel = new DataTablePageModel<PagerClassInfo>();
		List<PagerClassInfo> users = new ArrayList<PagerClassInfo>();
		  String pageSqlString="SELECT  * FROM (pager_class pc INNER JOIN pager p ON pc.p_id=p.p_id) INNER JOIN class c ON pc.c_id=c.c_id limit ?,?";
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
			ClassInfo c=new ClassInfo();
			c.setC_id(rs.getInt("c_id"));
			c.setC_name(rs.getString("c_name"));
			
			PagerInfo p=new PagerInfo();
			p.setP_id(rs.getInt("p_id"));
			p.setP_name(rs.getString("p_name"));//试卷标题
			p.setP_type(rs.getString("p_type"));
			p.setP_description(rs.getString("p_description"));//试卷描述
			
			PagerClassInfo pc = new PagerClassInfo();
			pc.setC_id(c);
			pc.setP_id(p);
			pc.setPc_title(rs.getString("pc_title"));
			pc.setPc_id(rs.getInt("pc_id"));
			pc.setStartTime(rs.getString("startTime"));
			pc.setEndTime(rs.getString("endTime"));
		
			
			users.add(pc);
		}
		
		
		/////  查询总条数

		String pageCountString ="SELECT  count(*) FROM (pager_class pc INNER JOIN pager p ON pc.p_id=p.p_id) INNER JOIN class c ON pc.c_id=c.c_id";
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
}
