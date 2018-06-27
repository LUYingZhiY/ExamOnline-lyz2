package com.lyz.entity;
/**
 * 试卷表(实体类)
 * @author Administrator
 *
 */
public class PagerInfo {
private int p_id;
private String p_name;//试卷标题
private String p_description;//试卷描述
private String p_type; //试卷类型（科目）

public int getP_id() {
	return p_id;
}
public void setP_id(int p_id) {
	this.p_id = p_id;
}
public String getP_name() {
	return p_name;
}
public void setP_name(String p_name) {
	this.p_name = p_name;
}
public String getP_description() {
	return p_description;
}
public void setP_description(String p_description) {
	this.p_description = p_description;
}
public String getP_type() {
	return p_type;
}
public void setP_type(String p_type) {
	this.p_type = p_type;
}


}
