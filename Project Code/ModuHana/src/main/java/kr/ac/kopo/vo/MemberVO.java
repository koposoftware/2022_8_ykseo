package kr.ac.kopo.vo;

import lombok.Data;

@Data
public class MemberVO {

	private String id;
	private String pwd;
	private String name;
	private String sex;
	private String email;
	private String phone;
	private String regNoFront;
	private String regNoBack;
	private String countryCode;
	private String countryName;
	private String basicAddr;
	private String detailAddr;
	private String post;
	private String regDate;

	
}
