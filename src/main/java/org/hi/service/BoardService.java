package org.hi.service;

import java.util.List;

import org.hi.domain.BoardVO;
import org.hi.domain.SearchCriteria;


public interface BoardService {

	public List<BoardVO> boardList();
	public BoardVO boardview(String board_id);
	public void boardinsert(BoardVO bvo);
	public void boarddelete(String board_id);
	public void boardupdate(BoardVO bvo);
	
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) 
		      throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	
	
}
