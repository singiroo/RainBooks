package kr.or.ddit.rb.login.dao;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.rb.cmm.vo.MemberVO;

@Repository("memLoginRepository")
public class MemLoginDaoImpl implements IMemLoginDao {

	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberVO selectMemberVO(String memId){
		MemberVO member = sqlSession.selectOne("mem.selectMemberVO", memId); 
		return member;
	}

}
