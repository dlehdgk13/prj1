package com.group4.erp.controller;

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
import com.group4.erp.ManyChartDTO;
import com.group4.erp.dao.ManyChartDAO;
import com.group4.erp.service.LoginService;



@Controller
public class CharController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private ManyChartDAO manyDAO;
	
	
	@RequestMapping(value="/goMyChart.do")
	public ModelAndView chartForm(
			ManyChartDTO manychartDTO
			) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("manyChart.jsp");
		
		
		try {
			
			List<ManyChartDTO> perBookCat = this.manyDAO.getPerBookCat();
			mav.addObject("perBookCat", perBookCat);
			
			List<ManyChartDTO> perCorpArea = this.manyDAO.getPerCorpArea();
			mav.addObject("perCorpArea", perCorpArea);
			
			ManyChartDTO perLine = this.manyDAO.getPerLine();
			mav.addObject("perLine", perLine);
			
			ManyChartDTO perMember = this.manyDAO.getPerMember();
			mav.addObject("perMember", perMember);
			
			ManyChartDTO perLeave = this.manyDAO.getPerLeave();
			mav.addObject("perLeave", perLeave);
			
			List<ManyChartDTO> perOnlineOrder = this.manyDAO.getPerOnlineOrder();
			mav.addObject("perOnlineOrder", perOnlineOrder);
			
		}catch(Exception e) {
			System.out.println("<차트 불러오기 실패>");
			System.out.println("예외 발생 =>"+e);
		}
		
		return mav;
	}
	
}
