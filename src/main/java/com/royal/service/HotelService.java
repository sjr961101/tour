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
	 * 查找所有未查看的用户推荐酒店
	 * @return
	 */
	public List<User_Hotel> findAllUserHotel() {
		return hotelDao.findAllUserHotel();
	}

	/**
	 * 改变user_hotel中的状态 -1驳回  1通过
	 * @param uhId
	 * @param index
	 */
	public void updateUserHotel(int uhId, int index) {
		hotelDao.updateUserHotel(uhId,index);
	}

	/**
	 * 根据用户推荐酒店id查找酒店
	 * @param uhId
	 * @return
	 */
	public User_Hotel findUserHotelById(int uhId) {
		return hotelDao.findUserHotelById(uhId);
	}

	/**
	 * 加入酒店
	 * @param us
	 */
	public void addUserHotelToHotel(User_Hotel uh) {
//		System.out.println(uh.getHotelName()+","+uh.getHotelAddress()+","+uh.getScenicId()+","+uh.getPicture());
		hotelDao.addUserHotelToHotel(uh.getHotelName(),uh.getHotelAddress(),uh.getScenicId(),uh.getPicture());
	}

	/**
	 * 查询所有酒店
	 * @param p 
	 * @return
	 */
	public List<Hotel> findAllHotels(int p) {
		return hotelDao.findAllHotels(p);
	}
	

 
	/**
	 * 删除酒店
	 * @param hotelId
	 */
	public void deleteHotel(int hotelId) {
		hotelDao.deleteHotel(hotelId);
	}

	/**
	 * 根据酒店编号得到酒店信息
	 * @param hotelId
	 * @return
	 */
	public Hotel findHotelByHotelId(int hotelId) {
		return hotelDao.findHotelByHotelId(hotelId);
	}

	/**
	 * 查找有多少条数据
	 * @return
	 */
	public int findHotelCount() {
		return hotelDao.findHotelCount();
	}
	
	/**
	 * 根据搜索信息查找对应的酒店
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
