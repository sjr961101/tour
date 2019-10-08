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

	/**��ѯ��������*/
	public List<Chart> findWeekChart(int startPage,int rowpage){
		Date date =new Date();
		List<Chart> list=chartDao.findWeekChart(date,startPage,rowpage);
		if(list.isEmpty()){
			return null;
		}
		return list;
	}
	
	/**���ұ������۵����ݵ�����*/
	public Integer findWeekRowsChart(){
		Date date=new Date();
		Integer rows=chartDao.findWeekRowsChart(date);
		return rows;
	}
	
	/**��ѯ��������*/
	public List<Chart> findMonthChart(int startPage,int rowpage){
		Date date =new Date();
		List<Chart> list=chartDao.findMonthChart(date,startPage,rowpage);
		if(!list.isEmpty()){
			return list;
		}
		return null;
	}
	
	/**���ұ������۵����ݵ�����*/
	public Integer findMonthRowsChart(){
		Date date=new Date();
		Integer rows=chartDao.findMonthRowsChart(date);
		return rows;
	}
	
	/**�޸�����*/
	public void updateChart(Chart chart){
		chartDao.updateChart(chart.getChartId(), chart.getContent());
	}
	
	/**ɾ������*/
	public void deleteChart(int chartId){
		chartDao.deleteChart(chartId);
	}
	
	/**���ݾ���id��������*/
	public List<Chart> findChartByScenicId(int scenicId){
		List<Chart> list=chartDao.findChartByScenicId(scenicId);
		if(!list.isEmpty()){
			return list;
		}
		return null;
	}
	
	/**��������*/
	public void insertChart(ChartForm chartForm){
		chartDao.insertChart(chartForm);
	}
	
	
}
