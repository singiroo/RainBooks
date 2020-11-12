package kr.or.ddit.rb.meminfo.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.rb.cmm.vo.AddrVO;
import kr.or.ddit.rb.cmm.vo.IntrGenreVO;
import kr.or.ddit.rb.cmm.vo.MemberVO;

@Repository("memberRepository")
public class MemberDaoImpl implements IMemberDao {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMemberInfo(MemberVO mvo)  {
		return sqlSession.insert("mem.insertMemberInfo",mvo);
	}

	@Override
	public boolean checkMemberId(String memId)  {
		Object obj = sqlSession.selectOne("mem.checkMemberId",memId);
		if(obj == null) { // 조회결과가 없으면 null => 아이디 생성가능
			return true;
		}
		return false; // 조회결가 있으면 false로 반환
	}

	@Override
	public List<AddrVO> selectAddr(String addr1)  {
		return sqlSession.selectList("mem.selectAddr",addr1);
	}

	@Override
	public int insertIntrGenre(IntrGenreVO vo)  {
		return sqlSession.insert("mem.insertIntrGre",vo);
	}

}
