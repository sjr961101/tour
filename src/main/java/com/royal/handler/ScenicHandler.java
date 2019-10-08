package com.royal.handler;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.royal.pojo.Chart;
import com.royal.pojo.Scenic;
import com.royal.pojo.User;
import com.royal.pojo.User_Scenic;
import com.royal.service.ScenicService;
import com.royal.service.UserService;

@Controller
public class ScenicHandler {
	
	@Autowired
	private ScenicService scenicService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("addScenic")
	@ResponseBody
	public void addScenic(@RequestBody String array){
		JSONArray oa=JSONArray.parseArray(array);
		for(int i=0;i<oa.size();i++){
			JSONObject obj=oa.getJSONObject(i);
		}
	}
	
	/**
	 * 核实用户推荐景点
	 */
	@RequestMapping("checkScenic")
	@ResponseBody
	public String checkScenic(int usId,int index){
		//未通过时
		if(index==-1){
			scenicService.updateUserScenicFailure(usId);
		}
		//通过更改状态，且把他加入到景点中
		else{
			scenicService.updateUserScenicSuccess(usId);
		}
		return null;
	}
	
	/**
	 * 根据省份查找城市
	 * @param pro
	 * @return
	 */
	@RequestMapping("findCity")
	@ResponseBody
	public List<Scenic> findCity(String pro){
		List<Scenic> list = scenicService.findCityByPro(pro);
		return list;
	}
	
	/**
	 * 根据省份查找城市
	 * @param pro
	 * @return
	 */
	@RequestMapping("findScenic")
	@ResponseBody
	public List<Scenic> findScenic(String pro){
		List<Scenic> list = scenicService.findSenicByCity(pro);
		return list;
	}
	
	/**
	 * 根据城市显示景点
	 * @param city
	 * @return
	 */
	@RequestMapping("cityPage")
	public ModelAndView cityPage(String city,int thisPage,ModelAndView model){
		//查找该城市所有景点
		List<Scenic> all = scenicService.findSenicByCity(city);
		//分页查找城市景点
		List<Scenic> list = scenicService.findSenicByCityPage(city,thisPage);
		//判断总页数
		int x = all.size();
		int totalPage = x%12==0?x/12:x/12+1;
		model.setViewName("user/scenic-city");
		model.addObject("pro", list.get(0).getProvince());
		model.addObject("city",city);
		//当前页数所呈现的个数
		model.addObject("total",list.size());
		//当前页码
		model.addObject("thisPage", thisPage);
		//总页数
		model.addObject("totalPage",totalPage);
		//当前页数的景点集合
		model.addObject("scenicList", list);
		return model;
	}
	
	/**
	 * 查看景点详情
	 * @param model
	 * @return
	 */
	@RequestMapping("scenicDetail")
	public ModelAndView scenicDetail(int scenicId,ModelAndView model){
		model.setViewName("forward:seeChart");
		return model;
	}
	
	/**
	 * 用户景点推荐添加
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("scenicRecommand")
	public String scenicRecommand(String userName,User_Scenic us,@RequestParam("myFile") MultipartFile file) throws IllegalStateException, IOException{
		
		//System.out.println(us.getUsName()+","+us.getScenicAddress()+","+us.getProvince()+","+us.getReason());
		if(userName!=""){
			//根据用户名查找用户
			User user=userService.findUserByName(userName);
			String fileName=file.getOriginalFilename();
			System.out.println(user.getUserName());
			file.transferTo(new File("E:/esplisework/tour/src/main/webapp/img/scenic/city/"+fileName));
			//添加推荐景点
			scenicService.addUserScenic(user.getUserId(),us,fileName);
			return "user/recommend";
		}
		else{
			return "home/login";
		}
	}
}
