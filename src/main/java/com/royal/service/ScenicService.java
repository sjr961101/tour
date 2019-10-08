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
	 * ��������δ�鿴���û��Ƽ�����
	 * @return
	 */
	public List<User_Scenic> findAllUserScenic(){
		return scenicDao.findAllUserScenic();
	}
	
	/**
	 * �޸��û��Ƽ������״̬Ϊ����
	 * @param usId
	 */
	public void updateUserScenicFailure(int usId){
		scenicDao.updateUserScenic(usId, -1);
	}
	/**
	 * �޸��û��Ƽ������״̬Ϊ�ɹ�
	 * @param usId
	 */
	public void updateUserScenicSuccess(int usId){
		//�޸�״̬
		scenicDao.updateUserScenic(usId, 1);
		//�����û��Ƽ�����id���Ҿ���
		User_Scenic us = scenicDao.findUserScenicById(usId);
		//���뾰��
		scenicDao.addUserScenicToScenic(us);
	}
	
	/****************************************************/
	
	/**
	 * ��������ʡ��
	 * @return
	 */
	public List<Scenic> findAllProvience(){
		return scenicDao.findAllProvience();
	}
	/**
	 * ����ʡ�ݲ��ҳ���
	 * @param pro
	 * @return
	 */
	public List<Scenic> findCityByPro(String pro){
		return scenicDao.findCityByPro(pro);
	}
	
	/**
	 * ���ݳ��в��Ҿ���
	 * @param city
	 * @return
	 */
	public List<Scenic> findSenicByCity(String city){
		return scenicDao.findSenicByCity(city);
	}
	/**
	 * ���ݷ�ҳ���в��Ҿ���
	 * @param city
	 * @return
	 */
	public List<Scenic> findSenicByCityPage(String city,int index){
		return scenicDao.findSenicByCityPage(city,(index-1)*12,12);
	}
	/**
	 * ���ݾ���id���Ҿ���
	 * @param scenicId
	 * @return
	 */
	public Scenic findScenicById(int scenicId){
		return scenicDao.findScenicById(scenicId);
	}

	/**
	 * ����Ƽ�����
	 * @param userId 
	 * @param us
	 * @param fileName
	 */
	public void addUserScenic(int userId, User_Scenic us, String fileName) {
		scenicDao.addUserScenic(userId,us.getUsName(),us.getScenicAddress(),us.getProvince(),us.getCity(),fileName,us.getReason(),new Date());
	}
}
