package kr.ac.kopo.test;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.dao.ProjectFileDAO;
import kr.ac.kopo.vo.ProjectFileVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })
public class ProjectFileTest {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private ProjectFileDAO projectFileDAO;

	@Test
	public void myBatisT() {
		assertNotNull(sqlSessionTemplate);
	}

	@Test
	public void selectByProjectFileSeq() {
		List<String> list = new ArrayList<>();
		list.add("0");
		list.add("1");
		List<ProjectFileVO> projectFileList = projectFileDAO.selectByProjectSeqAndTypeCode("1", list);
		for (ProjectFileVO projectFileVO : projectFileList) {
			System.out.println(projectFileVO);
		}
	}

}