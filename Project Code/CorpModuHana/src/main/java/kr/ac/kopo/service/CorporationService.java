package kr.ac.kopo.service;

import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.CorporationDAO;
import kr.ac.kopo.vo.CorporationVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CorporationService {
	
	private final CorporationDAO corporationDAO;

	public CorporationVO login(CorporationVO corporationVO) {
		return corporationDAO.selectByRegNoAndPwd(corporationVO);
	}
	
	public CorporationVO getCorporationVOByRegNo(String regNo) {
		return corporationDAO.selectByRegNo(regNo);
	}

	public void updateUserInfoEmailTelAndAddress(CorporationVO corporationVO) {
		corporationDAO.updateEmailTelAndAddressByRegNo(corporationVO);
	}

}
