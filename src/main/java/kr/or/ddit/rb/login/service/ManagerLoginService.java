package kr.or.ddit.rb.login.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.rb.cmm.vo.ManagerVO;
import kr.or.ddit.rb.login.dao.IManagerLoginDao;
import kr.or.ddit.rb.login.dao.ManagerLoginImpl;

@Service("managerLoginService")
public class ManagerLoginService implements IManagerLoginService {
	
	@Resource(name = "managerLoginRepository")
	private IManagerLoginDao managerLoginDao;
	
	
	@Override
	public ManagerVO selectManagerVO(String mngId) {
		ManagerVO mvo = managerLoginDao.selectManagerVO(mngId);
		return mvo;
	}

}
