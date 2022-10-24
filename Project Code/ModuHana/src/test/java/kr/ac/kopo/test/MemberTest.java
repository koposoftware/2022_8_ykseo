package kr.ac.kopo.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.dao.MemberDAO;
import kr.ac.kopo.service.MemberService;
import kr.ac.kopo.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })
public class MemberTest {

	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberDAO memberDAO;

	@Test
	public void selectByIdAndPwd() {
		MemberVO user = new MemberVO();
		user.setId("10");
		user.setPwd("10");

		MemberVO memberVO = memberService.login(user);
		System.out.println(memberVO);
	}
	
	@Test
	public void selectAllINfoById() {
		MemberVO memberVO = memberDAO.selectAllINfoById("1");
		System.out.println(memberVO);
	}

}