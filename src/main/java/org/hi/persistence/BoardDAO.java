package org.hi.persistence;

import java.util.List;

import org.hi.domain.BoardVO;
import org.hi.domain.SearchCriteria;


public interface BoardDAO {

	public List<BoardVO> boardList(String sqlId);
	public BoardVO boardview(String sqlId,String board_id);
	public void boardinsert(String sqlId, BoardVO bvo);
	public void boarddelete(String sqlId, String board_id);
	public void boardupdate(String sqlId, BoardVO bvo);
	
	public List<BoardVO> listSearch(String sqlId, SearchCriteria cri)throws Exception;
	  
	
	public int listSearchCount(String sqlId, SearchCriteria cri)throws Exception;
	  
	
}
