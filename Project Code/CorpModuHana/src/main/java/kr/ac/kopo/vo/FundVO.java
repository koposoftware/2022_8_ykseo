package kr.ac.kopo.vo;

import lombok.Data;

@Data
public class FundVO {

	private String fundSeq;
	private String projectSeq;
	private String projectTitle;
	private String projectExpireDate;
	private String memberAccountNo;
	private String memberId;
	private String memberEmail;
	private String memberName;
	private String amount;
	private String fundDate;
	private String proceeds;
	private String tax;
	private String fee;
	private String payoff;
	private String payoffStatus;
	private String payoffDate;

}
