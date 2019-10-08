package com.royal.handler;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.royal.dao.ChartDao;
import com.royal.form.ChartForm;
import com.royal.pojo.Chart;
import com.royal.pojo.Scenic;
import com.royal.pojo.User;
import com.royal.service.ChartService;
import com.royal.service.ScenicService;

@Controller
public class ChartHandler {
	@Autowired
	ScenicService scenicService;
	@Autowired
	private ChartService chartService;
	SimpleDateFormat formater=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@RequestMapping("manageMonthChart")
	/**����*/
	public String manageMonthChart(ModelMap modelMap,int p){
		//System.out.println(p);
	
		//�鿴�������۵�����
		Integer rows=chartService.findMonthRowsChart();
		List<Chart> list=findPage(p,1);
		int page=rows%5==0?rows/5:rows/5+1;
		//System.out.println(page);	
		//System.out.println("����");
		//System.out.println("--------����---------");
		if(list!=null){
			for(int i=0;i<list.size();i++){
				Chart chart=list.get(i);
				chart.setFormatTime(formater.format(chart.getChartTime()));
				//System.out.println(chart.getContent()+","+chart.getUser().getUserName()+","+chart.getChartTime());
			}
			modelMap.addAttribute("monthChart", list);
			modelMap.addAttribute("pageSum", page);
		}
		else{
			System.out.println("����������");
		}
		
		return "admin/m-month-remark";
	}
	
	/**
	 * �鿴ҳ��
	 * @param page
	 * @param flag
	 * @return
	 */
	public List<Chart> findPage(int page,int flag){
		List<Chart> chart=new ArrayList<Chart>();
		int startPage=(page-1)*5;
		int rowpage=5;
		if(flag==1){
			chart=chartService.findMonthChart(startPage,rowpage);
		}
		else{
			chart=chartService.findWeekChart(startPage,rowpage);
		}
		return chart;
	}
	
	@RequestMapping("manageWeekChart")
	/**����*/
	public String manageWeekChart(ModelMap modelMap,int p){
		//System.out.println(p);
		//��ѯ������
		Integer rows=chartService.findWeekRowsChart();
		int page=rows%5==0?(rows/5):(rows/5+1);
		List<Chart> list=findPage(p,0);
		//System.out.println("--------����---------");
		if(list!=null){
			for(int i=0;i<list.size();i++){
				Chart chart=list.get(i);
				chart.setFormatTime(formater.format(chart.getChartTime()));
				//System.out.println(chart.getContent()+","+chart.getUser().getUserName()+","+chart.getChartTime());
			}
			modelMap.addAttribute("weekChart", list);
			modelMap.addAttribute("pageSum", page);
		}
		else{
			System.out.println("����������");
		}
		
		return "admin/m-week-remark";
	}
	
	
	@ResponseBody
	@RequestMapping("modifyChart")
	/** �޸�����*/
	public void modifyChart(Chart chart) throws UnsupportedEncodingException{
		//System.out.println(chart.getChartId());
		//System.out.println(chart.getContent());
		String content=chart.getContent();
		content=new String(content.getBytes("iso-8859-1"),"utf-8");
		chart.setContent(content);
		//System.out.println(chart.getContent());
		chartService.updateChart(chart);
	}
	
	
	@RequestMapping("publishChart")
	/**
	 * 
	 * @param chartForm
	 * @param modelMap
	 * @return
	 */
	public String publishChart(ChartForm chartForm,ModelMap modelMap){
		//System.out.println(chartForm.getContent()+","+chartForm.getUserId()+","+chartForm.getScenicId());
		Date date=new Date();
		chartForm.setChartTime(date);
		chartService.insertChart(chartForm);
		modelMap.addAttribute("scenicId", chartForm.getScenicId());
		return "forward:seeChart.do";
	}
	
	@RequestMapping("seeChart")
	/**�鿴�þ�������*/
	public String seeChart(int scenicId,ModelMap modelMap){
		//System.out.println(scenicId);
		//���ݾ����������
		List<Chart> list=chartService.findChartByScenicId(scenicId);
		//���ݾ���id���Ҿ���
		Scenic scenic = scenicService.findScenicById(scenicId);
		//�������۸���
		if(list!=null){
			for(int i=0;i<list.size();i++){
				Chart chart=list.get(i);
				chart.setFormatTime(formater.format(chart.getChartTime()));
				//System.out.println(chart.getContent());
			}
			
			modelMap.addAttribute("chartList", list);
			
		}
		modelMap.addAttribute("scenic", scenic);
		return "user/scenic-detail";
	}
	
	@ResponseBody
	@RequestMapping("deleteChart")
	/**
	 * ɾ������
	 * @param chartId
	 */
	public void deleteChart(int chartId){
		//System.out.println(chartId);
		//System.out.println(chart.getContent());
		chartService.deleteChart(chartId);
	}
	
	
	
	@ResponseBody
	@RequestMapping("isLogin")
	/**�鿴��ǰ�û��Ƿ��ѵ�¼*/
	public String isLogin(ModelMap modelMap){
		ServletRequestAttributes requestAttr=(ServletRequestAttributes)RequestContextHolder.getRequestAttributes();
		HttpServletRequest request=requestAttr.getRequest();
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("loginUser");
		//System.out.println(user.getUserName());
		if(user!=null){
			return "success";
		}
		else{
			return "fail";
		}
		
	}
	
}
