package com.lyz.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.lyz.entity.StudentInfo;

/**
 * 学生信息的导入导出
 * @author Administrator
 *
 */
public class StudentExcel {
	
	/**
	 * 读取学生信息（来自Excel表）
	 * @return List
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @throws InvalidFormatException
	 */
	public  static 	List<StudentInfo> readExcel() throws FileNotFoundException, IOException, InvalidFormatException{
		
		List<StudentInfo> students=new ArrayList<StudentInfo>();
		
		
		File file=new File("C:\\Users\\Administrator\\Desktop\\test.xlsx");
		
		String fileName=file.getName();
		
		String exTypeString=fileName.substring(fileName.lastIndexOf(".")+1);
		
		System.out.println(fileName+":"+exTypeString);
		
		Workbook workbook=null;
		
		//根据后缀进行响应API调用操作
		if ("xls".equals(exTypeString)) {
			workbook=new HSSFWorkbook(new FileInputStream(file)); ////创建工作空间
		}else{
			workbook=new XSSFWorkbook(file);
		}
		
		
		Sheet  sheet=workbook.getSheet("user");////获取具体的工作单元
		
		int first=sheet.getFirstRowNum();//获取第一行
		int last=sheet.getLastRowNum();// 获取最后一行
		
		for(int i=1;i<=last;i++){
			
			Row row=sheet.getRow(i);
			
//			row.getPhysicalNumberOfCells(); //获取行具体有多少列(获取实际列)
			
			Cell idCell=row.getCell(0);
			//  可以通过cell 提供的具体方式获取单元格内容(getStringCellValue(),getNumericCellValue())
//			System.out.println(idCell.getCellType()+":"+idCell.getNumericCellValue());
			
			//数据格式化
			DataFormatter dataFormatter=new DataFormatter();
			
			String idvalue=dataFormatter.formatCellValue(idCell);
			System.out.println(idvalue);
			
			StudentInfo  student=new StudentInfo();
			student.setS_id(new Integer(idvalue));
			
			
			students.add(student);
		}
		return students;
	}
	
	/**
	 * 创建excel的方法
	 * @param StudentInfo
	 * @throws Exception
	 */
	public void createStudentExcel(List<StudentInfo> stuInfo){
		
		XSSFWorkbook  workbook=new XSSFWorkbook();//创建
		
		Sheet sheet=workbook.createSheet("user");
		
		//标题
	   Row rowHeader=sheet.createRow(0);
		
	   //表的列名
	   Cell idHeaderCell=rowHeader.createCell(0);
	   idHeaderCell.setCellValue("id");
	  /* Cell nameHeaderCell=rowHeader.createCell(1);
	   nameHeaderCell.setCellValue("name");
	   Cell sexHeaderCell=rowHeader.createCell(2);
	   sexHeaderCell.setCellValue("sex");
	   Cell nameHeaderCell2=rowHeader.createCell(3);
	   nameHeaderCell2.setCellValue("name");
	   Cell nameHeaderCell3=rowHeader.createCell(4);
	   nameHeaderCell3.setCellValue("name");*/
	   
	   //数据操作
	  List<StudentInfo> students=stuInfo;
	 // System.out.println(students.get(1));
	  
	  for (int i = 0; i < students.size(); i++) {
		  //depositeInfo student=students.get(i);
		  Row stuRow= sheet.createRow(i+1);
		  
		  Cell idCell=stuRow.createCell(0);
		   idCell.setCellValue(students.get(i).getS_id());
		  // System.out.println(students.get(i).getD_id());
		   
		  Cell idCell2=stuRow.createCell(1);
		  idCell2.setCellValue(students.get(i).getS_name());
		  
	  	}
			try {
				//Excel文件保存路径
			   FileOutputStream fileOutputStream = new FileOutputStream("F:\\stu.xlsx");
			   
			   workbook.write(fileOutputStream);
			   fileOutputStream.close();//关闭
				System.out.println("创建Execl成功");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

}
