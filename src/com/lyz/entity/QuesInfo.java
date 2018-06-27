package com.lyz.entity;

/**
 * 题库（实体类）
 * @author Administrator
 *
 */
public class QuesInfo {
	private int q_id;
	private String q_type;//类型（单选、、、）
	private String q_content;//题目
	private String a;//选项a
	private String b;//选项b
	private String c;//选项c
	private String d;//选项d
	private String ans; //正确答案
	
	
	public int getQ_id() {
		return q_id;
	}
	public void setQ_id(int q_id) {
		this.q_id = q_id;
	}
	public String getQ_type() {
		return q_type;
	}
	public void setQ_type(String q_type) {
		this.q_type = q_type;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getA() {
		return a;
	}
	public void setA(String a) {
		this.a = a;
	}
	public String getB() {
		return b;
	}
	public void setB(String b) {
		this.b = b;
	}
	public String getC() {
		return c;
	}
	public void setC(String c) {
		this.c = c;
	}
	public String getD() {
		return d;
	}
	public void setD(String d) {
		this.d = d;
	}
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
	}
	public QuesInfo(int q_id, String q_type, String q_content, String a, String b, String c, String d, String ans) {
		super();
		this.q_id = q_id;
		this.q_type = q_type;
		this.q_content = q_content;
		this.a = a;
		this.b = b;
		this.c = c;
		this.d = d;
		this.ans = ans;
	}
	public QuesInfo() {
	}
	

}
