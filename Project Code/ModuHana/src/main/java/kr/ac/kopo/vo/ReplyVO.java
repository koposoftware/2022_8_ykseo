package kr.ac.kopo.vo;

import lombok.Data;

@Data
public class ReplyVO {

	private String replySeq;
	private String projectSeq;
	private String userId;
	private String superReply;
	private String content;
	private String depth;
	private String regDate;
}
