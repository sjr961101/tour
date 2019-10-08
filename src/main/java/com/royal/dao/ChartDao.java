package com.royal.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.royal.form.ChartForm;
import com.royal.pojo.Chart;

public interface ChartDao {

	/**查询本周评论*/
	public List<Chart> findWeekChart(@Param("date") Date date,@Param("startPage") int startPage,@Param("rowpage") int rowpage);
	
	/**查询本周评论行数*/
	public Integer findWeekRowsChart(@Param("date") Date date);
	
	/**查询本月评论*/
	public List<Chart> findMonthChart(@Param("date") Date date,@Param("startPage") int startPage,@Param("rowpage") int rowpage);
	
	/**查找本月评论的数据的行数*/
	public Integer findMonthRowsChart(@Param("date") Date date);
	
	/**修改评论*/
	public void updateChart(int chartId,String content);
	
	/**删除评论*/
	public void deleteChart(int chartId);
	
	/**根据景点id查找评论*/
	public List<Chart> findChartByScenicId(int scenicId);
	
	/**发表评论*/
	public void insertChart(@Param("chartForm")ChartForm chartForm);
	
}
