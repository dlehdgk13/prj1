package com.group4.client;

import java.util.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.group4.erp.EmpApprovalCheckDTO;
import com.group4.erp.EmployeeDTO;
import com.group4.erp.service.LoginService;



@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;	
	
	
	
}
