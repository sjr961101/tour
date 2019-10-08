package com.royal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.royal.dao.CityDao;

@Service
public class CityService {
	@Autowired
	CityDao cityDao;
	
	//��ӳ���
	public int addCity(int id,String name){
		return cityDao.addCity(id, name);
	}
}
