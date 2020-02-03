package com.group4.erp.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group4.erp.EmpApprovalCheckDTO;
import com.group4.erp.EmployeeDTO;
import com.group4.erp.ManyChartDTO;


//[DAO 클래스]인 [LoginDAOImpl 클래스]선언
	//@Repository를 붙임으로써 DAO클래스 임을 지정하게되고, bean 태그로 자동 등록된다
@Repository
public class ManyChartDAOImpl implements ManyChartDAO {
	
	//SqlSessionTemplate객체를 생성해 속성변수 sqlSession에 저장
	//속성변수 sqlSession 선언하고, @Autowired에 의해 SqlSessionTemplate클래스를 객체화하여 저장한다
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public List<ManyChartDTO> getPerBookCat() {
		
		List<ManyChartDTO> perBookCat = this.sqlSession.selectList(
				"com.group4.erp.dao.manyChartDAO.getPerBookCat"
				);
		
		return perBookCat;
	}
	
	public List<ManyChartDTO> getPerCorpArea(){
		
		List<ManyChartDTO> perCorpArea = this.sqlSession.selectList(
				"com.group4.erp.dao.manyChartDAO.getPerCorpArea"
				);
		
		return perCorpArea;
	}
	
	public ManyChartDTO getPerLine() {
		
		ManyChartDTO perLine = this.sqlSession.selectOne(
				"com.group4.erp.dao.manyChartDAO.getPerLine"
				);
		
		return perLine;
	}
	
	public ManyChartDTO getPerMember() {
		
		ManyChartDTO perMember = this.sqlSession.selectOne(
				"com.group4.erp.dao.manyChartDAO.getPerMember"
				);
		
		return perMember;
	}

	public ManyChartDTO getPerLeave() {
		
		ManyChartDTO perLeave = this.sqlSession.selectOne(
				"com.group4.erp.dao.manyChartDAO.getPerLeave"
				);
		
		return perLeave;
	}
	
	public List<ManyChartDTO> getPerOnlineOrder(){
		
		List<ManyChartDTO> perOnlineOrder = this.sqlSession.selectList(
				"com.group4.erp.dao.manyChartDAO.getPerOnlineOrder"
				);
		
		return perOnlineOrder;
	}
}
