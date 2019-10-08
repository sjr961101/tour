package com.royal.handler;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.royal.pojo.Scenic;
import com.royal.service.CityService;
import com.royal.service.ProvienceService;
import com.royal.service.Provience_CityService;
import com.royal.service.ScenicService;

@Controller
public class UserPageHandler {
	@Autowired
	ScenicService scenicService;
	@Autowired
	CityService cityService;
	@Autowired
	ProvienceService proService;
	@Autowired
	Provience_CityService pcService;
	/**
	 * 导航栏跳转
	 * @param model
	 * @param index
	 * @return
	 */
	@RequestMapping("userPage")
	public ModelAndView userPage(ModelAndView model,String index){
		model.setViewName("user/"+index);
		if(index.equals("scenic")){
			//查找所有的省份
			List<Scenic> list = scenicService.findAllProvience();
			model.addObject("scenicList", list);
		}
		return model;
	}
}
