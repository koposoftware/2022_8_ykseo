package kr.ac.kopo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.AccountVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AccountDAO {

	private final SqlSessionTemplate sqlSessionTemplate;

	public AccountVO selectByMemberId(String id) {
		return sqlSessionTemplate.selectOne("dao.AccountDAO.selectByMemberId", id);
	}

	public void insert(AccountVO newAccount) {
		sqlSessionTemplate.insert("dao.AccountDAO.insert", newAccount);
	}
}
