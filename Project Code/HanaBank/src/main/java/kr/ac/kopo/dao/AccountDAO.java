package kr.ac.kopo.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.AccountVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AccountDAO {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	public String procedureCreateAccount(Map<String, Object> accountVO) {
		System.out.println("accountDAO - accountVO : " + accountVO);
		sqlSessionTemplate.selectOne("dao.AccountDAO.procedureCreateAccount", accountVO);
		System.out.println(accountVO.get("accountNo"));
		return (String) accountVO.get("accountNo");
	}

	public AccountVO selectByAccountNo(String accountNo) {
		return sqlSessionTemplate.selectOne("dao.AccountDAO.selectByAccountNo", accountNo);
	}
}
