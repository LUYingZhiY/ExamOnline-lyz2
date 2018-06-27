package com.lyz.entity;

import java.sql.Date;

/**
 * 学生实体类
 * @author Administrator
 *
 */
public class StudentInfo {
  private int s_id; //学生标识
  private String s_name; //学生姓名
  private String s_number; //学号
  private String s_identity; //身份证号
  private String s_password; //学生密码
  private String s_sex; //性别
  private String s_Birthdate; //出生日期
  private String s_portrait; //头像
  
  private ClassInfo c_id;//班级标识

	public StudentInfo() {
	}
	public StudentInfo(String s_number,String s_password) {
		this.s_number = s_number;
		this.s_password = s_password;
	}
  
  
public int getS_id() {
	return s_id;
}
public void setS_id(int s_id) {
	this.s_id = s_id;
}
public String getS_name() {
	return s_name;
}
public void setS_name(String s_name) {
	this.s_name = s_name;
}
public String getS_number() {
	return s_number;
}
public void setS_number(String s_number) {
	this.s_number = s_number;
}
public String getS_identity() {
	return s_identity;
}
public void setS_identity(String s_identity) {
	this.s_identity = s_identity;
}
public String getS_password() {
	return s_password;
}
public void setS_password(String s_password) {
	this.s_password = s_password;
}
public String getS_sex() {
	return s_sex;
}
public void setS_sex(String s_sex) {
	this.s_sex = s_sex;
}
public String getS_Birthdate() {
	return s_Birthdate;
}
public void setS_Birthdate(String sBirthdate) {
	this.s_Birthdate = sBirthdate;
}
public String getS_portrait() {
	return s_portrait;
}
public void setS_portrait(String s_portrait) {
	this.s_portrait = s_portrait;
}
public ClassInfo getC_id() {
	return c_id;
}
public void setC_id(ClassInfo c_id) {
	this.c_id = c_id;
}

  
  

}
