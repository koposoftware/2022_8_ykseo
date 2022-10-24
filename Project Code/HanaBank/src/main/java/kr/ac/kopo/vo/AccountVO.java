package kr.ac.kopo.vo;

import lombok.Data;

@Data
public class AccountVO {
	
	private long accountNo;
	private String name;
	private int balance;
	private String typeCode;
	private String typeName;
	private String available;
	private String regDate;
}
