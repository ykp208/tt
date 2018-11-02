package org.hi.hi;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.hi.domain.BoardVO;
import org.hi.domain.PageMaker;
import org.hi.domain.SearchCriteria;
import org.hi.persistence.BoardDAOImp;
import org.hi.service.BoardServiceImp;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class HiController {
	
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(HiController.class);
	
	@Inject
	private BoardServiceImp boardservice;
	
	@RequestMapping("/")
	public String hi(){
		return "index";
	}
	
	@RequestMapping(value ="/first", method = RequestMethod.GET)
	public String first( SearchCriteria cri, Model model) throws Exception{
		
		System.out.println("controller"+cri.toString());
		System.out.println(cri.getPage()+"  :  "+cri.getPerPageNum());
		
		if(cri.getDateFirst() == (null)) cri.setDateFirst("a");
		if(cri.getDateEnd() == (null)) cri.setDateEnd("a");
		if(cri.getReg_user() == (null)) cri.setReg_user("a");
		if(cri.getTitle() == (null)) cri.setTitle("a");
		if(cri.getY() == (null)) cri.setY("a");
		if(cri.getN() == (null)) cri.setN("a");
		
		
		model.addAttribute("boardList", boardservice.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		System.out.println("controller"+cri.toString());
		System.out.println(boardservice.listSearchCount(cri)+"Totalcount");
		pageMaker.setTotalCount(boardservice.listSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
		
		
		System.out.println("-----------------");
		System.out.println(pageMaker.toString());
		
		
		return "board/boardList";
	}
	
	
	@ResponseBody
	@RequestMapping(value ="/boardlistajax", method = RequestMethod.GET)
	public HashMap<String, Object> boardlistajax(@ModelAttribute("cri") SearchCriteria cri, Model model) {
		System.out.println("........ajax들어 왔다.");
		System.out.println(cri.getTitle());
		
		if(cri.getDateFirst() == "") cri.setDateFirst("a");
		if(cri.getDateEnd() == "") cri.setDateEnd("a");
		if(cri.getReg_user() == "") cri.setReg_user("a");
		if(cri.getTitle() == "") cri.setTitle("a");
		if(cri.getY() == (null)) cri.setY("a");
		if(cri.getN() == (null)) cri.setN("a");
		
		
		List<BoardVO> bvo = boardservice.listSearchCriteria(cri);
		
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(boardservice.listSearchCount(cri));
		
		
		System.out.println("-----------------");
		System.out.println(pageMaker.toString());
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("bvo", bvo);
		hm.put("page", pageMaker);
		
		return hm;
	}
	
	
	
	
	
	
	@RequestMapping(value = "/boardview", method = RequestMethod.POST)
	public String boardview(Model model, String board_id){
		
		
		BoardVO bvo = boardservice.boardview(board_id);
		
		
		model.addAttribute("bvo",bvo);
		model.addAttribute("target",2);
		
		return "board/boardView";
	}
	
	@RequestMapping(value = "/boardInsertPage", method = RequestMethod.POST)
	public String boardInsertPage(Model model){
		
		model.addAttribute("target",1);
		return "board/boardView";
	}
	
	
	@RequestMapping(value = "/boardinsert", method = RequestMethod.POST)
	@ResponseBody
	public int boardinsert(Model model,BoardVO bvo){		
		
		logger.info("boardinsert......{}",bvo.toString());
		System.out.println(bvo.toString());
		boardservice.boardinsert(bvo);
	
		return 1;
	}
	
	@ResponseBody
	@RequestMapping(value = "/boarddelete",  method = RequestMethod.POST)
	public String boarddelete(Model model, String board_id){
		
		boardservice.boarddelete(board_id);

		return "1";
	}
	
	
	@RequestMapping(value = "/boardupdatepage", method = RequestMethod.POST)
	public String boardupdatepage(Model model, String board_id){
		
		
		BoardVO bvo = boardservice.boardview(board_id);
		model.addAttribute("bvo",bvo);
		model.addAttribute("target",3);
		
		return "board/boardView";
	}
	
	
	@RequestMapping(value = "/boardupdate", method = RequestMethod.POST)
	public String boardupdata(Model model, BoardVO bvo){
		
		boardservice.boardupdate(bvo);
		model.addAttribute("target",3);
		
		return "board/boardView";
	}
}
