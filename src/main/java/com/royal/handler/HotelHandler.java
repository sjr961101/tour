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
	 * ��ʵ�û��Ƽ��Ƶ�
	 */
	@RequestMapping("checkHodel")
	@ResponseBody
	public String checkHodel(int uhId,int index){
		//���ʼ��ظ��û�
		Properties pro = new Properties();
        //���ͷ�������Ҫ���
        pro.put("mail.smtp.auth", "true");
        //�����ʼ�������
        pro.put("mail.host", "smtp.qq.com");
        //�����ʼ���Э��
        pro.put("mail.transport.protocol", "smtp");
        //�˿ں�
        pro.put("mail.smtp.port", "587"); 
        //qq������ҪSSL����
        pro.put("mail.smtp.socketFactory.port", "587");
        pro.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");       
        //�����Ự����
        Session session = Session.getInstance(pro);
        //������Ϣ����
        Message message = new MimeMessage(session);		
		//δͨ��ʱ
		if(index==-1){
			System.out.println(index);
			//�ı�user_hotel�е�״̬Ϊ-1
			hotelService.updateUserHotel(uhId,index);
			//�����û��Ƽ��Ƶ�id���ҾƵ�
			User_Hotel uh = hotelService.findUserHotelById(uhId);
			System.out.println(uh.getUser().getEmail());			
			try {
		        	//�����ʼ��ı���
					message.setSubject("�������");
					//�����ʼ�������
					message.setText(uh.getUser().getUserName()+"�û������Ƽ���"+uh.getHotelName()+"�Ƶ꣬�������δ���ɣ�");
					//message.setText("�û�����������Ϊ��");				
					//���÷�����
					message.setFrom(new InternetAddress("913831627@qq.com"));
					//���ý�����
					message.setRecipient(RecipientType.TO, new InternetAddress(uh.getUser().getEmail()));
					//������Ϣ���Ͷ���
					Transport tran = session.getTransport();
					//           ���� ���͵�ַ      ������                ��Ȩ��
					tran.connect("smtp.qq.com","913831627@qq.com","mxcgnpfwzvnvdjgc");
					//������Ϣ
					tran.sendMessage(message, message.getAllRecipients());
					//�ر�
					tran.close();
					System.out.println("�ʼ��������");
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
		//ͨ������״̬���Ұ������뵽������
		else{
			System.out.println(index);
			//�ı�user_hotel�е�״̬Ϊ1
			hotelService.updateUserHotel(uhId,index);
			//�����û��Ƽ��Ƶ�id���ҾƵ�
			User_Hotel uh = hotelService.findUserHotelById(uhId);
			System.out.println(uh.getUser().getEmail());
			//����Ƶ�
			hotelService.addUserHotelToHotel(uh);
	        try {
	        	//�����ʼ��ı���
				message.setSubject("�������");
				//�����ʼ�������
				message.setText(uh.getUser().getUserName()+"�û������Ƽ���"+uh.getHotelName()+"�Ƶ꣬��վ�Ѳ��ɣ�");
				//message.setText("�û�����������Ϊ��");
				
				//���÷�����
				message.setFrom(new InternetAddress("2321272039@qq.com"));
				//���ý�����
				message.setRecipient(RecipientType.TO, new InternetAddress(uh.getUser().getEmail()));
				//������Ϣ���Ͷ���
				Transport tran = session.getTransport();
				//           ���� ���͵�ַ      ������                ��Ȩ��
				tran.connect("smtp.qq.com","2321272039@qq.com","mxcgnpfwzvnvdjgc");
				//������Ϣ
				tran.sendMessage(message, message.getAllRecipients());
				//�ر�
				tran.close();
				System.out.println("�ʼ��������");
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
	 * ��ѯ���оƵ�
	 */
	@RequestMapping("hotelSelect")
	public String hotelSelect(int p,ModelMap modelMap){
		//�����ж���������
		int count=hotelService.findHotelCount();
		//ҳ��
	    int	pageCount=count%10==0?count/10:count/10+1;
		System.out.println(count);
		//��ѯ���оƵ�
		List<Hotel> list=hotelService.findAllHotels(p);
		modelMap.addAttribute("hotelList", list);
		modelMap.addAttribute("pageCount", pageCount);
		modelMap.addAttribute("page", p);
//		System.out.println(list);
		return "admin/m-hotel";
	}
	
	/**
	 * ɾ���Ƶ�
	 */
	@RequestMapping("deleteHotel")
	@ResponseBody
	public void deleteHotel(int hotelId){
		//ɾ���Ƶ�
		hotelService.deleteHotel(hotelId);
		System.out.println("ɾ���ɹ�");
	}
	
	
	@RequestMapping("findHotelBySearch")
	public ModelAndView findHotelBySearch(ModelAndView model,String findType,String findName,int thisPage){
		System.out.println(findType+"  "+findName);
		//��ѯ����
		model.addObject("findName",findName);
		findName="%"+findName+"%";
		List<Hotel> all= findType.equals("city")?hotelService.findHotelByCityAll(findName):hotelService.findHotelByScenicAll(findName);
		int x=all.size();
//		System.out.println(x);
		int totalPage = x%12==0?x/12:x/12+1;
//		System.out.println(totalPage);
		List<Hotel> list= findType.equals("city")?hotelService.findHotelByCityPage(findName,(thisPage-1)*12):hotelService.findHotelByScenicPage(findName,(thisPage-1)*12);
		model.setViewName("user/hotel-search");
		//��ǰҳ�������ֵĸ���
		model.addObject("total",list.size());
		//��ǰҳ��
		model.addObject("thisPage", thisPage);
		//��ҳ��
		model.addObject("totalPage",totalPage);
		//��ǰҳ���ľ��㼯��
		model.addObject("hotelList", list);
		//��ѯ����
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
			//�����û��������û�
			User user=userService.findUserByName(userName);
			String fileName=file.getOriginalFilename();
			System.out.println(user.getUserName());
			file.transferTo(new File("E:/esplisework/tour/src/main/webapp/img/hotel/"+fileName));
			//����Ƽ�����
			hotelService.addUserHotel(user.getUserId(),us,fileName);
			return "user/recommend";
		}
		else{
			return "home/login";
		}
	
	}
}
