package kr.or.ddit.rb.login.dao;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.rb.cmm.vo.ManagerVO;

@Repository("managerLoginRepository")
public class ManagerLoginImpl implements IManagerLoginDao {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ManagerVO selectManagerVO(String mngId){
		ManagerVO mvo = sqlSession.selectOne("mngLogin.selectMng",mngId);
		return mvo;
	}

}
