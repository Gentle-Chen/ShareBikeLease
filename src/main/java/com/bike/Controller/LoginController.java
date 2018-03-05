package com.bike.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.bike.Constant.GlobalConstants;
import com.bike.Dao.LoginDao;
import com.bike.Dao.UserDao;
import com.bike.Dto.Admin;
import com.bike.Dto.Login;
import com.bike.Dto.User;
import com.bike.Helper.UserSessionHelper;

@Controller
public class LoginController {
	
	@Autowired
	private UserDao userDao;
	@Autowired
	private LoginDao loginDao;
	
	
	@RequestMapping(value = "/*")
	public String noFound(HttpServletRequest request){
		String type = UserSessionHelper.returnType(request.getSession());
		if( type != null && type.equals(GlobalConstants.user_type)){
			return "/index";
		}else{
			return "/login";
		}
	}
	
	
	
	@RequestMapping(value="/toLogin")
	public String toLogin(){
		return "login";
	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView login(Login login,HttpSession httpSession,String type,HttpServletRequest request){
		
		ModelAndView mv = null;
		if(type.equals("0")){
			User user = loginDao.findUser(login);
			if(user == null){
				mv = new ModelAndView("login");
				mv.addObject("errorCode",GlobalConstants.login_user_not_found);
			}else{
				if(user.getU_password().equals(login.getPassword())){
					mv = new ModelAndView("index");
					mv.addObject("User",user);
					request.setAttribute("User",user);
					UserSessionHelper.userLogin(httpSession, user,GlobalConstants.user_type);
				}else{
					mv = new ModelAndView("login");
					mv.addObject("errorCode",GlobalConstants.login_wrong_password);
				}
			}	
			return mv;
		}else{
			Admin admin = loginDao.findAdmin(login);
			if(admin == null){
				mv = new ModelAndView("login");
				mv.addObject("errorCode",GlobalConstants.login_user_not_found);
			}else{
				if(admin.getA_password().equals(login.getPassword())){
					mv = new ModelAndView(new RedirectView("bike/get"));
					mv.addObject("Admin",admin);
					request.setAttribute("Admin",admin);
					UserSessionHelper.adminLogin(httpSession, admin,GlobalConstants.admin_type);
				}else{
					mv = new ModelAndView("login");
					mv.addObject("errorCode",GlobalConstants.login_wrong_password);
				}
			}
			return mv;
		}
	}
}
