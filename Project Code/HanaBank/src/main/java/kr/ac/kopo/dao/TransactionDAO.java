package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.TransactionVO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class TransactionDAO {
	private final SqlSessionTemplate sqlSessionTemplate;

	public List<TransactionVO> selectAllByAccountNo(String accountNo) {
		return sqlSessionTemplate.selectList("dao.TransactionDAO.selectAllByAccountNo", accountNo);
	}

	public void procedureTransfer(Map<String, Object> map) {
		int result = -1;
		map.put("result", result);

		sqlSessionTemplate.selectOne("dao.TransactionDAO.procedureTransfer", map);
		System.out.println("result : " + map.get("result"));
	}

	@SuppressWarnings("unchecked")
	public Map<String, TransactionVO> blockMultiTransfer(Map<String, TransactionVO> transferMap, String password) {

		Map<String, Object> map = new HashMap<>();
		map.put("password", password);
		map.put("transferMap", transferMap);

		sqlSessionTemplate.selectOne("dao.TransactionDAO.blockMultiTransfer", map);
		transferMap = (Map<String, TransactionVO>) map.get("transferMap");

		return (Map<String, TransactionVO>) map.get("transferMap");
	}
}
