package kr.or.ddit.rb.meminfo.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.rb.cmm.vo.AddrVO;
import kr.or.ddit.rb.cmm.vo.BookGenreVO;
import kr.or.ddit.rb.cmm.vo.MemberVO;

@Repository("memInfoRepository")
public class MemInfoDaoImpl implements IMemInfoDao {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public MemberVO selectMemberVO(String memId){
		return sqlSession.selectOne("mem.selectMemberVO", memId);
	}

	@Override
	public AddrVO selectAddrVO(String memId) {
		return sqlSession.selectOne("mem.selectAddrVO", memId);
	}

	@Override
	public List<BookGenreVO> selectIntrGenreList(String memId){
		return sqlSession.selectList("mem.selectIntrGenreList", memId);
	}

	@Override
	public int updateMemberVO(MemberVO newMem) {
		return sqlSession.update("mem.updateMemberVO", newMem);
	}

	@Override
	public List<AddrVO> selectAddrList(String key){
		return sqlSession.selectList("mem.selectAddrList", key);
	}

	@Override
	public int deleteMemberVO(String memId){
		return sqlSession.delete("mem.deleteMemberVO",memId);
	}

	@Override
	public int updateEmoney(MemberVO member) {
		return sqlSession.update("mem.updateEmoney", member);
	}

	
	
}
