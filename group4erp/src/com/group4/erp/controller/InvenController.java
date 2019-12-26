package com.group4.erp.controller;


import com.group4.erp.service.*;
import com.group4.erp.*;
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



@Controller
public class InvenController {

	
	@Autowired
	private InvenService invenService;	
	
	@RequestMapping(value="/goBookList.do")
	public ModelAndView goBookInvenList(
			HttpSession session
			,InvenSearchDTO invenSearchDTO
		) {
		
		ModelAndView mav = new ModelAndView();
		//mav.setViewName("eventScheduleForm.jsp");
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewInventoryList");	//viewInventoryList 아무 이름이나 설정 가능. 메인 페이지에서 해당 메뉴 뜰 때 해당 페이지를 임포트하기 위해서 붙이는 플래그명
		try {
			
			List<Map<String, String>> publisher = this.invenService.getPublisher(invenSearchDTO);
			mav.addObject("publisher",publisher);
			
			List<Map<String, String>> inventory_loc = this.invenService.getInvenLoc(invenSearchDTO);
			mav.addObject("inventory_loc", inventory_loc);
			
			int bookListCnt = this.invenService.getBookListCnt(invenSearchDTO);
			mav.addObject("bookListCnt", bookListCnt);
			
			if(bookListCnt>0) {
				//선택한 페이지 번호 구하기
				int selectPageNo = invenSearchDTO.getSelectPageNo();
				//한 화면에 보여지는 행의 개수 구하기
				int rowCntPerPage = invenSearchDTO.getRowCntPerPage();
				//검색할 시작행 번호 구하기
				int beginRowNo = (selectPageNo*rowCntPerPage-rowCntPerPage+1);
				//만약 검색한 총 개수가 검색할 시작행 번호보다 작으면 선택한페이지 번호를 1로 세팅하기
				if(bookListCnt<beginRowNo) invenSearchDTO.setSelectPageNo(1);
			}
			
			List<Map<String, String>> BookList = this.invenService.getBookList(invenSearchDTO);
			mav.addObject("BookList", BookList);
		}catch(Exception e) {
			System.out.println("<게시글 불러오기 실패>");
			System.out.println("예외발생 =>"+e);
		}
		return mav;
	}
	

	@RequestMapping(value="/goReleaseList.do")
	public ModelAndView goBookReleaseInfo(
			HttpSession session
			,InvenSearchDTO invenSearchDTO
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewReleaseList");
		
		try {
			
			List<Map<String, String>> publisher = this.invenService.getPublisher(invenSearchDTO);
			mav.addObject("publisher",publisher);
			
			List<Map<String, String>> inventory_loc = this.invenService.getInvenLoc(invenSearchDTO);
			mav.addObject("inventory_loc", inventory_loc);
			
			int releaseListCnt = this.invenService.getReleaseListCnt(invenSearchDTO);
			mav.addObject("releaseListCnt", releaseListCnt);
			
			if(releaseListCnt>0) {
				//선택한 페이지 번호 구하기
				int selectPageNo = invenSearchDTO.getSelectPageNo();
				//한 화면에 보여지는 행의 개수 구하기
				int rowCntPerPage = invenSearchDTO.getRowCntPerPage();
				//검색할 시작행 번호 구하기
				int beginRowNo = (selectPageNo*rowCntPerPage-rowCntPerPage+1);
				//만약 검색한 총 개수가 검색할 시작행 번호보다 작으면 선택한페이지 번호를 1로 세팅하기
				if(releaseListCnt<beginRowNo) invenSearchDTO.setSelectPageNo(1);
			}
			
			List<Map<String, String>> releaseList = this.invenService.getReleaseList(invenSearchDTO);
			mav.addObject("releaseList", releaseList);
		}catch(Exception e) {
			System.out.println("<출고형황 불러오기 실패>");
			System.out.println("예외발생 =>"+e);
		}
		
		return mav;
	}
	
	@RequestMapping(value="/goReleaseContentForm.do")
	public ModelAndView goReleaseContentForm(
			@RequestParam(value="all_order_no") int all_order_no
			,Cus_releaseInfoDTO cus_releaseInfoDTO
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewReleaseContent");
		
		String orderSize = all_order_no+"";
		
		try {
			
			if(orderSize.length()==10) {
				Cus_releaseInfoDTO cus_order = this.invenService.getReleaseCusInfo(all_order_no);
				mav.addObject("cus_order", cus_order);
			}else {
				Cus_releaseInfoDTO corp_order = this.invenService.getReleaseCorpInfo(all_order_no);
				mav.addObject("corp_order", corp_order);
			}
			
			mav.addObject("orderSize", orderSize);
		}catch(Exception e) {
			System.out.println("<출고 상세 정보 불러오기 실패>");
			System.out.println("예외발생 =>"+e);
		}
		
		
		return mav;
	}
		

	@RequestMapping(value="/goReturnOrderList.do")
	public ModelAndView goReturnOrderList(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("main.jsp");
		mav.addObject("subMenu", "viewReturnOrderList");
		
		try {
			int returnOrderCnt = this.invenService.getReturnOrderCnt();
			List<ReturnOrderDTO> returnOrderList = this.invenService.getReturnOrderList();
			
			mav.addObject("returnOrderCnt", returnOrderCnt);
			mav.addObject("returnOrderList", returnOrderList);
			
		} catch(Exception e) {
			System.out.println("예외발생"+e);
		}
		
		return mav;

	}
}

  