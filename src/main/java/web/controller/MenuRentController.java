package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.service.face.MenuRentService;
import web.util.Paging;

@Controller
@RequestMapping("/menu/rent")
public class MenuRentController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired private MenuRentService menuRentService;
	
	//게시판 목록 띄우기
	@GetMapping("/product/list")
	public String list( Paging param, Model model ) {
		
		//페이징 계산
		Paging paging = menuRentService.getPaging(param);
		
		//게시글 목록 조회
		menuRentService.list(param);
		
		return "/menu/rent/list";
	}

	//게시판 상세 조회
	@RequestMapping("/view")
	public void view() {}

	//파일 다운로드
	@RequestMapping("/download")
	public void down() {}
	
	//게시글 위치
	@GetMapping("/loc")
	public void loc() {}
	
	//대여 처리
	@PostMapping("/rent")
	public void rent() {}
	
	//예약 처리
	@PostMapping("/book")
	public void book() {} 
	
	//결제 처리
	@PostMapping("/pay")
	public void pay() {} 
	
	//게시글 작성 폼
	@GetMapping("/write")
	public void write() {} 
	
	//게시글 작성 처리
	@PostMapping("/write")
	public void writeProc() {}

	//게시글 수정 폼
	@GetMapping("/update")
	public void update() {} 

	//게시글 수정 처리
	@PostMapping("/update")
	public void updateProc() {} 

	//게시글 삭제
	@RequestMapping("/delete")
	public void delete() {}

	//추천 적용
	@PostMapping("/like")
	public void like() {}
	
	//게시글 신고
	@PostMapping("/report")
	public void report() {}
	
	//------------------------------------------------------------------------------------------
	
}
