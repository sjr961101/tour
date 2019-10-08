package com.royal.dao;

import java.util.Date;
import java.util.List;

import com.royal.pojo.Scenic;
import com.royal.pojo.User_Scenic;
/**
 * 对景点的数据操作
 * @author admin
 *
 */
public interface ScenicDao {
	/**
	 * 查找所有未查看的用户推荐景点
	 * @return
	 */
	public List<User_Scenic> findAllUserScenic();
	/**
	 * 根据编号查找景点
	 * @param usId
	 * @return
	 */
	public User_Scenic findUserScenicById(int usId);
	/**
	 * 修改用户推荐景点的状态
	 * @param usId
	 */
	public void updateUserScenic(int usId,int index);
	/**
	 * 用户推荐景点加入景点 
	 * @param us
	 */
	public void addUserScenicToScenic(User_Scenic us);
	
	/**
	 * 查找所有省份
	 */
	public List<Scenic> findAllProvience();
	/**
	 * 根据省份查找对应城市
	 * @return
	 */
	public List<Scenic> findCityByPro(String pro);
	
	/**
	 * 根据城市查找景点
	 * @param city
	 * @return
	 */
	public List<Scenic> findSenicByCity(String city);
	
	/**
	 * 根据城市分页查找景点
	 * @param city
	 * @return
	 */
	public List<Scenic> findSenicByCityPage(String city,int start,int end);
	
	/**
	 * 根据景点id查找景点
	 * @param scenicId
	 * @return
	 */
	public Scenic findScenicById(int scenicId);
	/**
	 * 添加推荐景点
	 */
	public void addUserScenic(int userId, String usName, String scenicAddress, String province, String city,
			String picture, String reason, Date recommandTime);
}
