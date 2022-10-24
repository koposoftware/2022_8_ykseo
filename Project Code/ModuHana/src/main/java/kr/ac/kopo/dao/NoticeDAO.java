package kr.ac.kopo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.NoticeVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class NoticeDAO {

	private final SqlSessionTemplate sqlSessionTemplate;

	public List<NoticeVO> selectByProjectSeq(String projectSeq) {
		return sqlSessionTemplate.selectList("dao.NoticeDAO.selectByProjectSeq", projectSeq);
	}

	public NoticeVO selectByNoticeSeq(String noticeSeq) {
		return sqlSessionTemplate.selectOne("dao.NoticeDAO.selectByNoticeSeq", noticeSeq);
	}

}
