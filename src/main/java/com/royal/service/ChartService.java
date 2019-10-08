package com.royal.service;
import com.royal.dao.ChartDao;
import com.royal.form.ChartForm;
import com.royal.pojo.*;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChartService {
	@Autowired
	private ChartDao chartDao;

	/**查询本周评论*/
	public List<Chart> findWeekChart(int startPage,int rowpage){
		Date date =new Date();
		List<Chart> list=chartDao.findWeekChart(date,startPage,rowpage);
		if(list.isEmpty()){
			return null;
		}
		return list;
	}
	
	/**查找本月评论的数据的行数*/
	public Integer findWeekRowsChart(){
		Date date=new Date();
		Integer rows=chartDao.findWeekRowsChart(date);
		return rows;
	}
	
	/**查询本月评论*/
	public List<Chart> findMonthChart(int startPage,int rowpage){
		Date date =new Date();
		List<Chart> list=chartDao.findMonthChart(date,startPage,rowpage);
		if(!list.isEmpty()){
			return list;
		}
		return null;
	}
	
	/**查找本月评论的数据的行数*/
	public Integer findMonthRowsChart(){
		Date date=new Date();
		Integer rows=chartDao.findMonthRowsChart(date);
		return rows;
	}
	
	/**修改评论*/
	public void updateChart(Chart chart){
		chartDao.updateChart(chart.getChartId(), chart.getContent());
	}
	
	/**删除评论*/
	public void deleteChart(int chartId){
		chartDao.deleteChart(chartId);
	}
	
	/**根据景点id查找评论*/
	public List<Chart> findChartByScenicId(int scenicId){
		List<Chart> list=chartDao.findChartByScenicId(scenicId);
		if(!list.isEmpty()){
			return list;
		}
		return null;
	}
	
	/**发表评论*/
	public void insertChart(ChartForm chartForm){
		chartDao.insertChart(chartForm);
	}
	
	
}
