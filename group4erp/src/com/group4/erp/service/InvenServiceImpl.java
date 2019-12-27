package com.group4.erp.service;

import com.group4.erp.Cus_releaseInfoDTO;
import com.group4.erp.InvenDTO;
import com.group4.erp.InvenSearchDTO;
import com.group4.erp.ReturnOrderDTO;
import com.group4.erp.dao.*;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class InvenServiceImpl implements InvenService{

   @Autowired
   private InvenDAO invenDAO;

   public List<Map<String,String>> getBookList(InvenSearchDTO invenSearchDTO) {

		List<Map<String,String>> getBookList = this.invenDAO.getBookList(invenSearchDTO);
		
		return getBookList;
		
	}
   

	public List<Map<String, String>> getInvenLoc(InvenSearchDTO invenSearchDTO){
		
		List<Map<String,String>> getInventory_loc = this.invenDAO.getInvenLoc(invenSearchDTO);
		
		return getInventory_loc;
	}
	
	public int getBookListCnt(InvenSearchDTO invenSearchDTO) {
		
		int bookListCnt = this.invenDAO.getBookListCnt(invenSearchDTO);
		
		return bookListCnt;
	}
	
	public List<Map<String, String>> getPublisher(InvenSearchDTO invenSearchDTO){
		
		List<Map<String, String>> publisher = this.invenDAO.getPublisher(invenSearchDTO);
		
		return publisher;
	}
	

	public int getReleaseListCnt(InvenSearchDTO invenSearchDTO) {
		
		int releaseListCnt = this.invenDAO.getReleaseListCnt(invenSearchDTO);
		
		return releaseListCnt;
	}
	
	public List<Map<String,String>> getReleaseList(InvenSearchDTO invenSearchDTO){
		
		List<Map<String,String>> getReleaseList = this.invenDAO.getReleaseList(invenSearchDTO);
		
		return getReleaseList;
	}
	

	public Cus_releaseInfoDTO getReleaseCusInfo(int all_order_no) {

		Cus_releaseInfoDTO cus_order = this.invenDAO.getReleaseCusInfo(all_order_no);
		
		return cus_order;
	}
	
	public Cus_releaseInfoDTO getReleaseCorpInfo(int all_order_no) {

		Cus_releaseInfoDTO corp_order = this.invenDAO.getReleaseCorpInfo(all_order_no);
		
		return corp_order;
	}
	public int getReturnOrderCnt() {
		int returnOrderCnt = this.invenDAO.getReturnOrderCnt();
		
		return returnOrderCnt;
	}
	
	public List<ReturnOrderDTO> getReturnOrderList() {
		List<ReturnOrderDTO> returnOrderList = this.invenDAO.getReturnOrderList();
		
		return returnOrderList;

	}
	
	public int getSignUpCnt(InvenDTO invenDTO) {
		
		int insertSignUpBookCnt = this.invenDAO.getSignUpCnt(invenDTO);
		
		return insertSignUpBookCnt;
	}
}
