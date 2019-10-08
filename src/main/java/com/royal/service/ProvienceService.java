package com.royal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.royal.dao.ProvienceDao;

/**
 * @author admin
 *
 */
@Service
public class ProvienceService {
	@Autowired
	ProvienceDao proDao;
	
	public int addPro(int id,String name){
		return proDao.addPro(id, name);
	}
}
