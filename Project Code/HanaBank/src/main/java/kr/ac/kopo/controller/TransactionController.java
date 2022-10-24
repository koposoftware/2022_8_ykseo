package kr.ac.kopo.controller;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.service.TransactionService;
import kr.ac.kopo.vo.MessageVO;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class TransactionController {

	private final TransactionService transactionService;

	@RequestMapping(value = "/transaction", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public ResponseEntity<MessageVO> transaction(@RequestParam Map<String, Object> reqParam) {
		return transactionService.getTransactionList(reqParam);
	}

	@RequestMapping(value = "/transfer", method = RequestMethod.PUT, produces = "application/json; charset=utf8")
	public ResponseEntity<MessageVO> transfer(@RequestBody Map<String, Object> reqParam) {
		return transactionService.transfer(reqParam);
	}
	
	@RequestMapping(value = "/multitransfer", method = RequestMethod.PUT, produces = "application/json; charset=utf8")
	public ResponseEntity<MessageVO> multitransfer(@RequestBody Map<String, Object> reqParam) {
		return transactionService.multiTransfer(reqParam);
	}
}
