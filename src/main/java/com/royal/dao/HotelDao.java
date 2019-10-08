package com.royal.dao;

import java.util.Date;
import java.util.List;

import com.royal.pojo.Hotel;
import com.royal.pojo.User_Hotel;

public interface HotelDao {

	/**
	 * ��������δ�鿴���û��Ƽ��Ƶ�
	 * @return
	 */
	public List<User_Hotel> findAllUserHotel();

	/**
	 * �ı�user_hotel�е�״̬ -1����  1ͨ��
	 * @param uhId
	 * @param index
	 */
	public void updateUserHotel(int uhId, int index);

	/**
	 * �����û��Ƽ��Ƶ�id���ҾƵ�
	 * @param uhId
	 * @return
	 */
	public User_Hotel findUserHotelById(int uhId);

	/**
	 * ����Ƶ�
	 * @param uh
	 */
	public void addUserHotelToHotel(String hotelName, String hotelAddress, int scenicId, String picture);

	/**
	 * ��ѯ���оƵ�
	 * @param p 
	 * @return
	 */
	public List<Hotel> findAllHotels(int p);
	
	
	/**
	 * ɾ���Ƶ�
	 * @param hotelId
	 */
	public void deleteHotel(int hotelId);

	/**
	 * ���ݾƵ��ŵõ��Ƶ���Ϣ
	 * @param hotelId
	 * @return
	 */
	public Hotel findHotelByHotelId(int hotelId);

	/**
	 * �����ж���������
	 * @return
	 */
	public int findHotelCount();
	
	/**
	 * ĳ����ȫ���Ƶ�
	 * @param name
	 * @param page
	 * @return
	 */
	public List<Hotel> findHotelByCityAll(String name);
	
	/**
	 * ��ҳ��ѯĳ���оƵ�
	 * @param name
	 * @param page
	 * @return
	 */
	public List<Hotel> findHotelByCityPage(String name,int page);
	
	/**
	 * ĳ������Χȫ���Ƶ�
	 * @param name
	 * @param page
	 * @return
	 */
	public List<Hotel> findHotelByScenicAll(String name);
	
	/**
	 * ��ҳ��ѯ������Χ�Ƶ�
	 * @param name
	 * @param page
	 * @return
	 */
	public List<Hotel> findHotelByScenicPage(String name,int page);
	
	/**
	 * ����Ƽ��Ƶ�
	 */
	public void addUserHotel(int userId, String usName, String scenicAddress,
			int scenicid,String picture, String reason, Date recommandTime);
}
