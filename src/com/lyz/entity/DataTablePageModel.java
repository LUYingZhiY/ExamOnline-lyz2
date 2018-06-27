package com.lyz.entity;

import java.util.List;

/**
 * 
 * 基于dataTable格式的分页模型
 * 
 * 
 * {
    "draw": 1,
    "recordsTotal": 57,
    "recordsFiltered": 57,
    "data": [
        [
            "Angelica",
            "Ramos",
            "System Architect",
            "London",
            "9th Oct 09",
            "$2,875"
        ],
        [
            "Ashton",
            "Cox",
            "Technical Author",
            "San Francisco",
            "12th Jan 09",
            "$4,800"
        ],
        ...
    ]
}
 * 
 * @author Administrator
 *
 * @param <T>
 */
public class DataTablePageModel<T> {
	
	private int draw;
	
	private int recordsTotal;
	
	private int recordsFiltered;
	
	private List<T> data;
	
	private String html;//页面html相关代码

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public int getRecordsTotal() {
		return recordsTotal;
	}

	public void setRecordsTotal(int recordsTotal) {
		this.recordsTotal = recordsTotal;
	}

	public int getRecordsFiltered() {
		return recordsFiltered;
	}

	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public String getHtml() {
		return html;
	}

	public void setHtml(String html) {
		this.html = html;
	}

}
