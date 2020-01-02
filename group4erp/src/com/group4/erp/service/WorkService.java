package com.group4.erp.service;
import java.util.List;
import java.util.Map;

import com.group4.erp.BusinessTripDTO;
import com.group4.erp.BusinessTripSearchDTO;


public interface WorkService {
	
	//출장 리스트
	List<Map<String, String>> getbusinessTripList(BusinessTripSearchDTO businessTripSearchDTO);
	
	//출장 리스트 총개수
	int getbusinessTripListAllCnt(BusinessTripSearchDTO businessTripSearchDTO);
	
	//게시판 1개 목록
	BusinessTripDTO getbusinessTripDTO(int work_outside_seq);
}
