package com.group4.erp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.erp.ApprovalDTO;
import com.group4.erp.ApprovalSearchDTO;
import com.group4.erp.dao.ApprovalDAO;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	ApprovalDAO approvalDAO;

	@Override
	public int insertApproval(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		System.out.println("Service insertApproval() 메소드 실행");
		int insertCnt = this.approvalDAO.insertApproval(approvalDTO);
		
		return insertCnt;
	}

	@Override
	public List<ApprovalDTO> getApprovalReqList(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		List<ApprovalDTO> approvalReqList = this.approvalDAO.getApprovalReqList(approvalSearchDTO);
		
		return approvalReqList;
	}

	@Override
	public int getApprovalReqCnt(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		int approvalReqCnt = this.approvalDAO.getApprovalReqCnt(approvalSearchDTO);
		
		return approvalReqCnt;
	}

	@Override
	public int getApprovalResCnt(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		int approvalToCnt = this.approvalDAO.getApprovalResCnt(approvalSearchDTO);
		
		return approvalToCnt;
	}

	@Override
	public List<ApprovalDTO> getApprovalResList(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		List<ApprovalDTO> approvalResList = this.approvalDAO.getApprovalResList(approvalSearchDTO);
		
		return approvalResList;
	}

	@Override
	public int updateApprovalState(String document_no) {
		// TODO Auto-generated method stub
		int approvalState = this.approvalDAO.updateApprovalState(document_no);
		
		return approvalState;
	}

	@Override
	public int updateEventState(String document_no) {
		// TODO Auto-generated method stub
		int eventState = this.approvalDAO.updateEventState(document_no);
		
		return eventState;
	}

	@Override
	public int insertApproval_dayOff(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		int approval_dayOffCnt = this.approvalDAO.insertApproval_dayOff(approvalDTO);
		
		return approval_dayOffCnt;
	}

	@Override
	public int updateApprovalProc(ApprovalDTO approvalDTO) {
		// TODO Auto-generated method stub
		int updateApprovalCnt = this.approvalDAO.updateApprovalProc(approvalDTO);
		
		return updateApprovalCnt;
	}

	@Override
	public int getApprovalCEOResCnt(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		int approvalCEOCnt = this.approvalDAO.getApprovalCEOResCnt(approvalSearchDTO);
		
		return approvalCEOCnt;
	}

	@Override
	public List<ApprovalDTO> getApprovalCEOResList(ApprovalSearchDTO approvalSearchDTO) {
		// TODO Auto-generated method stub
		List<ApprovalDTO> approvalResList = this.approvalDAO.getApprovalCEOResList(approvalSearchDTO);
		
		return approvalResList;
	}

}
