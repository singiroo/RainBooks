package kr.or.ddit.rb.meminfo.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.rb.cmm.vo.AddrVO;
import kr.or.ddit.rb.cmm.vo.BookGenreVO;
import kr.or.ddit.rb.cmm.vo.IntrGenreVO;
import kr.or.ddit.rb.cmm.vo.MemberVO;
import kr.or.ddit.rb.meminfo.dao.IMemInfoDao;
import kr.or.ddit.rb.meminfo.dao.MemInfoDaoImpl;
@Service("memInfoService")
public class MemInfoServiceImpl implements IMemInfoService {
	
	@Resource(name = "memInfoRepository")
	private IMemInfoDao memInfoDao;
	

	@Override
	public MemberVO selectMemberVO(String memId) {
		return memInfoDao.selectMemberVO(memId);
	}

	@Override
	public AddrVO selectAddrVO(String memId) {
		return memInfoDao.selectAddrVO(memId);		
	}

	@Override
	public List<BookGenreVO> selectIntrGenreList(String memId) {
		return memInfoDao.selectIntrGenreList(memId);
	}

	@Override
	public int updateMemberVO(MemberVO newMem) {
		return memInfoDao.updateMemberVO(newMem);
	}

	@Override
	public List<AddrVO> selectAddrList(String key) {
		return memInfoDao.selectAddrList(key);
	}

	@Override
	public int deleteMemberVO(String memId) {
		return memInfoDao.deleteMemberVO(memId);
	}

	@Override
	public MemberVO updateEmoney(MemberVO member) {
		memInfoDao.updateEmoney(member);
		MemberVO newMem = memInfoDao.selectMemberVO(member.getMemId());
		return newMem;
	}

	
	
}
