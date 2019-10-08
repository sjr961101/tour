package com.royal.handler;

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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.royal.form.LoginForm;
import com.royal.pojo.User;
import com.royal.service.UserService;

@Controller
@SessionAttributes("loginUser")
public class UserHandler {
	@Autowired
	private UserService userService;
	
	/**
	 * ��ת����¼ҳ��
	 * @return
	 */
	@RequestMapping("showLogin")
	public String showLogin(){
		return "home/login";
	}
	
	/**
	 * ��ת����ҳ
	 */
	@RequestMapping("back")
	public String back(){
		return "user/home";
	}
	
	/**
	 * ��ת���һ�����ҳ��
	 */
	@RequestMapping("forget")
	public String forget(){
		return "home/forget";
	}
	
	/**
	 * ��¼
	 * @param loginForm
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("login")
	/**
	 * ��¼����
	 * @param u ʹ����
  	 * @param msg ��֤��ʶ
	 * @param modelMap
	 * @return
	 */
	public String login(User u,String msg,ModelMap modelMap){
		//�����û�
		User user=userService.findUserByUserName(u);
		String test="1";
		if(user!=null){
			if(u.getPassword().equals(user.getPassword())){
				if(test.equals("1")){
					//�ж��Ƿ����
					if(user.getIsAble()==1){
						modelMap.addAttribute("loginUser", user);
						//�ж��Ƿ����û�
						if(user.getAuthorityId()==1){
							return "user/home";
						}
						else{
							return "admin/home";
						}
					}
					else{
						modelMap.addAttribute("error", "���û��ѽ���");
						return "home/login";
					}
				}
				else{
					modelMap.addAttribute("error", "��֤����");
					return "home/login";
				}
			}
			else{
				modelMap.addAttribute("error", "�������");
				return "home/login";
			}
		}
		else{
			modelMap.addAttribute("error", "�û������ڣ�");
			return "home/login";
		}
	}
	

	@RequestMapping("regist")
	/**
	 * ע��
	 * @param userName
	 * @param password
	 * @param confirm
	 * @param mail
	 * @param modelMap
	 * @return
	 */
	public String regist(String userName,String password,String confirm,String mail,ModelMap modelMap){
		System.out.println(userName+","+password+","+confirm+","+mail);
		//�����û�
		User user=userService.findUserByName(userName);
		String flag="1";
		
		if(user==null){
			if(password.equals(confirm)){
				System.out.println("ע��ɹ���");
				modelMap.addAttribute("error", "ע��ɹ���");
				//����û�
				userService.addUser(userName,password,mail,flag);
			}
			else{
				modelMap.addAttribute("error", "���벻һ�£�");
			}
		}
		else{
			modelMap.addAttribute("error", "�û��Ѵ��ڣ�");
		}
		return "home/login";
	}
	
	
	@RequestMapping("loginOff")
	/**
	 * ע��
	 * @param session
	 * @param modelMap
	 * @return
	 */
	public String loginOff(HttpSession session,ModelMap modelMap){
		//����session
		session.invalidate();
		modelMap.addAttribute("loginUser", null);
		//������ҳ
		return "user/home";
	}

	
	@ResponseBody
	@RequestMapping("userAble")
	/**
	 * �����û�
	 * @param userId
	 */
	public void userAble(int userId){
		//System.out.println(userId);
		userService.updateUserAble(userId);
	}
	
	
	@RequestMapping("findPwd")
	/**
	 * �һ�����
	 * @param mail
	 * @return
	 */
	public String findPwd(String mail){
		//���������ַ��ѯ�û�
		User user=userService.findUserByEmail(mail);
		System.out.println(user);
		System.out.println(mail);
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
        try {
        	//�����ʼ��ı���
			message.setSubject("�û�����");
			//�����ʼ�������
			message.setText(user.getUserName()+"�û�����������Ϊ��"+user.getPassword());
			//message.setText("�û�����������Ϊ��");
			
			//���÷�����
			message.setFrom(new InternetAddress("2321272039@qq.com"));
			//���ý�����
			message.setRecipient(RecipientType.TO, new InternetAddress(mail));
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

		return "home/forget";
	}
	
	
	@RequestMapping("showUser")
	/**
	 * ��ת���鿴�û�ҳ��
	 * @param modelMap
	 * @return
	 */
	public String showUser(ModelMap modelMap){
		//�����û�
		List<User> userList=userService.findAllUsers();
		System.out.println("�����û�");
		System.out.println(userList.size());
		modelMap.addAttribute("userList", userList);
		return "admin/m-user";
	}
	
	
	@RequestMapping("addUser")
	/**
	 * ��ת������û�����
	 * @return
	 */
	public String addUser(){
		return "admin/m-user-addUser";
	}
	/**
	 * ����û�
	 */
	@RequestMapping("add")
	public String add(String userName,String password,String confirm,String mail,ModelMap modelMap){
		System.out.println(userName+","+password+","+confirm+","+mail);
		//�����û�
		User user=userService.findUserByName(userName);
		String flag="0";
		if(user==null){
			if(password.equals(confirm)){
				System.out.println("ע��ɹ���");
				modelMap.addAttribute("error", "ע��ɹ���");
				//����û�
				userService.addUser(userName,password,mail,flag);
			}
			else{
				modelMap.addAttribute("error", "���벻һ�£�");
			}
		}
		else{
			modelMap.addAttribute("error", "�û��Ѵ��ڣ�");
		}
		return "admin/m-user-addUser";
	}
	
	/**
	 * ɾ���û�
	 */
	@RequestMapping("deleteUser")
	@ResponseBody
	public void deleteUser(int userId){
		//ɾ���û�
		userService.deleteUser(userId);
		System.out.println("ɾ���ɹ�");
	}
	
	/**
	 * ��ת���༭ҳ��
	 */
	@RequestMapping("editUser")
	public String editUser(int userId,ModelMap modelMap){
		//�����û���ŵõ��û���Ϣ
		User user=userService.findUserByUserId(userId);
		System.out.println(user);
		modelMap.addAttribute("user", user);
		return "admin/m-user-editUser";
	}
	
	/**
	 * �༭�û�
	 */
	@RequestMapping("edit")
	public String edit(User user,ModelMap modelMap){
		//�޸��û���Ϣ
		System.out.println(user.getUserId()+","+user.getUserName()+","+user.getPassword()+","+user.getEmail());
		userService.editUser(user.getUserId(),user.getUserName(),user.getPassword(),user.getEmail());
		//�����û�
		List<User> userList=userService.findAllUsers();
		System.out.println("�����û�");
		System.out.println(userList.size());
		modelMap.addAttribute("userList", userList);
		return "admin/m-user";
	}
	
	/**
	 * �����û�
	 */
	@RequestMapping("disableUser")
	@ResponseBody
	public void disableUser(int userId){
		//�����û�
		userService.disableUser(userId);
	}
	
	
	@RequestMapping("enableUser")
	@ResponseBody
	/**
	 * �����û�
	 * @param userId
	 */
	public void enableUser(int userId){
		//�����û�
		userService.enableUser(userId);
	}
	

	@RequestMapping("userRecommend")
	/**
	 * ��ת���û��Ƽ�ҳ��
	 * @return
	 */
	public String userRecommend(){
		return "";
	}
}
