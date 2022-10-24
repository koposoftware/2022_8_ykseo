package kr.ac.kopo.vo;

import lombok.Data;

@Data
public class TransactionVO {
	
	private String transactionSeq;
	private String activeAcctNo;
	private String typeCode;
	private String typeName;
	private String name;
	private String amount;
	private String balance;
	private String dealBankCode;
	private String dealBankName;
	private String dealAcctNo;
	private String dealName;
	private String regDate;
	
}
