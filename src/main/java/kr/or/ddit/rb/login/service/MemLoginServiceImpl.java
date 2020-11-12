package kr.or.ddit.rb.login.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.rb.cmm.vo.MemberVO;
import kr.or.ddit.rb.login.dao.IMemLoginDao;
import kr.or.ddit.rb.login.dao.MemLoginDaoImpl;

@Service("memLoginService")
public class MemLoginServiceImpl implements IMemLoginService {
	
	@Resource(name = "memLoginRepository")
	private IMemLoginDao memLoginDao;
	
	
	@Override
	public MemberVO selectMemberVO(String memId) {
		MemberVO member = memLoginDao.selectMemberVO(memId);
		return member;
	}

}
