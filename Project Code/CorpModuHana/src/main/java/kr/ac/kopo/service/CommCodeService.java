package kr.ac.kopo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.CommCodeDAO;
import kr.ac.kopo.vo.CommCodeVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommCodeService {

	private final CommCodeDAO commCodeDAO;
	
	private List<CommCodeVO> getCommCodeByCodeId(String codeId) {
		return commCodeDAO.selectByCodeId(codeId);
	}

	public List<CommCodeVO> getSubjectList() {
		return getCommCodeByCodeId("210");
	}

	public List<CommCodeVO> getSecurityTypeList() {
		return getCommCodeByCodeId("110");
	}

	public List<CommCodeVO> getRepaymentCodeList() {
		return getCommCodeByCodeId("120");
	}
	
	public List<CommCodeVO> getProgressList() {
		return getCommCodeByCodeId("200");
	}
}
