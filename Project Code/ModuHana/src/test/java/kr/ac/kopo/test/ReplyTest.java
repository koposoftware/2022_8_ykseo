package kr.ac.kopo.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.dao.ReplyDAO;
import kr.ac.kopo.vo.ReplyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })
public class ReplyTest {

	@Autowired
	private ReplyDAO replyDAO;

	@Test
	public void selectByProjectSeq() {
		List<ReplyVO> reply = replyDAO.selectByProjectSeq("1");
		for (ReplyVO replyVO : reply) {
			System.out.println(replyVO);
		}
	}

//	@Test
//	public void insert() {
//		ReplyVO replyVO = new ReplyVO();
//		List<ReplyVO> reply = replyDAO.selectByProjectSeq("1");
//		for (ReplyVO replyVO : reply) {
//			System.out.println(replyVO);
//		}
//	}

}