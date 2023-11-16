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
	public String main(
			Model model,
			Board board,
			FileTb file,
			Paging param
			) {
		logger.info("메인화면 진입");
		
		//페이징 계산
		Paging paging = mainService.getPaging(param);
		logger.info("{}", paging);

		
		//배너 조회,출력
		List<Banner> bannerNames = new ArrayList<Banner>();
		bannerNames = mainService.getBannerNo();
		logger.info(bannerNames.toString());
		model.addAttribute("file", bannerNames);
		
		//검색
		
		
		//최신 게시글 조회 출력_대여게시판
		List<Map<String, Object>> listRent = mainService.getBoardRentInfo();
		logger.info("메인에 출력할 대여 list : {}", listRent);
		model.addAttribute("boardRentInfo", listRent);
		
		//최신 게시글 조회 출력_나눔게시판
		List<Map<String, Object>> listShare = mainService.getBoardShareInfo();
		logger.info("메인에 출력할 나눔 list : {}", listShare);
		model.addAttribute("boardShareInfo", listShare);
		
		//니딧 인증 업체
		
		//오늘의 인기 게시글
		
		
		return "main/main";
	}//@Get main() End.
	
}
