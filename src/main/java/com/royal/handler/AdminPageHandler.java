package com.royal.handler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.royal.pojo.User_Hotel;
import com.royal.pojo.User_Scenic;
import com.royal.service.HotelService;
import com.royal.service.ScenicService;
import com.royal.util.FormatUtil;

@Controller
public class AdminPageHandler {
	
	@Autowired
	private ScenicService scenicService;
	@Autowired
	private HotelService hotelService;
	/**
	 * ��������ת
	 * @param model
	 * @param index
	 * @return
	 */
	@RequestMapping("adminPage")
	public ModelAndView adminPage(ModelAndView model,String index){
		if(index.equals("m-scenic")){
			//��������δ�鿴���û��Ƽ�����
			List<User_Scenic> list = scenicService.findAllUserScenic();
			model.addObject("scenicList", list);
		}
		else if(index.equals("m-hotel")){
			List<User_Hotel> list=hotelService.findAllUserHotel();
			for(User_Hotel uh:list){
				uh.setStrRTime(FormatUtil.timeFormat("yyyy-MM-dd HH:mm:ss", uh.getRecommandTime()));
			}
			model.addObject("hotelList",list);
		}
		model.setViewName("admin/"+index);
		return model;
	}
	
	/**
	 * �Ƶ��Ƽ�����
	 */
	@RequestMapping("hotelRecommand")
	public String hotelRecommand(ModelMap modelMap){
		//��������δ�鿴���û��Ƽ��Ƶ�
		List<User_Hotel> list = hotelService.findAllUserHotel() ;
		modelMap.addAttribute("hotelList", list);
		System.out.println(list.get(0).getUser().getUserName()+","+list.get(0).getHotelName());
		return "admin/m-hotel-recommand";
	}
}
