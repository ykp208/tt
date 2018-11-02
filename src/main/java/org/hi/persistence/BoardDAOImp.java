package org.hi.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import org.hi.domain.BoardVO;
import org.hi.domain.SearchCriteria;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


@Repository
public class BoardDAOImp implements BoardDAO{

	private static final String namespace = "com.epcot.mappers.board-Mapper.";
	
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(BoardDAOImp.class);
	
	@Inject
	private SqlSession SqlSession;
	
	@Override
	public List<BoardVO> boardList(String sqlId) {
		// TODO Auto-generated method stub
		return SqlSession.selectList(namespace+sqlId);
	}

	@Override
	public BoardVO boardview(String sqlId, String board_id) {
		System.out.println(board_id);
		return SqlSession.selectOne(namespace+sqlId, board_id);
	}

	@Override
	public void boarddelete(String sqlId, String board_id) {
	
		SqlSession.update(namespace+sqlId,board_id);
	}

	@Override
	public void boardinsert(String sqlId, BoardVO bvo) {
		
		SqlSession.insert(namespace+sqlId, bvo);
	}

	@Override
	public void boardupdate(String sqlId, BoardVO bvo) {
		
		SqlSession.update(namespace+sqlId, bvo);
	}

	@Override
	public List<BoardVO> listSearch(String sqlId, SearchCriteria cri)  {
		
		logger.info("listSearh.................");
		System.out.println(cri.toString()+"daoÁö¿ª");
		
		return SqlSession.selectList(namespace + sqlId , cri);
	}

	@Override
	public int listSearchCount(String sqlId, SearchCriteria cri) {
		
		return SqlSession.selectOne(namespace + sqlId , cri);
	}

}
