package kr.ac.kopo.test;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.dao.ProjectDAO;
import kr.ac.kopo.vo.ProjectVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })
public class ProjectTest {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private ProjectDAO projectDAO;

	@Test
	public void myBatisT() {
		assertNotNull(sqlSessionTemplate);
	}

	@Test
	public void blockCreateNullProjectReturnProjectSeq() {
		ProjectVO projectVO = new ProjectVO();
		projectVO.setCorpRegNo("1");
		String projectSeq =  projectDAO.blockInsertReturnProjectSeq(projectVO);
		System.out.println(projectSeq);
	}


}