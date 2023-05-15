package kr.ac.ers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ers.dto.MemberVO;
import kr.ac.ers.repository.MemberMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	public List<MemberVO> getMemberList() {
		return memberMapper.selectMemberList();
	}
}
