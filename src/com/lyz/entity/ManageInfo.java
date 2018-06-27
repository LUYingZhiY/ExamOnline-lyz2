package com.lyz.entity;

public class ManageInfo {
	private int m_id; //管理员id
	private String m_account;//管理员账号
	private String m_password;//管理员密码
	private String m_sex;//管理员性别
	private String m_portrait;//管理员头像
	
	public ManageInfo() {
	}
	public ManageInfo(String m_account,String m_password) {
		this.m_account = m_account;
		this.m_password = m_password;
	}
	
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_account() {
		return m_account;
	}
	public void setM_account(String m_account) {
		this.m_account = m_account;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_sex() {
		return m_sex;
	}
	public void setM_sex(String m_sex) {
		this.m_sex = m_sex;
	}
	public String getM_portrait() {
		return m_portrait;
	}
	public void setM_portrait(String m_portrait) {
		this.m_portrait = m_portrait;
	}
	

}
