package com.bike.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bike.Dao.UserDao;

@Controller
@RequestMapping(value="admin/")
public class AdminController {
	
	@Autowired
	private UserDao userDao;
	@Autowired
	private HttpServletRequest request;
	
}
