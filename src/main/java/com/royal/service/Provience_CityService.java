package com.royal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.royal.dao.Provience_CityDao;

@Service
public class Provience_CityService {
	@Autowired
	Provience_CityDao pcDao;
	/**
	 * ��ӳ���ʡ�ݶ�Ӧ��ϵ
	 * @param cid
	 * @param pid
	 * @return
	 */
	public int addPro_city(int cid,int pid){
		return pcDao.addPro_city(pid, cid);
	}
}
