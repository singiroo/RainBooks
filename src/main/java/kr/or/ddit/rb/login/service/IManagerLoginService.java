package kr.or.ddit.rb.login.service;

import kr.or.ddit.rb.cmm.vo.ManagerVO;

public interface IManagerLoginService {
	/**
	 * 관리자 로그인을 위해 id와 pw정보를 입력받음 controller단에서 id를 이용해 pass 비교 후 결과 출력
	 * @param mngId 관리자 아이디
	 * @return 관리자 정보를 담고있는 vo객체
	 */
	public ManagerVO selectManagerVO(String mngId);
}
