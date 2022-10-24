package kr.ac.kopo.controller;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.service.AccountService;
import kr.ac.kopo.vo.MessageVO;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class AccountController {

	private final AccountService accountService;
	
	@RequestMapping(value = "/account/creation", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public ResponseEntity<MessageVO> creation(@RequestBody Map<String, Object> jsonObject) {
		return accountService.createAccount(jsonObject);
	}

	@RequestMapping(value = "/account", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public ResponseEntity<MessageVO> account(@RequestParam Map<String, Object> reqParam) {
		return accountService.getAccountInfo(reqParam);
		
	}

}
