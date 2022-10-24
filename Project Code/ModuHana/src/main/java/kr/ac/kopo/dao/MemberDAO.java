package kr.ac.kopo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDAO {

	private final SqlSessionTemplate sqlSessionTemplate;

	public MemberVO selectByIdAndPwd(MemberVO memberVO) {
		return sqlSessionTemplate.selectOne("dao.MemberDAO.selectByIdAndPwd", memberVO);
	}

	public MemberVO selectById(MemberVO memberVO) {
		return sqlSessionTemplate.selectOne("dao.MemberDAO.selectById", memberVO);
	}

	public void insert(MemberVO memberVO) {
		sqlSessionTemplate.insert("dao.MemberDAO.insert", memberVO);
	}

	public void updateRegNo(MemberVO memberVO) {
		sqlSessionTemplate.update("dao.MemberDAO.updateRegNo", memberVO);
	}

	public MemberVO selectAllINfoById(String id) {
		return sqlSessionTemplate.selectOne("dao.MemberDAO.selectAllINfoById", id);
	}
}
