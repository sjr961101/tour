package com.royal.dao;

import java.util.Date;
import java.util.List;

import com.royal.pojo.Hotel;
import com.royal.pojo.User_Hotel;

public interface HotelDao {

	/**
	 * 查找所有未查看的用户推荐酒店
	 * @return
	 */
	public List<User_Hotel> findAllUserHotel();

	/**
	 * 改变user_hotel中的状态 -1驳回  1通过
	 * @param uhId
	 * @param index
	 */
	public void updateUserHotel(int uhId, int index);

	/**
	 * 根据用户推荐酒店id查找酒店
	 * @param uhId
	 * @return
	 */
	public User_Hotel findUserHotelById(int uhId);

	/**
	 * 加入酒店
	 * @param uh
	 */
	public void addUserHotelToHotel(String hotelName, String hotelAddress, int scenicId, String picture);

	/**
	 * 查询所有酒店
	 * @param p 
	 * @return
	 */
	public List<Hotel> findAllHotels(int p);
	
	
	/**
	 * 删除酒店
	 * @param hotelId
	 */
	public void deleteHotel(int hotelId);

	/**
	 * 根据酒店编号得到酒店信息
	 * @param hotelId
	 * @return
	 */
	public Hotel findHotelByHotelId(int hotelId);

	/**
	 * 查找有多少条数据
	 * @return
	 */
	public int findHotelCount();
	
	/**
	 * 某城市全部酒店
	 * @param name
	 * @param page
	 * @return
	 */
	public List<Hotel> findHotelByCityAll(String name);
	
	/**
	 * 分页查询某城市酒店
	 * @param name
	 * @param page
	 * @return
	 */
	public List<Hotel> findHotelByCityPage(String name,int page);
	
	/**
	 * 某景区周围全部酒店
	 * @param name
	 * @param page
	 * @return
	 */
	public List<Hotel> findHotelByScenicAll(String name);
	
	/**
	 * 分页查询景区周围酒店
	 * @param name
	 * @param page
	 * @return
	 */
	public List<Hotel> findHotelByScenicPage(String name,int page);
	
	/**
	 * 添加推荐酒店
	 */
	public void addUserHotel(int userId, String usName, String scenicAddress,
			int scenicid,String picture, String reason, Date recommandTime);
}
