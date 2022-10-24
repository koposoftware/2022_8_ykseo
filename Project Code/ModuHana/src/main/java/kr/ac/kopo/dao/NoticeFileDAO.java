package kr.ac.kopo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.NoticeFileVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class NoticeFileDAO {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	public List<NoticeFileVO> selectByNoticeSeq(String noticeSeq) {
		return sqlSessionTemplate.selectList("dao.NoticeFileDAO.selectByNoticeSeq", noticeSeq);
	}

}
