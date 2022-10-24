package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.service.MessageService;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class MessageController {

	private final MessageService messageService;
	
	@RequestMapping(value = "/auth", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public void auth(@RequestBody String jsonData, HttpSession session) {
		
		JSONObject jObject = new JSONObject(jsonData);
		String tel = jObject.getString("tel");
		System.out.println(tel);
		
		int authNum = messageService.sendAuthNumberMessage(tel);
		session.setAttribute("authNum", authNum);
	}
	
	@RequestMapping(value = "/auth/check", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public ResponseEntity<?> check(@RequestBody String jsonData, HttpSession session) {
		
		JSONObject jObject = new JSONObject(jsonData);
		String authNum = jObject.getString("authNum");
		System.out.println("authNum : " + authNum);
		
		String num = String.valueOf(session.getAttribute("authNum"));
		System.out.println("num : " + num);
		
		System.out.println(authNum.equals(num));
		if (num != null && authNum.equals(num)) {
			System.out.println("성공");
			return new ResponseEntity<>("성공", HttpStatus.OK);
		}
		
		return new ResponseEntity<>("실패", HttpStatus.SERVICE_UNAVAILABLE);
	}
}
