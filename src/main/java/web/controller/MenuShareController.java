package web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Board;
import web.service.face.MenuShareFace;
import web.util.Paging;

@Controller
@RequestMapping("/menu/share")
public class MenuShareController {
	
	//로그 객체 
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	
	@Autowired MenuShareFace menuShareFace;
	
	@GetMapping("/list")
	public String list(Board board, Paging param, Model model) {
		logger.info("list get");
		
		//페이징 계산
		Paging paging = menuShareFace.getPaging(param);
		
		//나눔 게시판 조회
		List<Board> list = menuShareFace.selectBoardStatus(paging, board);
		logger.info("{}",list);
		model.addAttribute("list",list);
		
		return "menu/share/list";
	}
	
	

}
