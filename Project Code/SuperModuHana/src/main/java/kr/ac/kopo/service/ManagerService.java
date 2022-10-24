package kr.ac.kopo.service;

import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.ManagerDAO;
import kr.ac.kopo.vo.ManagerVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ManagerService {

	private final ManagerDAO managerDAO;
	
	public ManagerVO login(ManagerVO managerVO) {
		return managerDAO.selectByIdAndPwd(managerVO);
	}

}
