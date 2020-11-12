package kr.or.ddit.rb.login.dao;

import java.sql.SQLException;

import kr.or.ddit.rb.cmm.vo.MemberVO;

public interface IMemLoginDao {

	/**
	 * 사용자에게 id와 pw정보를 입력하여 일치하는 member정보를 가져오는 메서드
	 * @param mem  id와 pw 정보를 담은 개체
	 * @return MemberVO 사용자 입력 정보와 일치하는 회원의 정보
	 */
	public MemberVO selectMemberVO(String memId);
	
	
}
