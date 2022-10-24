package kr.ac.kopo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.ProjectFileDAO;
import kr.ac.kopo.vo.ProjectFileVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProjectFileService {

	private final ProjectFileDAO projectFileDAO;

	public void uploadSingImg(ProjectFileVO projectFileVO) {
		projectFileVO.setTypeCode("0");
		projectFileDAO.insert(projectFileVO);
	}

	public void uploadReferenceFile(List<ProjectFileVO> fileList) {
		projectFileDAO.insertList(fileList);
	}
	
	
}
