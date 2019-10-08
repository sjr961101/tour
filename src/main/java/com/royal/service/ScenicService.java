package com.royal.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.royal.dao.ScenicDao;
import com.royal.pojo.Scenic;
import com.royal.pojo.User_Scenic;

@Service
public class ScenicService {
	@Autowired
	private ScenicDao scenicDao;
	/**
	 * 查找所有未查看的用户推荐景点
	 * @return
	 */
	public List<User_Scenic> findAllUserScenic(){
		return scenicDao.findAllUserScenic();
	}
	
	/**
	 * 修改用户推荐景点的状态为驳回
	 * @param usId
	 */
	public void updateUserScenicFailure(int usId){
		scenicDao.updateUserScenic(usId, -1);
	}
	/**
	 * 修改用户推荐景点的状态为成功
	 * @param usId
	 */
	public void updateUserScenicSuccess(int usId){
		//修改状态
		scenicDao.updateUserScenic(usId, 1);
		//根据用户推荐景点id查找景点
		User_Scenic us = scenicDao.findUserScenicById(usId);
		//加入景点
		scenicDao.addUserScenicToScenic(us);
	}
	
	/****************************************************/
	
	/**
	 * 查找所有省份
	 * @return
	 */
	public List<Scenic> findAllProvience(){
		return scenicDao.findAllProvience();
	}
	/**
	 * 根据省份查找城市
	 * @param pro
	 * @return
	 */
	public List<Scenic> findCityByPro(String pro){
		return scenicDao.findCityByPro(pro);
	}
	
	/**
	 * 根据城市查找景点
	 * @param city
	 * @return
	 */
	public List<Scenic> findSenicByCity(String city){
		return scenicDao.findSenicByCity(city);
	}
	/**
	 * 根据分页城市查找景点
	 * @param city
	 * @return
	 */
	public List<Scenic> findSenicByCityPage(String city,int index){
		return scenicDao.findSenicByCityPage(city,(index-1)*12,12);
	}
	/**
	 * 根据景点id查找景点
	 * @param scenicId
	 * @return
	 */
	public Scenic findScenicById(int scenicId){
		return scenicDao.findScenicById(scenicId);
	}

	/**
	 * 添加推荐景点
	 * @param userId 
	 * @param us
	 * @param fileName
	 */
	public void addUserScenic(int userId, User_Scenic us, String fileName) {
		scenicDao.addUserScenic(userId,us.getUsName(),us.getScenicAddress(),us.getProvince(),us.getCity(),fileName,us.getReason(),new Date());
	}
}
