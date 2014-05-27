package com.find1x.gpms.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

/**
 * 操作Excel表格的功能类
 * 
 * @author：hnylj
 * @version 1.0
 */
public class ExcelPOI {


	/**
	 * 读取Excel表格表头的内容
	 * 
	 * @param InputStream
	 * @return String 表头内容的数组
	 * 
	 */

	/**
	 * 读取Excel数据内容
	 * 
	 * @param InputStream
	 * @return Map 包含单元格数据内容的Map对象
	 */
	public static boolean readStudentContent(String url) {
		String name;
		String sex;
		String no;
		String classno;
		String department;
		String specialty;
		String telephone;
		String email;
		String teacher;
		try {
			HSSFRow row;
			InputStream is = new FileInputStream(url);
			POIFSFileSystem fs = new POIFSFileSystem(is);
			HSSFWorkbook wb = new HSSFWorkbook(fs);
			HSSFSheet sheet = wb.getSheetAt(0);
			// 得到总行数
			int rowNum = sheet.getLastRowNum();
			row = sheet.getRow(0);
			int colNum = row.getPhysicalNumberOfCells();
			// 正文内容应该从第二行开始,第一行为表头的标题
			for (int i = 1; i <= rowNum; i++) {
				row = sheet.getRow(i);
				// int j = 0;
				// while (j<colNum) {}
				no = getStringCellValue(row.getCell((short) 0)).trim();
				name = getStringCellValue(row.getCell((short) 1)).trim();
				sex = getStringCellValue(row.getCell((short) 2)).trim();
				classno = getStringCellValue(row.getCell((short) 3)).trim();
				department = getStringCellValue(row.getCell((short) 4)).trim();
				specialty = getStringCellValue(row.getCell((short) 5)).trim();
				telephone = getStringCellValue(row.getCell((short) 6)).trim();
				email = getStringCellValue(row.getCell((short) 7)).trim();
				StudentDAO.createUser(StudentDAO.addStudent
						(no, name, sex, classno, department, specialty, telephone, email), no);
			}
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean readTeacherContent(String url) {
		String name;
		String sex;
		String no;
		String department;
		String telephone;
		String email;
		String postion;
		
		try {
			HSSFRow row;
			InputStream is = new FileInputStream(url);
			POIFSFileSystem fs = new POIFSFileSystem(is);
			HSSFWorkbook wb = new HSSFWorkbook(fs);
			HSSFSheet sheet = wb.getSheetAt(0);
			// 得到总行数
			int rowNum = sheet.getLastRowNum();
			row = sheet.getRow(0);
			int colNum = row.getPhysicalNumberOfCells();
			// 正文内容应该从第二行开始,第一行为表头的标题
			for (int i = 1; i <= rowNum; i++) {
				row = sheet.getRow(i);
				// int j = 0;
				// while (j<colNum) {}
				no = getStringCellValue(row.getCell((short) 0)).trim();
				name = getStringCellValue(row.getCell((short) 1)).trim();
				sex = getStringCellValue(row.getCell((short) 2)).trim();
				department = getStringCellValue(row.getCell((short) 3)).trim();
				telephone = getStringCellValue(row.getCell((short) 4)).trim();
				email = getStringCellValue(row.getCell((short) 5)).trim();
				postion = getStringCellValue(row.getCell((short) 6)).trim();

				TeacherDAO.createUser(TeacherDAO.addTeacher
						(no, name, sex, department, telephone, email, postion), no ,postion);
			}
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * 获取单元格数据内容为字符串类型的数据
	 * 
	 * @param cell
	 *            Excel单元格
	 * @return String 单元格数据内容
	 */
	private static String getStringCellValue(HSSFCell cell) {
		String strCell = "";
		switch (cell.getCellType()) {
		case HSSFCell.CELL_TYPE_STRING:
			strCell = cell.getStringCellValue();
			break;
		case HSSFCell.CELL_TYPE_NUMERIC:
			strCell = String.valueOf(cell.getNumericCellValue());
			break;
		case HSSFCell.CELL_TYPE_BOOLEAN:
			strCell = String.valueOf(cell.getBooleanCellValue());
			break;
		case HSSFCell.CELL_TYPE_BLANK:
			strCell = "";
			break;
		default:
			strCell = "";
			break;
		}
		if (strCell.equals("") || strCell == null) {
			return "";
		}
		if (cell == null) {
			return "";
		}
		return strCell;
	}

	/**
	 * 获取单元格数据内容为日期类型的数据
	 * 
	 * @param cell
	 *            Excel单元格
	 * @return String 单元格数据内容
	 */
	private String getDateCellValue(HSSFCell cell) {
		String result = "";
		try {
			int cellType = cell.getCellType();
			if (cellType == HSSFCell.CELL_TYPE_NUMERIC) {
				Date date = cell.getDateCellValue();
				result = (date.getYear() + 1900) + "-" + (date.getMonth() + 1)
						+ "-" + date.getDate();
			} else if (cellType == HSSFCell.CELL_TYPE_STRING) {
				String date = getStringCellValue(cell);
				result = date.replaceAll("[年月]", "-").replace("日", "").trim();
			} else if (cellType == HSSFCell.CELL_TYPE_BLANK) {
				result = "";
			}
		} catch (Exception e) {
			System.out.println("日期格式不正确!");
			e.printStackTrace();
		}
		return result;
	}
}