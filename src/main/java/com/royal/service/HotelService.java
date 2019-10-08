package com.royal.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.royal.dao.HotelDao;
import com.royal.pojo.Hotel;
import com.royal.pojo.User_Hotel;
import com.royal.pojo.User_Scenic;

@Service
public class HotelService {
	@Autowired
	private HotelDao hotelDao;

	/**
	 * ��������δ�鿴���û��Ƽ��Ƶ�
	 * @return
	 */
	public List<User_Hotel> findAllUserHotel() {
		return hotelDao.findAllUserHotel();
	}

	/**
	 * �ı�user_hotel�е�״̬ -1����  1ͨ��
	 * @param uhId
	 * @param index
	 */
	public void updateUserHotel(int uhId, int index) {
		hotelDao.updateUserHotel(uhId,index);
	}

	/**
	 * �����û��Ƽ��Ƶ�id���ҾƵ�
	 * @param uhId
	 * @return
	 */
	public User_Hotel findUserHotelById(int uhId) {
		return hotelDao.findUserHotelById(uhId);
	}

	/**
	 * ����Ƶ�
	 * @param us
	 */
	public void addUserHotelToHotel(User_Hotel uh) {
//		System.out.println(uh.getHotelName()+","+uh.getHotelAddress()+","+uh.getScenicId()+","+uh.getPicture());
		hotelDao.addUserHotelToHotel(uh.getHotelName(),uh.getHotelAddress(),uh.getScenicId(),uh.getPicture());
	}

	/**
	 * ��ѯ���оƵ�
	 * @param p 
	 * @return
	 */
	public List<Hotel> findAllHotels(int p) {
		return hotelDao.findAllHotels(p);
	}
	

 
	/**
	 * ɾ���Ƶ�
	 * @param hotelId
	 */
	public void deleteHotel(int hotelId) {
		hotelDao.deleteHotel(hotelId);
	}

	/**
	 * ���ݾƵ��ŵõ��Ƶ���Ϣ
	 * @param hotelId
	 * @return
	 */
	public Hotel findHotelByHotelId(int hotelId) {
		return hotelDao.findHotelByHotelId(hotelId);
	}

	/**
	 * �����ж���������
	 * @return
	 */
	public int findHotelCount() {
		return hotelDao.findHotelCount();
	}
	
	/**
	 * ����������Ϣ���Ҷ�Ӧ�ľƵ�
	 * @param city
	 * @param name
	 * @return
	 */
	public List<Hotel> findHotelByCityAll(String name){
		return hotelDao.findHotelByCityAll(name);
	}
	
	public List<Hotel> findHotelByCityPage(String name,int page){
		return hotelDao.findHotelByCityPage(name, page);
	}
	
	public List<Hotel> findHotelByScenicAll(String name){
		return hotelDao.findHotelByScenicAll(name);
	}
	public List<Hotel> findHotelByScenicPage(String name,int page){
		return hotelDao.findHotelByCityPage(name, page);
	}
	
	public void addUserHotel(int userId, User_Hotel us, String fileName) {
		hotelDao.addUserHotel(userId,us.getHotelName(),us.getHotelAddress(),us.getScenicId(),fileName,us.getReason(),new Date());
	}
}
