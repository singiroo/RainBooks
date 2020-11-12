package kr.or.ddit.rb.meminfo.service;

import java.util.List;

import kr.or.ddit.rb.cmm.vo.AddrVO;
import kr.or.ddit.rb.cmm.vo.IntrGenreVO;
import kr.or.ddit.rb.cmm.vo.MemberVO;

public interface IMemberService {
	/**
	 * 회원 등록
	 * @author 최민준
	 * @param mvo : 회원정보 vo
	 * @return 회원 등록에 성공하면 1이상의 값 반환 실패하면 0
	 */
	public int insertMemberInfo(MemberVO mvo) ;
	
	/**
	 * 회원등록을 할때 입력한 ID가 존재하는지 여부를 알아냄
	 * @author 최민준
	 * @param memId : 회원등록을 하기 위해 입력한 회원아이디
	 * @return 아이디가 이미 존재하면 false, 없으면 true .. true일때 생성가능
	 */
	public boolean checkMemberId(String memId) ;

	/**
	 * 기본주소 검색을 위해 주소vo에 있는 정보중 일부 또는 전체를 검색해 기본주소를 나오게한다
	 * @author 최민준
	 * @param avo : 기본주소 정보 
	 * @return 기본주소 반환
	 */
	public List<AddrVO> selectAddr(String addr1) ;
	
	/**
	 * 회원의 관심장르를 등록하기 위한 메서드 
	 * @author 최민준
	 * @param igvo : 관심장르 vo (시퀀스 번호와 회원 아이디가 복합키가 되어 기본키로 쓰임)
	 * @return 회원 관심장르가 등록되면 1이상 반환, 없으면 0
	 */
	public int insertIntrGenre(IntrGenreVO vo) ;
	
	/**
	 * 회원 정보 삭제(탈퇴)
	 * @author 최민준
	 * @param memId : 회원아이디(본인아이디)
	 * @return 삭제 성공하면 1이상의 값 반환, 실패하면 0
	 */
	public int deleteMemberInfo(String memId) ;
	
}
