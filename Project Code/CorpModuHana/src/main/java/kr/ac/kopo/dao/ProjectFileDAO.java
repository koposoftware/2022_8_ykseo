package kr.ac.kopo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.ProjectFileVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ProjectFileDAO {

	private final SqlSessionTemplate sqlSessionTemplate;

	public void insert(ProjectFileVO projectFileVO) {
		sqlSessionTemplate.insert("dao.ProjectFileDAO.insert", projectFileVO);
	}

	public void insertList(List<ProjectFileVO> fileList) {
		int count = sqlSessionTemplate.insert("dao.ProjectFileDAO.insertList", fileList);
		System.out.println("insertCount : " + count);
	}
}
