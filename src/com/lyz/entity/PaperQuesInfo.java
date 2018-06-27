package com.lyz.entity;

/**
 * 试卷-题关系表(paper_ques)
 * 实体类
 * @author Administrator
 *
 */
public class PaperQuesInfo {
private int pq_id;
private PagerInfo p_id;
private QuesInfo q_id;

public int getPq_id() {
	return pq_id;
}
public void setPq_id(int pq_id) {
	this.pq_id = pq_id;
}
public PagerInfo getP_id() {
	return p_id;
}
public void setP_id(PagerInfo p_id) {
	this.p_id = p_id;
}
public QuesInfo getQ_id() {
	return q_id;
}
public void setQ_id(QuesInfo q_id) {
	this.q_id = q_id;
}

}
