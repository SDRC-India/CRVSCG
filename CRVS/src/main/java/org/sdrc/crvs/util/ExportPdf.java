package org.sdrc.crvs.util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;

import org.apache.commons.codec.binary.Base64;
import org.sdrc.crvs.model.DashboardExport;
import org.sdrc.crvs.model.UtDataCollection;
import org.sdrc.crvs.model.UtDataModel;
import org.sdrc.crvs.service.DashboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.html.WebColors;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPTableEvent;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * @author Sarita
 * 
 */
@Component
public class ExportPdf implements PdfPTableEvent {
	@Autowired
	private DashboardService dashboardService;
	@Autowired
	private ServletContext context;
	public String createPdf(String topBottomimg, String legendimg, DashboardExport dashboardExport) throws IOException{
		
//		this.context = context;
//		this.dashboardService = dashboardService;
		String area = dashboardExport.getArea();
		String indicator = dashboardExport.getIndicator();
		String source = dashboardExport.getSource();
		String timePeriod = dashboardExport.getTimePeriod();
		String imgPath = dashboardExport.getImgPath();
//		top3 bottom3
		topBottomimg = topBottomimg.split(",")[1];
		byte[] decodedImage = Base64.decodeBase64(topBottomimg);
		
		//legend
		legendimg = legendimg.split(",")[1];
		byte[] decodelegendimg = Base64.decodeBase64(legendimg);
		String filepath="";

		try {
		
			Document document = new Document(PageSize.A4.rotate());
			filepath = ResourceBundle.getBundle("spring/app").getString("crvs.jpgimage.path");
			filepath=filepath+"/"+area+".pdf";
			PdfWriter writer = PdfWriter.getInstance(document,
					new FileOutputStream(filepath));
			
			// wiring up header footer event
			
			Font small = new Font(Font.FontFamily.HELVETICA, 10);
			HeaderFooter event = new HeaderFooter(context);
			writer.setPageEvent(event); // wiring up header footer event

			document.open();
			
			Font font = FontFactory.getFont("HELVETICA", 14);
			Font font1 = FontFactory.getFont("HELVETICA");
			Paragraph paragraph = new Paragraph();
			paragraph.setFont(small);
			paragraph.setSpacingAfter(20);
//			Chunk datechunk = new Chunk("Printed on: "+CommonUtility.currentDate());
//			paragraph.add(datechunk);
//SansSerif Times-Roman
			
			Paragraph paragraph1 = new Paragraph();
			paragraph1.setAlignment(Element.ALIGN_LEFT);
			paragraph1.setSpacingAfter(2);
			Chunk chunk1 = new Chunk("" + indicator + ", " + area, font);
			paragraph1.add(chunk1);
			
			Paragraph paragraph2 = new Paragraph();
			paragraph2.setAlignment(Element.ALIGN_LEFT);
			paragraph2.setSpacingAfter(2);
			Chunk chunk2 = new Chunk("" + timePeriod + ", " + source, font1);
		//	System.out.println("source name====>" +source);
			paragraph2.add(chunk2);
			
//			PdfContentByte cb = writer.getDirectContent();
//			cb.moveTo(0, 480);
//			cb.lineTo(900,480);
//			cb.stroke();
//			
			Image image = Image.getInstance(imgPath);
			int indentation = 0;
			float scaler = ((document.getPageSize().getWidth()
					- document.leftMargin() - document.rightMargin() - indentation) / image
					.getWidth()) * 130;
				image.scalePercent(scaler);
				image.setAbsolutePosition(-50, 80);
			
			
			Image image1 = Image.getInstance(decodedImage);
			int indentation1 = 0;
			float scaler1 = ((document.getPageSize().getWidth()
					- document.leftMargin() - document.rightMargin() - indentation1) / image1
					.getWidth()) * 18;
			image1.scalePercent(scaler1);
			image1.setAbsolutePosition(40, 80);
			
			
			Image image2 = Image.getInstance(decodelegendimg);
			int indentation2 = 0;
			float scaler2 = ((document.getPageSize().getWidth()
					 - document.rightMargin() - indentation2) / image2
					.getWidth()) * 18;
			image2.setAbsolutePosition(660, 80);
			image2.scalePercent(scaler2);
			
			Image image3 = Image.getInstance(context
					.getRealPath("resources\\images\\north_arrow_new.png"));
			int indentation3 = 0;
			float scaler3 = ((document.getPageSize().getWidth()
					 - document.rightMargin() - indentation3) / image3
					.getWidth() * 3);
			image3.setAbsolutePosition(780, 255);
			image3.scalePercent(scaler3);

			PdfPTable table = createTable(dashboardExport, document);
			
			document.add(paragraph);
			document.add(paragraph1);
			document.add(paragraph2);

			document.add(image);
			document.add(image1);
			document.add(image2);
			document.add(image3);
			
			document.add(Chunk.NEWLINE);
			document.add(Chunk.NEWLINE);
			document.add(Chunk.NEWLINE);
			document.add(Chunk.NEWLINE);
			document.add(Chunk.NEXTPAGE);
			document.add(table);
			 
			document.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filepath;
		
	}
	public PdfPTable createTable(DashboardExport dashboardExport, Document document) throws DocumentException{
		
		String areaId = dashboardExport.getAreaId();
		String indicatorId = dashboardExport.getIndicatorId();
		String sourceId= dashboardExport.getSourceId();
		String timePeriodId = dashboardExport.getTimePeriodId();
		Integer childLevel = dashboardExport.getChildLevel();
		PdfPTable table = new PdfPTable(4);
		List<UtDataModel> utDataModelList;
		utDataModelList = dashboardService.fetchPdfData(indicatorId, sourceId, areaId, timePeriodId, childLevel);


float[] columnWidths = new float[] { 10f, 40f, 20f, 20f };
table.setWidths(columnWidths);

BaseFont bf;
try {
		bf = BaseFont.createFont(
				context.getRealPath("resources\\fonts\\calibri.ttf"),
				BaseFont.WINANSI, false);
} catch (Exception ex) {
		bf = null;
}

Font bigBold = new Font(Font.FontFamily.HELVETICA, 10, Font.BOLD);
Font small = new Font(Font.FontFamily.HELVETICA, 10);
if (bf != null) {
		bigBold = new Font(bf, 10, Font.BOLD);
		small = new Font(bf, 10);
}

      
PdfPCell cell2 = new PdfPCell(new Paragraph("SL NO", bigBold));
cell2.setBackgroundColor(BaseColor.LIGHT_GRAY); 
PdfPCell cell3 = new PdfPCell(new Paragraph("AREA NAME", bigBold));
cell3.setBackgroundColor(BaseColor.LIGHT_GRAY);
PdfPCell cell4 = new PdfPCell(new Paragraph("DATA VALUE", bigBold));
cell4.setBackgroundColor(BaseColor.LIGHT_GRAY);
PdfPCell cell5 = new PdfPCell(new Paragraph("RANK", bigBold));
cell5.setBackgroundColor(BaseColor.LIGHT_GRAY);

table.addCell(cell2);
table.addCell(cell3);
table.addCell(cell4);
table.addCell(cell5);

UtDataModel temp = new UtDataModel();
System.out.println(utDataModelList.size() + "----size utDataModel");

int n = utDataModelList.size();
int i,j;
for(i=0; i<n-1; i++)
{
		for(j=i+1; j<n; j++)
		{
			if(utDataModelList.get(i).getAreaName().compareTo(utDataModelList.get(j).getAreaName()) > 0){
				temp=utDataModelList.get(i);
				utDataModelList.set(i, utDataModelList.get(j));
				utDataModelList.set(j, temp);
			}
		}
}

BaseColor mycolor = WebColors.getRGBColor("#E0E0E0");

int count=0;
if (utDataModelList != null && utDataModelList.size() > 0) {

		for (UtDataModel utDataModel : utDataModelList) {	
			boolean evenrow;
			count++;
			evenrow = (count%2 == 0) ? true : false;
			
			PdfPCell utData2 = new PdfPCell(new Paragraph(
					""+count, small));
			if(evenrow)
				utData2.setBackgroundColor(mycolor);
			PdfPCell utData3 = new PdfPCell(new Paragraph(
					utDataModel.getAreaName(), small));
			if(evenrow)
				utData3.setBackgroundColor(mycolor);
		
			PdfPCell utData4 = new PdfPCell(new Paragraph(
					utDataModel.getValue(), small));
			if(evenrow)
				utData4.setBackgroundColor(mycolor);
			PdfPCell utData5 = new PdfPCell(new Paragraph(
					utDataModel.getRank(), small));
			if(evenrow)
				utData5.setBackgroundColor(mycolor);

			
			table.addCell(utData2);
			table.addCell(utData3);
			table.addCell(utData4);
			table.addCell(utData5);
			
				}
			}
		return table;
	}
	@Override
	public void tableLayout(PdfPTable table, float[][] widths, float[] heights,
			int headerRows, int rowStart, PdfContentByte[] canvases) {
		// TODO Auto-generated method stub
		
	}
}
