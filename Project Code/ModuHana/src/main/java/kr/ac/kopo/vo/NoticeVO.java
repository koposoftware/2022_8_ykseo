package kr.ac.kopo.vo;

import lombok.Data;

@Data
public class NoticeVO {

	private String noticeSeq;
	private String projectSeq;
	private String title;
	private String writer;
	private String content;
	private String viewCnt;
	private String regDate;
	
}
