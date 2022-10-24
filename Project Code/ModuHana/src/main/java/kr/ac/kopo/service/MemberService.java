package kr.ac.kopo.service;

import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.MemberDAO;
import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {

	private final MemberDAO memberDAO;
	
	public MemberVO login(MemberVO memberVO) {
		return memberDAO.selectByIdAndPwd(memberVO);
	}

	public MemberVO apiLogin(MemberVO memberVO) {
		return memberDAO.selectById(memberVO);
	}

	public void apiLogon(MemberVO memberVO) {
		memberDAO.insert(memberVO);
	}

	public void uploadRegNo(MemberVO memberVO) {
		memberDAO.updateRegNo(memberVO);
	}
}
