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
	
	public List<CommCodeVO> getCommCodeByCodeId(String codeId){
		return commCodeDAO.selectByCodeId(codeId); 
	}
}
