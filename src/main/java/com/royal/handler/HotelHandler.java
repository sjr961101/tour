package com.royal.handler;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.royal.pojo.Hotel;
import com.royal.pojo.User;
import com.royal.pojo.User_Hotel;
import com.royal.pojo.User_Scenic;
import com.royal.service.HotelService;
import com.royal.service.UserService;


@Controller
public class HotelHandler {
	@Autowired
	private HotelService hotelService;
	@Autowired
	private UserService userService;
	
	
	
	
	/**
	 * 核实用户推荐酒店
	 */
	@RequestMapping("checkHodel")
	@ResponseBody
	public String checkHodel(int uhId,int index){
		//发邮件回复用户
		Properties pro = new Properties();
        //发送服务器需要身份
        pro.put("mail.smtp.auth", "true");
        //设置邮件服务器
        pro.put("mail.host", "smtp.qq.com");
        //发送邮件的协议
        pro.put("mail.transport.protocol", "smtp");
        //端口号
        pro.put("mail.smtp.port", "587"); 
        //qq邮箱需要SSL加密
        pro.put("mail.smtp.socketFactory.port", "587");
        pro.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");       
        //创建会话对象
        Session session = Session.getInstance(pro);
        //创建消息对象
        Message message = new MimeMessage(session);		
		//未通过时
		if(index==-1){
			System.out.println(index);
			//改变user_hotel中的状态为-1
			hotelService.updateUserHotel(uhId,index);
			//根据用户推荐酒店id查找酒店
			User_Hotel uh = hotelService.findUserHotelById(uhId);
			System.out.println(uh.getUser().getEmail());			
			try {
		        	//设置邮件的标题
					message.setSubject("意见采纳");
					//设置邮件的内容
					message.setText(uh.getUser().getUserName()+"用户，您推荐的"+uh.getHotelName()+"酒店，经考察后未采纳！");
					//message.setText("用户，您的密码为：");				
					//设置发送人
					message.setFrom(new InternetAddress("913831627@qq.com"));
					//设置接收人
					message.setRecipient(RecipientType.TO, new InternetAddress(uh.getUser().getEmail()));
					//创建消息发送对象
					Transport tran = session.getTransport();
					//           链接 发送地址      发送人                授权码
					tran.connect("smtp.qq.com","913831627@qq.com","mxcgnpfwzvnvdjgc");
					//发送信息
					tran.sendMessage(message, message.getAllRecipients());
					//关闭
					tran.close();
					System.out.println("邮件发送完毕");
				} catch (AddressException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NoSuchProviderException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		//通过更改状态，且把他加入到景点中
		else{
			System.out.println(index);
			//改变user_hotel中的状态为1
			hotelService.updateUserHotel(uhId,index);
			//根据用户推荐酒店id查找酒店
			User_Hotel uh = hotelService.findUserHotelById(uhId);
			System.out.println(uh.getUser().getEmail());
			//加入酒店
			hotelService.addUserHotelToHotel(uh);
	        try {
	        	//设置邮件的标题
				message.setSubject("意见采纳");
				//设置邮件的内容
				message.setText(uh.getUser().getUserName()+"用户，您推荐的"+uh.getHotelName()+"酒店，网站已采纳！");
				//message.setText("用户，您的密码为：");
				
				//设置发送人
				message.setFrom(new InternetAddress("2321272039@qq.com"));
				//设置接收人
				message.setRecipient(RecipientType.TO, new InternetAddress(uh.getUser().getEmail()));
				//创建消息发送对象
				Transport tran = session.getTransport();
				//           链接 发送地址      发送人                授权码
				tran.connect("smtp.qq.com","2321272039@qq.com","mxcgnpfwzvnvdjgc");
				//发送信息
				tran.sendMessage(message, message.getAllRecipients());
				//关闭
				tran.close();
				System.out.println("邮件发送完毕");
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchProviderException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return null;
	}
	
	/**
	 * 查询所有酒店
	 */
	@RequestMapping("hotelSelect")
	public String hotelSelect(int p,ModelMap modelMap){
		//查找有多少条数据
		int count=hotelService.findHotelCount();
		//页数
	    int	pageCount=count%10==0?count/10:count/10+1;
		System.out.println(count);
		//查询所有酒店
		List<Hotel> list=hotelService.findAllHotels(p);
		modelMap.addAttribute("hotelList", list);
		modelMap.addAttribute("pageCount", pageCount);
		modelMap.addAttribute("page", p);
//		System.out.println(list);
		return "admin/m-hotel";
	}
	
	/**
	 * 删除酒店
	 */
	@RequestMapping("deleteHotel")
	@ResponseBody
	public void deleteHotel(int hotelId){
		//删除酒店
		hotelService.deleteHotel(hotelId);
		System.out.println("删除成功");
	}
	
	
	@RequestMapping("findHotelBySearch")
	public ModelAndView findHotelBySearch(ModelAndView model,String findType,String findName,int thisPage){
		System.out.println(findType+"  "+findName);
		//查询名称
		model.addObject("findName",findName);
		findName="%"+findName+"%";
		List<Hotel> all= findType.equals("city")?hotelService.findHotelByCityAll(findName):hotelService.findHotelByScenicAll(findName);
		int x=all.size();
//		System.out.println(x);
		int totalPage = x%12==0?x/12:x/12+1;
//		System.out.println(totalPage);
		List<Hotel> list= findType.equals("city")?hotelService.findHotelByCityPage(findName,(thisPage-1)*12):hotelService.findHotelByScenicPage(findName,(thisPage-1)*12);
		model.setViewName("user/hotel-search");
		//当前页数所呈现的个数
		model.addObject("total",list.size());
		//当前页码
		model.addObject("thisPage", thisPage);
		//总页数
		model.addObject("totalPage",totalPage);
		//当前页数的景点集合
		model.addObject("hotelList", list);
		//查询类型
		model.addObject("findType",findType);
		
		return model;
	}
	
	
	@RequestMapping("findRoute")
	public ModelAndView findRoute(ModelAndView model,String address){
		model.addObject("addr",address);
		model.setViewName("user/way");
		return model;
	}
	

	@RequestMapping("hotelRecommand1")
	public String HotelRecommand(String userName,User_Hotel us,@RequestParam("myFile1") MultipartFile file) throws IllegalStateException, IOException{
		if(userName!=""){
			//根据用户名查找用户
			User user=userService.findUserByName(userName);
			String fileName=file.getOriginalFilename();
			System.out.println(user.getUserName());
			file.transferTo(new File("E:/esplisework/tour/src/main/webapp/img/hotel/"+fileName));
			//添加推荐景点
			hotelService.addUserHotel(user.getUserId(),us,fileName);
			return "user/recommend";
		}
		else{
			return "home/login";
		}
	
	}
}
