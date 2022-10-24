package kr.ac.kopo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.ManagerVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ManagerDAO {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	public ManagerVO selectByIdAndPwd(ManagerVO managerVO) {
		return sqlSessionTemplate.selectOne("dao.ManagerDAO.selectByIdAndPwd", managerVO);
	}

}
