package kr.ac.kopo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ApiKeyDAO {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	public String selectByApikey(String apiKey) {
		return sqlSessionTemplate.selectOne("dao.ApiKeyDAO.selectByApikey", apiKey);
	}
}
