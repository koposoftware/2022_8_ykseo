package kr.ac.kopo.test;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;

import org.junit.Ignore;
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

	@Ignore
	@Test
	public void myBatisT() {
		assertNotNull(sqlSessionTemplate);
	}

	@Ignore
	@Test
	public void selectBySubjectNo() {
		ArrayList<ProjectVO> projectList = (ArrayList<ProjectVO>) projectDAO.selectBySubjectNo("10");
		System.out.println(projectList.size());
		for (ProjectVO projectVO : projectList) {
			System.out.println(projectVO);
		}

	}

	@Ignore
	@Test
	public void selectAll() {
		ArrayList<ProjectVO> projectList = (ArrayList<ProjectVO>) projectDAO.selectAll();
		System.out.println(projectList.size());
		for (ProjectVO projectVO : projectList) {
			System.out.println(projectVO);
		}

	}

	@Test
	public void selectByProjectSeq() {
		ProjectVO project = projectDAO.selectByProjectSeq("8");
		System.out.println(project);
	}

}