package kr.ac.kopo.test;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.dao.NoticeFileDAO;
import kr.ac.kopo.vo.NoticeFileVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })
public class NoticeFileTest {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private NoticeFileDAO noticeFileDAO;

	@Test
	public void myBatisT() {
		assertNotNull(sqlSessionTemplate);
	}

	@Test
	public void selectByNoticeFileSeq() {
		List<NoticeFileVO> noticeFileList = noticeFileDAO.selectByNoticeSeq("1");
		for (NoticeFileVO noticeFileVO : noticeFileList) {
			System.out.println(noticeFileVO);
		}
	}

}