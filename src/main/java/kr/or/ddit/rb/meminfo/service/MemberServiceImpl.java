package kr.or.ddit.rb.meminfo.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.rb.cmm.vo.AddrVO;
import kr.or.ddit.rb.cmm.vo.IntrGenreVO;
import kr.or.ddit.rb.cmm.vo.MemberVO;
import kr.or.ddit.rb.meminfo.dao.IMemberDao;

@Service("memberService")
public class MemberServiceImpl implements IMemberService {
	
	@Resource(name = "memberRepository")
	private IMemberDao memberDao;

	@Override
	public int insertMemberInfo(Map<String, Object> map)  {
		MemberVO mvo = (MemberVO) map.get("member");
		List<IntrGenreVO> ivoList = (List<IntrGenreVO>) map.get("ivoList");
		int cnt = memberDao.insertIntrGenre(ivoList);
		cnt = memberDao.insertMemberInfo(mvo);
		return cnt;
	}

	@Override
	public boolean checkMemberId(String memId)  {
		return memberDao.checkMemberId(memId);
	}

	@Override
	public List<AddrVO> selectAddr(String addr1)  {
		return memberDao.selectAddr(addr1);
	}

	@Override
	public int insertIntrGenre(IntrGenreVO vo)  {
		return 0;
	}

	@Override
	public int deleteMemberInfo(String memId)  {
		return 0;
	}

}
