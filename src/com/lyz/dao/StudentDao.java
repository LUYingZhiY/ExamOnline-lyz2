package com.lyz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lyz.entity.ClassInfo;
import com.lyz.entity.DataTablePageModel;
import com.lyz.entity.StudentInfo;
import com.lyz.util.DruidDBPoolUtil;


/**
 * 
 * 学生数据访问层
 * @author Administrator
 *
 */
public class StudentDao {
	public static final String INSERTSQL="insert into student(s_id,s_name,s_number,s_identity,s_password,s_sex,s_Birthdate,s_portrait,c_id) values(?,?,?,?,?,?,?,?,?)";
	public static final String DELETESQL="delete from student where s_id=?";
	public static final String UPDATESQL="update student set s_name=?,s_number=?,s_identity=?,s_password=?,s_sex=?,s_Birthdate=?,s_portrait=?,c_id=? where s_id=?";
	public static final String SELECTSQL="select * from student";
	
	
	/**
	 * dataTable 形式进行分页操作
	 * @param currentPage
	 * @param pageSize
	 * @return DataTablePageModel
	 * @throws SQLException
	 */
	public DataTablePageModel<StudentInfo> queryStudentDataTablePage(int start, int length) {
		DataTablePageModel<StudentInfo> pagesModel = new DataTablePageModel<StudentInfo>();
		List<StudentInfo> users = new ArrayList<StudentInfo>();
		String pageSqlString = "select * from student AS s INNER JOIN class AS c ON s.c_id=c.c_id limit ?,?";// pagemodel data
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

			StudentInfo s = new StudentInfo();
			s.setS_id(rs.getInt("s_id"));
			s.setS_name(rs.getString("s_name"));
			s.setS_password(rs.getString("s_password"));
			s.setS_portrait(rs.getString("s_portrait"));
			s.setS_Birthdate(rs.getString("s_Birthdate"));
			s.setS_identity(rs.getString("s_identity"));
			s.setS_number(rs.getString("s_number"));
			s.setS_sex(rs.getString("s_sex"));
			
			ClassInfo c=new ClassInfo();
			c.setC_id(rs.getInt("c_id"));
			c.setC_name(rs.getString("c_name"));
			s.setC_id(c);
			
			users.add(s);
		}
		
		
		/////  查询总条数

		String pageCountString = "select count(*) from student AS s INNER JOIN class AS c ON s.c_id=c.c_id";
		
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
	 * 根据班级id查询学生
	 * 
	 * dataTable 形式进行分页操作
	 * @param currentPage
	 * @param pageSize
	 * @return DataTablePageModel
	 * @throws SQLException
	 */
	public DataTablePageModel<StudentInfo> queryStudentDataTablePage2(String cid,int start, int length) {
		DataTablePageModel<StudentInfo> pagesModel = new DataTablePageModel<StudentInfo>();
		List<StudentInfo> users = new ArrayList<StudentInfo>();
		String pageSqlString = "select * from student AS s INNER JOIN class AS c ON s.c_id=c.c_id WHERE c.c_id=? limit ?,?;";// pagemodel data
		Connection conn = DruidDBPoolUtil.getConnection();
		////   获取当前页的数据
		PreparedStatement pstm = null;
		try {
		pstm = conn.prepareStatement(pageSqlString);
		pstm.setString(1, cid);
		pstm.setInt(2, start);
		pstm.setInt(3, length);
		// select

		ResultSet rs = pstm.executeQuery();

		while (rs.next()) {

			StudentInfo s = new StudentInfo();
			s.setS_id(rs.getInt("s_id"));
			s.setS_name(rs.getString("s_name"));
			s.setS_password(rs.getString("s_password"));
			s.setS_portrait(rs.getString("s_portrait"));
			s.setS_Birthdate(rs.getString("s_Birthdate"));
			s.setS_identity(rs.getString("s_identity"));
			s.setS_number(rs.getString("s_number"));
			s.setS_sex(rs.getString("s_sex"));
			
			ClassInfo c=new ClassInfo();
			c.setC_id(rs.getInt("c_id"));
			c.setC_name(rs.getString("c_name"));
			s.setC_id(c);
			
			users.add(s);
		}
		
		
		/////  查询总条数

		String pageCountString = "select count(*) from student AS s INNER JOIN class AS c ON s.c_id=c.c_id WHERE c.c_id=?";
		PreparedStatement pstmcount=conn.prepareStatement(pageCountString);
		pstmcount.setString(1, cid);
		
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
	 * 删除 学生
	 * @param id 编号
	 * @return boolean
	 */
	public boolean removeStudent(int id) {
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
	 * 修改 学生信息
	 * @param StudentInfo
	 * @return 修改成功(true)或修改失败(false)
	 */
	
	public boolean updateStudent(StudentInfo s){
		Connection conn = DruidDBPoolUtil.getConnection();
		PreparedStatement pstm = null;
		try {
			pstm = conn.prepareStatement(UPDATESQL);
			//设置参数
			//
			pstm.setString(1, s.getS_name());
			pstm.setString(2, s.getS_number());
			pstm.setString(3, s.getS_identity());
			pstm.setString(4, s.getS_password());
			pstm.setString(5, s.getS_sex());
			pstm.setString(6, s.getS_Birthdate());
			pstm.setString(7, s.getS_portrait());
			
			pstm.setInt(8, s.getC_id().getC_id()); //ClassInfo
			
			
			pstm.setInt(9, s.getS_id());
//update student set s_name=?,s_number=?,s_identity=?,s_password=?,s_sex=?,s_Birthdate=?,s_portrait=?,c_id=? where s_id=?";
			
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
	 * 查询 学生列表
	 * @param
	 * @return ArrayList<StudentInfo>
	 */
	public ArrayList<StudentInfo> SelectStudents() {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		ArrayList<StudentInfo> list = new ArrayList<StudentInfo>();
		StudentInfo s=null;
		try {
			conn = DruidDBPoolUtil.getConnection();
			pstm = conn.prepareStatement(SELECTSQL);

			// 执行查询
			rs = pstm.executeQuery();
			while(rs.next()){
				 s=new StudentInfo();
				s.setS_id(rs.getInt("s_id"));
				s.setS_name(rs.getString("s_name"));
				s.setS_password(rs.getString("s_password"));
				s.setS_portrait(rs.getString("s_portrait"));
				s.setS_Birthdate(rs.getString("s_Birthdate"));
				s.setS_identity(rs.getString("s_identity"));
				s.setS_number(rs.getString("s_number"));
				s.setS_sex(rs.getString("s_sex"));
				
				ClassInfo c=new ClassInfo();
				c.setC_id(rs.getInt("c_id"));
				s.setC_id(c);
				
				list.add(s);
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
	 * 查询学生详情
	 * 根据学生id查询单个学生信息
	 * @param id
	 * @return StudentInfo
	 */
	public StudentInfo getGoodsByGoodsId(int id) {
		Connection conn = null;
		PreparedStatement pstm= null;
		ResultSet rs = null;
		
		StudentInfo s = null;
		String sql = "select * from student where s_id=?";

		try {
			conn =DruidDBPoolUtil.getConnection();
			pstm = conn.prepareStatement(sql);
			// 执行查询
			rs = pstm.executeQuery();
			
			while (rs.next()) {
				s =new StudentInfo();
				s.setS_id(rs.getInt("s_id"));
				s.setS_name(rs.getString("s_name"));
				s.setS_password(rs.getString("s_password"));
				s.setS_portrait(rs.getString("s_portrait"));
				s.setS_Birthdate(rs.getString("s_Birthdate"));
				s.setS_identity(rs.getString("s_identity"));
				s.setS_number(rs.getString("s_number"));
				s.setS_sex(rs.getString("s_sex"));
				
				ClassInfo c=new ClassInfo();
				c.setC_id(rs.getInt("c_id"));
				s.setC_id(c);
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
		return s;
	}
	
	/**
	 * 添加学生信息
	 * @param StudentInfo
	 * @return boolean
	 */
	public boolean addGoodsByGoodsInfo(StudentInfo s) {
		Connection conn = null;
		PreparedStatement pstm = null;
		
		try {
			conn = DruidDBPoolUtil.getConnection();
			pstm = conn.prepareStatement(INSERTSQL);
			
			pstm.setInt(1, s.getS_id());
			pstm.setString(2, s.getS_name());
			pstm.setString(3, s.getS_number());
			pstm.setString(4, s.getS_identity());
			pstm.setString(5, s.getS_password());
			pstm.setString(6, s.getS_sex());
			pstm.setString(7, s.getS_Birthdate());
			pstm.setString(8, s.getS_portrait());
			
			pstm.setInt(9, s.getC_id().getC_id()); //ClassInfo
            //(s_id,s_name,s_number,s_identity,s_password,s_sex,s_Birthdate,s_portrait,c_id) ;

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
	 * 导入学生
	 * 
	 * 学生批量操作方法
	 * 
	 *   pstm.addBatch();
	 *   
	 *   pstm.executeBatch(); 
	 *   
	 * @param List<StudentInfo> 需要添加的批量的学生
	 * @throws SQLException
	 */
	public void  batchAddStudent(List<StudentInfo> stu) {
	    Connection connection= DruidDBPoolUtil.getConnection();
		PreparedStatement pstm;
		try {
			pstm = connection.prepareStatement(INSERTSQL);
			 for (StudentInfo student : stu) {
					pstm.setInt(1, student.getS_id());
					pstm.setString(2, student.getS_name());
					pstm.setString(3, student.getS_number());
					pstm.setString(4, student.getS_identity());
					pstm.setString(5, student.getS_password());
					pstm.setString(6, student.getS_sex());
					pstm.setString(7, student.getS_Birthdate());
					pstm.setString(8, student.getS_portrait());
					
					pstm.setInt(9, student.getC_id().getC_id()); //ClassInfo
			    	//添加到批量的操作
			    	pstm.addBatch();
				}
			    //批量执行操作
			    pstm.executeBatch(); 
			    
			    pstm.clearBatch();//关闭批量操作
			    pstm.close();
			    connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   
		
	}
	/**
	 * 登陆
	 *  @param 账号、密码
	 * @return 登录成功返回用户信息，登录失败返回null
	 */
	public StudentInfo validateLogin(StudentInfo loginUser) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		StudentInfo s = null;
		String sql = "SELECT * FROM student s INNER JOIN class c ON s.c_id=c.c_id WHERE s.s_number=? AND s.s_password=?;";
		
		try {
			conn = DruidDBPoolUtil.getConnection();
			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, loginUser.getS_number());
			pstm.setString(2, loginUser.getS_password());
	
			// 执行查询
			rs = pstm.executeQuery();
	
			if (rs.next()) {
				s = new StudentInfo();
				s.setS_id(rs.getInt("s_id"));
				s.setS_Birthdate(rs.getString("s_Birthdate"));
				s.setS_identity(rs.getString("s_identity"));
				s.setS_name(rs.getString("s_name"));
				s.setS_number(rs.getString("s_number"));
				s.setS_password(rs.getString("s_password"));
				s.setS_portrait(rs.getString("s_portrait"));
				s.setS_sex(rs.getString("s_sex"));
				
				ClassInfo c=new ClassInfo();
				c.setC_id(rs.getInt("c_id"));
				c.setC_name(rs.getString("c_name"));
				
				s.setC_id(c);
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
		
		return s;
	}
	
    
}
