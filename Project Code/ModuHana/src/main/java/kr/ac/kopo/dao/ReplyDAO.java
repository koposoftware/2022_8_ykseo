package kr.ac.kopo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.ReplyVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ReplyDAO {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	public List<ReplyVO> selectByProjectSeq(String projectSeq) {
		return sqlSessionTemplate.selectList("dao.ReplyDAO.selectByProjectSeq", projectSeq);
	}

	public void insertReply(ReplyVO replyVO) {
		System.out.println(replyVO);
		sqlSessionTemplate.insert("dao.ReplyDAO.insert", replyVO);
	}

}
