package kr.ac.kopo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.ReplyDAO;
import kr.ac.kopo.vo.ReplyVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReplyService {

	private final ReplyDAO replyDAO;
	
	public List<ReplyVO> getReplyListByProjectSeq(String projectSeq) {
		return replyDAO.selectByProjectSeq(projectSeq);
	}

	public void registerReply(ReplyVO replyVO) {
		replyDAO.insertReply(replyVO);
	}

}
