package kr.ac.kopo.test;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.dao.MemberDAO;
import kr.ac.kopo.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })
public class MemberTest {

	@Autowired
	private MemberDAO memberDAO;

	@Test
	public void selectByRegNo() {
		Map<String, Object> memberVO = new HashMap<>();
		memberVO.put("RegNoFront", "111111");
		memberVO.put("RegNoBack", "1111111");

		MemberVO member = memberDAO.selectByRegNo(memberVO);
		System.out.println("new member : " + member);
	}

	@Test
	public void processCreateMember() {
		Map<String, Object> memberVO = new HashMap<>();
		memberVO.put("RegNoFront", "111111");
		memberVO.put("RegNoBack", "1111111");
		memberVO.put("name", "누군가");

		memberDAO.processCreateMember(memberVO);
	}

}