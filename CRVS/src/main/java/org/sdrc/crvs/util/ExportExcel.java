package org.sdrc.crvs.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.sdrc.crvs.model.UtDataModel;
import org.sdrc.crvs.service.DashboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ExportExcel {
	
	@Autowired
	private DashboardService dashboardService;
	
	@Autowired
	private ServletContext context;

	public String createExcel(String areaId, String indicatorId, String sourceId, String timePeriodId, Integer childLevel,
			String indicatorName, String source, String timePeriod) throws IOException{
		
		FileInputStream inputStream = new FileInputStream(context.getRealPath(ResourceBundle.getBundle("spring/app").getString("crvs.xls.filepath")));
		
		XSSFWorkbook xssfWorkbook = new XSSFWorkbook(inputStream);
		
		XSSFSheet sheet = xssfWorkbook.getSheetAt(0);
		
		List<UtDataModel> utDataModelList;
		utDataModelList = dashboardService.fetchPdfData(indicatorId, sourceId, areaId, timePeriodId, childLevel);
		
		XSSFCellStyle cellStyle = xssfWorkbook.createCellStyle();
		cellStyle.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
		cellStyle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
		cellStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		cellStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		
		XSSFRow row = sheet.createRow(0);
		XSSFCell cell = row.createCell(0);
		cell.setCellValue("Chhattisgarh");
		cell.setCellStyle(cellStyle);
		cell = row.createCell(1);
		cell.setCellValue("INDICATOR : "+indicatorName);
		cell.setCellStyle(cellStyle);
		cell = row.createCell(2);
		cell.setCellValue("SOURCE : "+source);
		cell.setCellStyle(cellStyle);
		cell = row.createCell(3);
		cell.setCellValue("TIMEPERIOD : "+timePeriod);
		cell.setCellStyle(cellStyle);
		
		XSSFCellStyle cellStyle2 = xssfWorkbook.createCellStyle();
		cellStyle2.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
		cellStyle2.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		cellStyle2.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		cellStyle2.setFillForegroundColor(HSSFColor.GREY_40_PERCENT.index);
		cellStyle2.setBorderRight(XSSFCellStyle.BORDER_THIN);
		cellStyle2.setBorderTop(XSSFCellStyle.BORDER_THIN);
		
		row = sheet.createRow(1);
		
		cell = row.createCell(0);
		cell.setCellValue("SL NO");
		cell.setCellStyle(cellStyle2);
		
		cell = row.createCell(1);
		cell.setCellValue("AREA NAME");
		cell.setCellStyle(cellStyle2);
		
		cell = row.createCell(2);
		cell.setCellValue("DATA VALUE");
		cell.setCellStyle(cellStyle2);
		
		cell = row.createCell(3);
		cell.setCellValue("RANK");
		cell.setCellStyle(cellStyle2);
		
		sheet.createFreezePane(0, 2);
		
		XSSFCellStyle cellStyle3 = xssfWorkbook.createCellStyle();
		cellStyle3.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		cellStyle3.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		cellStyle3.setBorderTop(XSSFCellStyle.BORDER_THIN);
		cellStyle3.setBorderRight(XSSFCellStyle.BORDER_THIN);
		cellStyle3.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		
		XSSFCellStyle cellStyle4 = xssfWorkbook.createCellStyle();
		cellStyle4.setAlignment(XSSFCellStyle.ALIGN_LEFT);
		cellStyle4.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		cellStyle4.setBorderTop(XSSFCellStyle.BORDER_THIN);
		cellStyle4.setBorderRight(XSSFCellStyle.BORDER_THIN);
		cellStyle4.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		
		int count = 0;
		for ( int r = 2 ; r <= utDataModelList.size(); r++) {
			count++;
			XSSFRow rowVal = sheet.createRow(r);
			for(int c = 0 ; c < 4 ; c++){
				cell = rowVal.createCell(c);
				
				if(c==0){
					cell.setCellValue(count);
					cell.setCellStyle(cellStyle3);
				}
				else if(c==1){
					cell.setCellValue(utDataModelList.get(r-2).getAreaName());
					cell.setCellStyle(cellStyle4);
				}
				else if(c==2){
					cell.setCellValue(new Double(utDataModelList.get(r-2).getValue()).intValue());
					cell.setCellStyle(cellStyle3);
				}
				else{
					cell.setCellValue(utDataModelList.get(r-2).getRank());
					cell.setCellStyle(cellStyle3);
				}
				
			}
		}
		String fileName = ResourceBundle.getBundle("spring/app").getString("crvs.jpgimage.path")+"/CRVS_"+new Date().getTime()+".xlsx";
		FileOutputStream outputStream = new FileOutputStream(
				new File(fileName));
		xssfWorkbook.getSheetAt(0).autoSizeColumn(1, true);
		xssfWorkbook.getSheetAt(0).autoSizeColumn(2, true);
		xssfWorkbook.getSheetAt(0).autoSizeColumn(3, true);
		xssfWorkbook.write(outputStream);
		outputStream.close();
		return fileName;
	}
}
