package kr.ac.ers.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.ac.ers.dto.MemberVO;

@Mapper
public interface MemberMapper {

	List<MemberVO> selectMemberList();
		
}
