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
	/**本月*/
	public String manageMonthChart(ModelMap modelMap,int p){
		//System.out.println(p);
	
		//查看本月评论的行数
		Integer rows=chartService.findMonthRowsChart();
		List<Chart> list=findPage(p,1);
		int page=rows%5==0?rows/5:rows/5+1;
		//System.out.println(page);	
		//System.out.println("本月");
		//System.out.println("--------本月---------");
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
			System.out.println("本月无数据");
		}
		
		return "admin/m-month-remark";
	}
	
	/**
	 * 查看页码
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
	/**本周*/
	public String manageWeekChart(ModelMap modelMap,int p){
		//System.out.println(p);
		//查询总行数
		Integer rows=chartService.findWeekRowsChart();
		int page=rows%5==0?(rows/5):(rows/5+1);
		List<Chart> list=findPage(p,0);
		//System.out.println("--------本周---------");
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
			System.out.println("本周无数据");
		}
		
		return "admin/m-week-remark";
	}
	
	
	@ResponseBody
	@RequestMapping("modifyChart")
	/** 修改评论*/
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
	/**查看该景点评论*/
	public String seeChart(int scenicId,ModelMap modelMap){
		//System.out.println(scenicId);
		//根据景点查找评论
		List<Chart> list=chartService.findChartByScenicId(scenicId);
		//根据景点id查找景点
		Scenic scenic = scenicService.findScenicById(scenicId);
		//查找评论个数
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
	 * 删除评论
	 * @param chartId
	 */
	public void deleteChart(int chartId){
		//System.out.println(chartId);
		//System.out.println(chart.getContent());
		chartService.deleteChart(chartId);
	}
	
	
	
	@ResponseBody
	@RequestMapping("isLogin")
	/**查看当前用户是否已登录*/
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
