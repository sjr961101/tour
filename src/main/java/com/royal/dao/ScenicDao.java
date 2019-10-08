package com.royal.dao;

import java.util.Date;
import java.util.List;

import com.royal.pojo.Scenic;
import com.royal.pojo.User_Scenic;
/**
 * �Ծ�������ݲ���
 * @author admin
 *
 */
public interface ScenicDao {
	/**
	 * ��������δ�鿴���û��Ƽ�����
	 * @return
	 */
	public List<User_Scenic> findAllUserScenic();
	/**
	 * ���ݱ�Ų��Ҿ���
	 * @param usId
	 * @return
	 */
	public User_Scenic findUserScenicById(int usId);
	/**
	 * �޸��û��Ƽ������״̬
	 * @param usId
	 */
	public void updateUserScenic(int usId,int index);
	/**
	 * �û��Ƽ�������뾰�� 
	 * @param us
	 */
	public void addUserScenicToScenic(User_Scenic us);
	
	/**
	 * ��������ʡ��
	 */
	public List<Scenic> findAllProvience();
	/**
	 * ����ʡ�ݲ��Ҷ�Ӧ����
	 * @return
	 */
	public List<Scenic> findCityByPro(String pro);
	
	/**
	 * ���ݳ��в��Ҿ���
	 * @param city
	 * @return
	 */
	public List<Scenic> findSenicByCity(String city);
	
	/**
	 * ���ݳ��з�ҳ���Ҿ���
	 * @param city
	 * @return
	 */
	public List<Scenic> findSenicByCityPage(String city,int start,int end);
	
	/**
	 * ���ݾ���id���Ҿ���
	 * @param scenicId
	 * @return
	 */
	public Scenic findScenicById(int scenicId);
	/**
	 * ����Ƽ�����
	 */
	public void addUserScenic(int userId, String usName, String scenicAddress, String province, String city,
			String picture, String reason, Date recommandTime);
}
