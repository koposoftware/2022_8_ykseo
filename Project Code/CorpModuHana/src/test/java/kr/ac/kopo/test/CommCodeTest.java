package kr.ac.kopo.test;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.dao.CommCodeDAO;
import kr.ac.kopo.vo.CommCodeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })
public class CommCodeTest {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private CommCodeDAO commCodeDAO;

	@Test
	public void myBatisT() {
		assertNotNull(sqlSessionTemplate);
	}

	@Test
	public void selectByCodeId() {
		ArrayList<CommCodeVO> commCodeList = (ArrayList<CommCodeVO>) commCodeDAO.selectByCodeId("100");
		System.out.println(commCodeList.size());
		for (CommCodeVO commCodeVO : commCodeList) {
			System.out.println(commCodeVO);
		}

	}

}