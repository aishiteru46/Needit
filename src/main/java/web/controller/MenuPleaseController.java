package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.FileTb;
import web.service.face.MenuPleaseService;
import web.util.Paging;

@Controller
@RequestMapping("/menu/please")
public class MenuPleaseController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired private MenuPleaseService menuPleaseService;
	
	@GetMapping("/list")
	public void list( Paging param, Model model ) {
		
		//페이징 계산
		Paging paging = menuPleaseService.getPaging(param);
		logger.info("{}", paging);
		
		//게시글 목록 조회
		List<Board> list = menuPleaseService.list( paging );
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
	}
	
	@GetMapping("/view")
	public String view(Board viewBoard, Model model) {
		
		if( viewBoard.getBoardNo() < 1 ) {
			return "redirect:./list";
		}
		
		
		//상세보기 게시글 조회
		viewBoard = menuPleaseService.view(viewBoard);
		model.addAttribute("viewBoard", viewBoard);
		
		
		//첨부파일 정보 전달 FileTb
		List<FileTb> fileTb = menuPleaseService.getAttachFile(viewBoard);
		model.addAttribute("fileTb", fileTb);
		logger.info("fileTb : {}", fileTb);
		
		return"menu/please/view";
		
	}
	
	
	@GetMapping("/write")
	public void write() {}
	
	
	@PostMapping("/write")
	public String writeProc(Board writeParam, List<MultipartFile> file, HttpSession session) {
		logger.info("writeParam : {}", writeParam);
		
		
		
		return null;
		
		
	}
	
	
	
}
