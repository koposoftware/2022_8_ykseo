package kr.ac.kopo.controller;

import java.util.List;

import org.json.JSONObject;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.service.FundService;
import kr.ac.kopo.vo.FundVO;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class FundController {

	private final FundService fundService;

	@RequestMapping(value = "/payoff", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public List<FundVO> payoff(@RequestBody String jsonData) {
		System.out.println("도착하니..?");
		
		JSONObject jObject = new JSONObject(jsonData);
		String projectSeq = String.valueOf(jObject.getInt("projectSeq"));
		
		List<FundVO> fundList = fundService.payoff(projectSeq);
		
		return fundList;
	}
}
