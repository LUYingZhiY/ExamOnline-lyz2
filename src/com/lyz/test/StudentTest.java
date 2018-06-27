package com.lyz.test;



import java.util.Date;

import org.junit.Test;

import com.lyz.dao.StudentDao;


public class StudentTest {
	
	StudentDao sDao=new StudentDao();
	@Test
	public void StudentDaoTest(){
		sDao.removeStudent(1);
	}
	
	public static void main(String[] args) {
		Date d=new Date();
		System.out.println(d);
		System.out.println(String.valueOf(System.currentTimeMillis()));
	}

}


