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
	 * ��ʵ�û��Ƽ�����
	 */
	@RequestMapping("checkScenic")
	@ResponseBody
	public String checkScenic(int usId,int index){
		//δͨ��ʱ
		if(index==-1){
			scenicService.updateUserScenicFailure(usId);
		}
		//ͨ������״̬���Ұ������뵽������
		else{
			scenicService.updateUserScenicSuccess(usId);
		}
		return null;
	}
	
	/**
	 * ����ʡ�ݲ��ҳ���
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
	 * ����ʡ�ݲ��ҳ���
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
	 * ���ݳ�����ʾ����
	 * @param city
	 * @return
	 */
	@RequestMapping("cityPage")
	public ModelAndView cityPage(String city,int thisPage,ModelAndView model){
		//���Ҹó������о���
		List<Scenic> all = scenicService.findSenicByCity(city);
		//��ҳ���ҳ��о���
		List<Scenic> list = scenicService.findSenicByCityPage(city,thisPage);
		//�ж���ҳ��
		int x = all.size();
		int totalPage = x%12==0?x/12:x/12+1;
		model.setViewName("user/scenic-city");
		model.addObject("pro", list.get(0).getProvince());
		model.addObject("city",city);
		//��ǰҳ�������ֵĸ���
		model.addObject("total",list.size());
		//��ǰҳ��
		model.addObject("thisPage", thisPage);
		//��ҳ��
		model.addObject("totalPage",totalPage);
		//��ǰҳ���ľ��㼯��
		model.addObject("scenicList", list);
		return model;
	}
	
	/**
	 * �鿴��������
	 * @param model
	 * @return
	 */
	@RequestMapping("scenicDetail")
	public ModelAndView scenicDetail(int scenicId,ModelAndView model){
		model.setViewName("forward:seeChart");
		return model;
	}
	
	/**
	 * �û������Ƽ����
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("scenicRecommand")
	public String scenicRecommand(String userName,User_Scenic us,@RequestParam("myFile") MultipartFile file) throws IllegalStateException, IOException{
		
		//System.out.println(us.getUsName()+","+us.getScenicAddress()+","+us.getProvince()+","+us.getReason());
		if(userName!=""){
			//�����û��������û�
			User user=userService.findUserByName(userName);
			String fileName=file.getOriginalFilename();
			System.out.println(user.getUserName());
			file.transferTo(new File("E:/esplisework/tour/src/main/webapp/img/scenic/city/"+fileName));
			//����Ƽ�����
			scenicService.addUserScenic(user.getUserId(),us,fileName);
			return "user/recommend";
		}
		else{
			return "home/login";
		}
	}
}
