package web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import web.dto.Banner;
import web.dto.Board;
import web.dto.FileTb;
import web.service.face.MainService;
import web.util.Paging;

@Controller
public class MainController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired MainService mainService;
	
	//메인배너 불러오기
	@GetMapping("/main")
	public String main(Model model) {
		logger.info("메인화면 진입");
		List<Banner> bannerNames = new ArrayList<Banner>();

		bannerNames = mainService.getBannerNo();
		logger.info(bannerNames.toString());
		
		model.addAttribute("file", bannerNames);
		return "main/main";
	}//메인배너 불러오기 끝
	
	
	//최신 대여해요 게시글 
	
	
	
	//최신 나눔해요 게시글 
	@GetMapping("/list")
	public void list(Board board, Model model, FileTb file) {
		logger.info("main list");
		
		List<Map<String, Object>> list = mainService.selectBoardStatus(board);
		
		model.addAttribute("list",list);
		logger.info("{}", "list");
		
		file.setBoardNo(board.getBoardNo());
		
		List<FileTb> fileData = mainService.getImg(file);
		logger.info("{}", fileData);
		
	}
	
	
}
