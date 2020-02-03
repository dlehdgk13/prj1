package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import com.group4.erp.EmpApprovalCheckDTO;
import com.group4.erp.EmployeeDTO;
import com.group4.erp.ManyChartDTO;



public interface ManyChartDAO {

	List<ManyChartDTO> getPerBookCat();

	List<ManyChartDTO> getPerCorpArea();
	
	ManyChartDTO getPerLine();
	
	ManyChartDTO getPerMember();
	
	ManyChartDTO getPerLeave();

	List<ManyChartDTO> getPerOnlineOrder();
}
