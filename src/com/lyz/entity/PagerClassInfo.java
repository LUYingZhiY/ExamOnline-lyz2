package com.lyz.entity;


/**
 * 分配试卷考试(pager_class)
 * 实体类
 * @author Administrator
 *
 */
public class PagerClassInfo {
	private int pc_id;
	private String pc_title;//考试类型/说明（测试、第..）
	private ClassInfo c_id;//班级id
	private PagerInfo p_id;//试卷id
	private String startTime;//开始时间
	private String endTime;//结束时间
	
	public int getPc_id() {
		return pc_id;
	}
	public void setPc_id(int pc_id) {
		this.pc_id = pc_id;
	}
	public String getPc_title() {
		return pc_title;
	}
	public void setPc_title(String pc_title) {
		this.pc_title = pc_title;
	}
	public ClassInfo getC_id() {
		return c_id;
	}
	public void setC_id(ClassInfo c_id) {
		this.c_id = c_id;
	}
	public PagerInfo getP_id() {
		return p_id;
	}
	public void setP_id(PagerInfo p_id) {
		this.p_id = p_id;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	

}
