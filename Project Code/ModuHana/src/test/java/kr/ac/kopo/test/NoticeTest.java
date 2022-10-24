package kr.ac.kopo.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.dao.NoticeDAO;
import kr.ac.kopo.vo.NoticeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })
public class NoticeTest {

	@Autowired
	private NoticeDAO noticeDAO;

	@Test
	public void selectByCodeId() {
		List<NoticeVO> noticeList = noticeDAO.selectByProjectSeq("1");
		for (NoticeVO noticeVO : noticeList) {
			System.out.println(noticeVO);
		}
	}

}