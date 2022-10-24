package kr.ac.kopo.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDAO {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	public MemberVO selectByRegNo(Map<String, Object> memberVO) {
		return sqlSessionTemplate.selectOne("dao.MemberDAO.selectByRegNo", memberVO);
	}

	public void processCreateMember(Map<String, Object> memberVO) {
		sqlSessionTemplate.selectOne("dao.MemberDAO.processCreateMember", memberVO);
	}
}
