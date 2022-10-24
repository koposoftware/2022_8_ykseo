package kr.ac.kopo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.ProjectDAO;
import kr.ac.kopo.vo.ProjectVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProjectService {

	private final ProjectDAO projectDAO;

	public List<ProjectVO> getProjectList(String subjectNo) {
		if (subjectNo.equals("all")) {
			return projectDAO.selectAll();
		} else {
			return projectDAO.selectBySubjectNo(subjectNo);
		}
	}

	public ProjectVO getProjectByProjectSeq(String projectSeq) {
		return projectDAO.selectByProjectSeq(projectSeq);
	}

}
