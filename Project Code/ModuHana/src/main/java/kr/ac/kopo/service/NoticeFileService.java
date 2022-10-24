package kr.ac.kopo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.NoticeFileDAO;
import kr.ac.kopo.vo.NoticeFileVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeFileService {

	private final NoticeFileDAO noticeFileDAO;

	public List<NoticeFileVO> getNoticeFileListByNoticeSeq(String noticeSeq) {
		return noticeFileDAO.selectByNoticeSeq(noticeSeq);
	}

}
