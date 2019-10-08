package com.royal.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.royal.form.ChartForm;
import com.royal.pojo.Chart;

public interface ChartDao {

	/**��ѯ��������*/
	public List<Chart> findWeekChart(@Param("date") Date date,@Param("startPage") int startPage,@Param("rowpage") int rowpage);
	
	/**��ѯ������������*/
	public Integer findWeekRowsChart(@Param("date") Date date);
	
	/**��ѯ��������*/
	public List<Chart> findMonthChart(@Param("date") Date date,@Param("startPage") int startPage,@Param("rowpage") int rowpage);
	
	/**���ұ������۵����ݵ�����*/
	public Integer findMonthRowsChart(@Param("date") Date date);
	
	/**�޸�����*/
	public void updateChart(int chartId,String content);
	
	/**ɾ������*/
	public void deleteChart(int chartId);
	
	/**���ݾ���id��������*/
	public List<Chart> findChartByScenicId(int scenicId);
	
	/**��������*/
	public void insertChart(@Param("chartForm")ChartForm chartForm);
	
}
