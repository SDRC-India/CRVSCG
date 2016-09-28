package org.sdrc.crvs.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.sdrc.crvs.model.DashboardExport;
import org.sdrc.crvs.model.MapSvg;
import org.sdrc.crvs.util.ExportExcel;
import org.sdrc.crvs.util.ExportPdf;
import org.sdrc.crvs.util.ImageEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ExportController  {

	@Autowired
	private ExportPdf exportPdf;

	@Autowired
	private ExportExcel exportExcel;
	
	@RequestMapping(value = "/exportToPdf", method = RequestMethod.POST)
	@ResponseBody
	public String exportToPdf(@RequestParam("imageTopBottomBase64") String topBottomimg,@RequestParam("imageLegendBase64") String legendimg,
			DashboardExport dashboardExport)
			throws IOException {
		
		try {
			String fileName=exportPdf.createPdf( topBottomimg,  legendimg,  dashboardExport);
			return fileName;
		} catch (FileNotFoundException e) {
			return "failure";
		} catch (IOException e) {
			e.printStackTrace();
			return "failure";
		}
		
	}
	
	@RequestMapping(value = "/downloadPDF", method = RequestMethod.POST)
	public void downLoad(@RequestParam("fileName") String name, HttpServletResponse response)
			throws IOException {
		
		java.io.InputStream inputStream;
		try {
			String fileName=name.replaceAll("%3A", ":").replaceAll("%2F", "/").replaceAll("\\+", " ").replaceAll("%2C",",");
			inputStream = new FileInputStream(fileName);
			String headerKey = "Content-Disposition";
			String headerValue = String.format("attachment; filename=\"%s\"",
					new java.io.File(fileName).getName());
			response.setHeader(headerKey, headerValue);
			response.setContentType("pdf");
			ServletOutputStream outputStream = response.getOutputStream();
			FileCopyUtils.copy(inputStream, outputStream);
			outputStream.close();
			new File(fileName).delete();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	@RequestMapping(value = "/api/exportToExcel", method = RequestMethod.GET)
	@ResponseBody
	public String exportToExcel(@RequestParam("areaId") String areaId,
			@RequestParam("indicatorId") String indicatorId,
			@RequestParam("sourceId") String sourceId,
			@RequestParam("timePeriodId") String timePeriodId,
			@RequestParam("childLevel") int childLevel,
			@RequestParam("indicatorName") String indicatorName,
			@RequestParam("source") String source,
			@RequestParam("timePeriod") String timePeriod) throws IOException {
		
		return exportExcel.createExcel(areaId, indicatorId, sourceId, timePeriodId, childLevel, indicatorName, source, timePeriod);
	}
	
	@RequestMapping(value = "/exportImage", method = RequestMethod.POST)
	@ResponseBody
	public String makeSvgToImage(@RequestParam("infoMap") String mapSvgs ) throws Exception {
		int cnt = 1;
		ImageEncoder encoder = new ImageEncoder();
		String imgPath = "";
			String rbpath = ResourceBundle.getBundle("spring/app").getString("crvs.svgimage.path");
			File file= new File(rbpath);
			FileOutputStream fop = new FileOutputStream(file);
			try {
				byte[] contentbytes = mapSvgs.getBytes();
				fop.write(contentbytes);
				imgPath = encoder.createImgFromFile(rbpath,cnt)  ;
				System.out.println("imgpath==>"+imgPath);
				cnt++;
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				fop.flush();
				fop.close();
			}
		return imgPath;
	}
	@RequestMapping(value = "/exportImage1", method = RequestMethod.POST, headers = {"Content-type=application/json"})
	@ResponseBody
	public String makeSvgToImage(@RequestBody List<MapSvg> mapSvgs) {
		String imgPath = "";
		System.out.println("mapSvgs===>>>>>>"+mapSvgs.size());
		ImageEncoder encoder = new ImageEncoder();
		org.w3c.dom.Document document = encoder.createDocument(mapSvgs);
		try {
			imgPath = encoder.save(document);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return imgPath;
	}
	
//	@Override
	
//	@RequestMapping(value = "/tableLayout", method = RequestMethod.POST)
//	public void tableLayout(PdfPTable table, float[][] widths, float[] heights,
//			int headerRows, int rowStart, PdfContentByte[] canvases) {
//		   int columns;  
//           Rectangle rect;
//           int footer = widths.length - table.getFooterRows();
//           int header = table.getHeaderRows() - table.getFooterRows() + 1;
//           for (int row = header; row < footer; row += 2) {
//               columns = widths[row].length - 1;
//               rect = new Rectangle(widths[row][0], heights[row],
//                           widths[row][columns], heights[row + 1]);
//               rect.setBackgroundColor(BaseColor.YELLOW);
//               rect.setBorder(Rectangle.NO_BORDER);
//               canvases[PdfPTable.BASECANVAS].rectangle(rect);
//           }
		
		// TODO Auto-generated method stub
}


