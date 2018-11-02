package persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.hi.domain.BoardVO;
import org.hi.persistence.BoardDAO;
import org.hi.persistence.BoardDAOImp;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BoardDAOTest {

	private static final Logger logger =
			Logger.getLogger(BoardDAOTest.class);
	
	@Inject
	private BoardDAOImp boardDAOImp;
	
	@Test
	public void setup(){
		logger.info("start...... boardDAO.....test");
	}
	
	@Test
	public void boarddaoTest(){
		logger.info("boardDAO....boardList...");
		
		List<BoardVO> boardvo = boardDAOImp.boardList("boardList");
		for(BoardVO a: boardvo){
			logger.info( "board_id"+a.getBoard_id());
			logger.info( "content"+a.getContent());
			logger.info( "delete_flag"+a.getDelete_flag());
			logger.info( "email"+a.getEmail());
			logger.info( "phone"+a.getPhone());
			logger.info( "reg_datetime"+a.getReg_datetime());
			logger.info( "reg_user"+a.getReg_user());
			logger.info( "title"+a.getTitle());
		}
	}
}
