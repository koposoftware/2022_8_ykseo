package kr.ac.kopo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.NoticeDAO;
import kr.ac.kopo.vo.NoticeVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeService {

	private final NoticeDAO noticeDAO;
	
	public List<NoticeVO> getNoticeListByProjectSeq(String projectSeq) {
		return noticeDAO.selectByProjectSeq(projectSeq);
	}

	public NoticeVO getNoticeByNoticeSeq(String noticeSeq) {
		return noticeDAO.selectByNoticeSeq(noticeSeq);
	}

}
