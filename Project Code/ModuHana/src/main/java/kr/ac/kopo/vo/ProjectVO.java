package kr.ac.kopo.vo;

import lombok.Data;

@Data
public class ProjectVO {

	private String projectSeq;	// 프로젝트 번호
	private String subjectNo;	// 프로젝트 분야 코드
	private String subjectName;	// 프로젝트 분야명
	private String signImgPath;	// 대표이미지 경로
	private String signImgName;	// 대표이미지 파일명
	private String title;	// 프로젝트 제목
	private String summary;	// 프로젝트 요약소개
	private String content;	// 프로젝트 소개
	private String fundAmt;	// 현재모집금액
	private String fundAmtPer;	// 현재모집량
	private String minFundUnit;	// 최소투자단위
	private String maxFundUnit;	// 최대투자단위
	private String minFundAmt;	// 최소모집금액
	private String maxFundAmt;	// 최대모집금액
	private String fundStart;	// 모집시작일
	private String fundEnd;		// 모집마감일
	private String startDDay;	// 모집까지 디데이
	private String endDDay;		// 모집마감까지 디데이
	private String progressCode;	// 프로젝트 진행상태 코드
	private String progressName;	// 프로젝트 진행상태명
	private String regDate;		// 등록일시
	private String applyDate;	// 신청일시
	private String aprvDate;	// 승인일시

	private String corpRegNo; // 사업자등록 번호
	private String corpName; // 회사명
	private String accountNo; // 별단계좌 번호
	private String estBep; // 추정 손익분기점
	private String securityType; // 증권코드
	private String securityName; // 증권명
	private String repaymentCode; // 상환방법코드
	private String repaymentName; // 상환방법명
	private String securityDate; // 증권 발행일
	private String securityExpire; // 증권 만기일
	private String repayment; // 상환금
	private String repaymentDate; // 상환금 정산일

}
