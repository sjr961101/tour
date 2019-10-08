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
	 * 跳转到登录页面
	 * @return
	 */
	@RequestMapping("showLogin")
	public String showLogin(){
		return "home/login";
	}
	
	/**
	 * 跳转到首页
	 */
	@RequestMapping("back")
	public String back(){
		return "user/home";
	}
	
	/**
	 * 跳转到找回密码页面
	 */
	@RequestMapping("forget")
	public String forget(){
		return "home/forget";
	}
	
	/**
	 * 登录
	 * @param loginForm
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("login")
	/**
	 * 登录功能
	 * @param u 使用者
  	 * @param msg 验证标识
	 * @param modelMap
	 * @return
	 */
	public String login(User u,String msg,ModelMap modelMap){
		//查找用户
		User user=userService.findUserByUserName(u);
		String test="1";
		if(user!=null){
			if(u.getPassword().equals(user.getPassword())){
				if(test.equals("1")){
					//判断是否禁用
					if(user.getIsAble()==1){
						modelMap.addAttribute("loginUser", user);
						//判断是否是用户
						if(user.getAuthorityId()==1){
							return "user/home";
						}
						else{
							return "admin/home";
						}
					}
					else{
						modelMap.addAttribute("error", "此用户已禁用");
						return "home/login";
					}
				}
				else{
					modelMap.addAttribute("error", "验证错误！");
					return "home/login";
				}
			}
			else{
				modelMap.addAttribute("error", "密码错误！");
				return "home/login";
			}
		}
		else{
			modelMap.addAttribute("error", "用户不存在！");
			return "home/login";
		}
	}
	

	@RequestMapping("regist")
	/**
	 * 注册
	 * @param userName
	 * @param password
	 * @param confirm
	 * @param mail
	 * @param modelMap
	 * @return
	 */
	public String regist(String userName,String password,String confirm,String mail,ModelMap modelMap){
		System.out.println(userName+","+password+","+confirm+","+mail);
		//查找用户
		User user=userService.findUserByName(userName);
		String flag="1";
		
		if(user==null){
			if(password.equals(confirm)){
				System.out.println("注册成功！");
				modelMap.addAttribute("error", "注册成功！");
				//添加用户
				userService.addUser(userName,password,mail,flag);
			}
			else{
				modelMap.addAttribute("error", "密码不一致！");
			}
		}
		else{
			modelMap.addAttribute("error", "用户已存在！");
		}
		return "home/login";
	}
	
	
	@RequestMapping("loginOff")
	/**
	 * 注销
	 * @param session
	 * @param modelMap
	 * @return
	 */
	public String loginOff(HttpSession session,ModelMap modelMap){
		//销毁session
		session.invalidate();
		modelMap.addAttribute("loginUser", null);
		//返回首页
		return "user/home";
	}

	
	@ResponseBody
	@RequestMapping("userAble")
	/**
	 * 禁用用户
	 * @param userId
	 */
	public void userAble(int userId){
		//System.out.println(userId);
		userService.updateUserAble(userId);
	}
	
	
	@RequestMapping("findPwd")
	/**
	 * 找回密码
	 * @param mail
	 * @return
	 */
	public String findPwd(String mail){
		//根据邮箱地址查询用户
		User user=userService.findUserByEmail(mail);
		System.out.println(user);
		System.out.println(mail);
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
        try {
        	//设置邮件的标题
			message.setSubject("用户密码");
			//设置邮件的内容
			message.setText(user.getUserName()+"用户，您的密码为："+user.getPassword());
			//message.setText("用户，您的密码为：");
			
			//设置发送人
			message.setFrom(new InternetAddress("2321272039@qq.com"));
			//设置接收人
			message.setRecipient(RecipientType.TO, new InternetAddress(mail));
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

		return "home/forget";
	}
	
	
	@RequestMapping("showUser")
	/**
	 * 跳转到查看用户页面
	 * @param modelMap
	 * @return
	 */
	public String showUser(ModelMap modelMap){
		//查找用户
		List<User> userList=userService.findAllUsers();
		System.out.println("查找用户");
		System.out.println(userList.size());
		modelMap.addAttribute("userList", userList);
		return "admin/m-user";
	}
	
	
	@RequestMapping("addUser")
	/**
	 * 跳转到添加用户界面
	 * @return
	 */
	public String addUser(){
		return "admin/m-user-addUser";
	}
	/**
	 * 添加用户
	 */
	@RequestMapping("add")
	public String add(String userName,String password,String confirm,String mail,ModelMap modelMap){
		System.out.println(userName+","+password+","+confirm+","+mail);
		//查找用户
		User user=userService.findUserByName(userName);
		String flag="0";
		if(user==null){
			if(password.equals(confirm)){
				System.out.println("注册成功！");
				modelMap.addAttribute("error", "注册成功！");
				//添加用户
				userService.addUser(userName,password,mail,flag);
			}
			else{
				modelMap.addAttribute("error", "密码不一致！");
			}
		}
		else{
			modelMap.addAttribute("error", "用户已存在！");
		}
		return "admin/m-user-addUser";
	}
	
	/**
	 * 删除用户
	 */
	@RequestMapping("deleteUser")
	@ResponseBody
	public void deleteUser(int userId){
		//删除用户
		userService.deleteUser(userId);
		System.out.println("删除成功");
	}
	
	/**
	 * 跳转到编辑页面
	 */
	@RequestMapping("editUser")
	public String editUser(int userId,ModelMap modelMap){
		//根据用户编号得到用户信息
		User user=userService.findUserByUserId(userId);
		System.out.println(user);
		modelMap.addAttribute("user", user);
		return "admin/m-user-editUser";
	}
	
	/**
	 * 编辑用户
	 */
	@RequestMapping("edit")
	public String edit(User user,ModelMap modelMap){
		//修改用户信息
		System.out.println(user.getUserId()+","+user.getUserName()+","+user.getPassword()+","+user.getEmail());
		userService.editUser(user.getUserId(),user.getUserName(),user.getPassword(),user.getEmail());
		//查找用户
		List<User> userList=userService.findAllUsers();
		System.out.println("查找用户");
		System.out.println(userList.size());
		modelMap.addAttribute("userList", userList);
		return "admin/m-user";
	}
	
	/**
	 * 禁用用户
	 */
	@RequestMapping("disableUser")
	@ResponseBody
	public void disableUser(int userId){
		//禁用用户
		userService.disableUser(userId);
	}
	
	
	@RequestMapping("enableUser")
	@ResponseBody
	/**
	 * 启用用户
	 * @param userId
	 */
	public void enableUser(int userId){
		//启用用户
		userService.enableUser(userId);
	}
	

	@RequestMapping("userRecommend")
	/**
	 * 跳转到用户推荐页面
	 * @return
	 */
	public String userRecommend(){
		return "";
	}
}
