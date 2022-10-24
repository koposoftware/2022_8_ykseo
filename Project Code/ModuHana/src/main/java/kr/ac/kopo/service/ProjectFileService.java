package kr.ac.kopo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.ProjectFileDAO;
import kr.ac.kopo.vo.ProjectFileVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProjectFileService {

	private final ProjectFileDAO projectFileDAO;
	
	public Map<String, Object> getProjectFileListByProjectSeq(String projectSeq, List<String> typeCodeList) {
		
		List<ProjectFileVO> projectFileList = projectFileDAO.selectByProjectSeqAndTypeCode(projectSeq, typeCodeList);
		
		Map<String, Object> map = new HashMap<>();
		List<ProjectFileVO> list = new ArrayList<>();
		for (ProjectFileVO projectFileVO : projectFileList) {
			if(projectFileVO.getTypeName().equals("reference")) {
				list.add(projectFileVO);
			} else {
				map.put(projectFileVO.getTypeName(), projectFileVO); 
			}
		}
		
		map.put("reference", list); 
		
		return map;
	}

}
