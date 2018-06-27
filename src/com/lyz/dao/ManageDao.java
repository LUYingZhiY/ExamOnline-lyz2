package com.lyz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.lyz.entity.ManageInfo;
import com.lyz.util.DruidDBPoolUtil;

/**
 * 管理员数据访问层
 * @author Administrator
 *
 */
public class ManageDao {
	public static final String SELECTSQL="select * from manage where m_id=?";
	
	/**
	 * 登陆
	 * 查询单个管理员信息
	 *  @param 账号、密码
	 * @return 登录成功返回用户信息，登录失败返回null
	 */
	public ManageInfo validateLogin(ManageInfo loginUser) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ManageInfo user = null;
		String sql = "select m_id,m_sex,m_portrait from manage where m_account=? and m_password=?";
		
		try {
			conn = DruidDBPoolUtil.getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, loginUser.getM_account());
			pstm.setString(2, loginUser.getM_password());
	
			// 执行查询
			rs = pstm.executeQuery();
	
			if (rs.next()) {
				user = new ManageInfo();
				user.setM_id(rs.getInt("m_id"));
				user.setM_sex(rs.getString("m_sex"));
				user.setM_portrait(rs.getString("m_portrait"));
				user.setM_account(loginUser.getM_account());
				user.setM_password(loginUser.getM_password());
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
		
		return user;
	}

	/**
	 * 根据用户id查询用户信息
	 * @param id
	 * @return ManageInfo
	 */
	public ManageInfo selectManage(ManageInfo man) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ManageInfo user = null;
		try {
			conn = DruidDBPoolUtil.getConnection();
			pstm = conn.prepareStatement(SELECTSQL);
			pstm.setInt(1, man.getM_id());
		
	
			// 执行查询
			rs = pstm.executeQuery();
	
			if (rs.next()) {
				user = new ManageInfo();
				user.setM_id(man.getM_id());
				user.setM_sex(rs.getString("m_sex"));
				user.setM_portrait(rs.getString("m_portrait"));
				user.setM_account(rs.getString("m_account"));
				user.setM_password(rs.getString("m_password"));
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
		
		return user;
	}
	
	
	
	
	
	/**
	 * 修改用户信息
	 * @param user 用户
	 * @param oldPwd 旧密码
	 * @return 修改成功(true) 或 修改失败(false)
	 */
	public boolean update(ManageInfo user,String oldPwd) {
		Connection conn = null;
		PreparedStatement pstm = null;

		String sql = "update manage set m_account=?,m_password=?,m_sex=?,m_portrait=? where id=?";
		
		try {
			conn = DruidDBPoolUtil.getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, user.getM_account());
			pstm.setString(2, user.getM_password());
			pstm.setString(3, user.getM_sex());
			pstm.setString(4, user.getM_portrait());
			pstm.setInt(5,user.getM_id() );
	
			// 执行更新
			int rowCount = pstm.executeUpdate();
			if (rowCount>0) {
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
	 * 修改
	 * @param user
	 * @param oldPwd
	 * @return
	 */
	public boolean update(ManageInfo m) {
		return this.update(m, m.getM_account());
	}

}
