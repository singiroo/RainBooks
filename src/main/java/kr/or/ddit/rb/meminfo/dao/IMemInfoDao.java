package kr.or.ddit.rb.meminfo.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.rb.cmm.vo.AddrVO;
import kr.or.ddit.rb.cmm.vo.BookGenreVO;
import kr.or.ddit.rb.cmm.vo.IntrGenreVO;
import kr.or.ddit.rb.cmm.vo.MemberVO;

public interface IMemInfoDao {

	/**
	 * 회원의 아이디를 입력받아 해당하는 회원의 정보를 가져오는 메서드
	 * @param memId		회원의 아이디
	 * @return 			회원의 정보를 담는 VO객체
	 */
	public MemberVO selectMemberVO(String memId);
	
	/**
	 * 회원의 아이디를 입력받아 해당하는 회원의 기본주소를 가져오는 메서드
	 * @param memId		회원의 아이디
	 * @return			회원의 기본주소를 저장하고 있는 주소VO객체
	 */
	public AddrVO selectAddrVO(String memId);
	
	
	/**
	 * 회원의 아이디를 입력받아 해당하는 회원의 관심장르 리스트를 가져오는 메서드
	 * @param memId		회원의 아이디
	 * @return			회원의 관심장르 정보를 담는 리스트
	 */
	public List<BookGenreVO> selectIntrGenreList(String memId);
	
	/**
	 * 새로 작성한 회원의 정보를 입력받아 해당하는 회원의 정보를 수정하는 메서드
	 * @param newMem	새로 작성한 회원의 정보를 담은 VO객체
	 * @return			수정된 건 수
	 */
	public int updateMemberVO(MemberVO newMem);
	
	/**
	 * 검색 키워드를 입력받아 키워드가 포함되는 주소의 목록을 가져오는 메서드
	 * @param key	검색 키워드
	 * @return		결과 목록
	 */
	public List<AddrVO> selectAddrList(String key);
	
	/**
	 * 회원의 아이디를 입력받아 해당 회원을 탈퇴시키는 메서드
	 * 정보는 보관되며, 회원의 활동 구분이 비활동 코드(0)으로 수정됨.
	 * @param memId		회원의 아이디
	 * @return			수정된 건수
	 */
	public int deleteMemberVO(String memId);
	
	/**
	 * 회원의 아이디와 충전/환불한 금액을 입력받아 해당 회원의 이머니 보유량을 수정하는 메서드
	 * @param member	회원의 아이디와 충전/환불 금액을 저장하는 VO객체
	 * @return			수정된 건수
	 */
	public int updateEmoney(MemberVO member);
	
}
