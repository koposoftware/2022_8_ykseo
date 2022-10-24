package kr.ac.kopo.vo;

import lombok.Data;

@Data
public class AccountVO {

	private String accountNo;
	private String memberId;
	private String password;
	private String name;
	private String balance;
	private String typeCode;
	private String typeName;
	private String available;
	private String regDate;

}
