package org.hi.service;

import java.util.List;

import javax.inject.Inject;

import org.hi.domain.BoardVO;
import org.hi.domain.SearchCriteria;
import org.hi.persistence.BoardDAOImp;
import org.springframework.stereotype.Service;


@Service
public class BoardServiceImp implements BoardService{

	@Inject
	private BoardDAOImp boarddao;
	
	@Override
	public List<BoardVO> boardList() {
		
		return boarddao.boardList("boardList");
	}

	@Override
	public BoardVO boardview(String board_id) {
		
		return boarddao.boardview("boardview",board_id);
	}

	@Override
	public void boarddelete(String board_id) {
		
		boarddao.boarddelete("boarddelete",board_id);
	}

	@Override
	public void boardinsert(BoardVO bvo) {
		
		boarddao.boardinsert("boardinsert",bvo);
	}

	@Override
	public void boardupdate(BoardVO bvo) {
		
		boarddao.boardupdate("boardupdate",bvo);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri)  {
		System.out.println(cri.toString()+"서비스 지역");
		
		return boarddao.listSearch("boardList",cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) {
		
		return boarddao.listSearchCount("listSearchCount",cri);
	}

}
