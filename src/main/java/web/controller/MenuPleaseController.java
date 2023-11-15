package web.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import web.dto.Board;
import web.dto.Comment;
import web.dto.FileTb;
import web.dto.Like;
import web.service.face.MenuPleaseService;
import web.util.Paging;

@Controller
@RequestMapping("/please")
public class MenuPleaseController {
   private final Logger logger = LoggerFactory.getLogger( this.getClass() );
   
   @Autowired private MenuPleaseService menuPleaseService;
   
 //게시판 목록 띄우기
 	@GetMapping("/list")
 	public String list( Paging param, Model model ) {
 		logger.info("param : {}", param);
 		
 		//페이징 계산
 		Paging paging = menuPleaseService.getPaging(param);
 		
 		//게시글 목록 조회
 		List<Map<String, Object>> list = menuPleaseService.list(paging); 
 		model.addAttribute("paging", paging);
 		logger.info("list: {}", list);
 		model.addAttribute("list", list);
 		
 		//게시글 추천수 조회
// 		int cntLike = menuPleaseService.getCntLike(paging);
// 		model.addAttribute("cntLike", cntLike);
 		
 		return "/please/list";
 	}
   
 	
 	
 	//게시판 상세 조회
	@RequestMapping("/view")
	public String view( Board board, Model model, HttpSession session ) {

		//게시글 번호를 전달받지 못하면 목록으로 이동
		if( board.getBoardNo() < 1 ) {
			return "redirect:/please/list";
		}
		
		//게시글 상세 조회
		board = menuPleaseService.view(board);
		model.addAttribute("board", board);
		
		//첨부파일 정보 전달
		List<FileTb> fileTb = menuPleaseService.getAttachFile( board );
		model.addAttribute("fileTb", fileTb);
		
		//추천 상태 조회
		Like like = new Like();
		like.setBoardNo(board.getBoardNo()); //게시글 번호
		like.setLikeId((String)session.getAttribute("id")); //로그인한 아이디

		//추천 상태 전달
		boolean isLike = menuPleaseService.isLike(like);
		model.addAttribute("isLike", isLike);
		model.addAttribute("cntLike", menuPleaseService.getTotalCntLike(like));		
		
		return "please/view";
	}

   
   
   
   
   //게시글 작성 폼
 	@GetMapping("/write")
 	public void write() {}
 	
 	//게시글 작성 처리
 	@PostMapping("/write")
 	public String writeProc( Board writeParam, List<MultipartFile> file, HttpSession session ) {
 		logger.info("writeParam : {}", writeParam );
 		
 		//작성자 id, nick 세팅
 		writeParam.setWriterId((String) session.getAttribute("id"));
 		writeParam.setWriterNick((String) session.getAttribute("nick"));
 		
 		//게시글 저장
 		menuPleaseService.write( writeParam, file );
 		
 		return "redirect:/please/view?boardNo=" + writeParam.getBoardNo();
 	}
   
   
   	//파일 다운로드
 	@RequestMapping("/download")
 	public String down( FileTb fileTb, Model model ) {
 		
 		//첨부파일 정보 조회
 		fileTb = menuPleaseService.getFile( fileTb );
 		model.addAttribute("downFile", fileTb);
 		
 		return "down";
 	}
   
   
   
   
   @GetMapping("/update")
   public String update(Board updateParam, Model model) {
	   
	   if (updateParam.getBoardNo() < 1) {
		   return "redirect:./list";
	   }
		
	   
		//상세보기 페이지 아님 표시
	 	updateParam.setHit(-1);
	   
	 	
	 	
	   //상세보기 게시글 조회
	   	updateParam = menuPleaseService.view(updateParam);
	   	model.addAttribute("updateBoard", updateParam);
	   	
	   	
	   	//첨부파일 정보 전달
	   	List<FileTb> fileTb = menuPleaseService.getAttachFile(updateParam);
	   	model.addAttribute("fileTb", fileTb);
	   	
	   	
		return "please/update";
		   
   }
   
   
   
   @PostMapping("/update")
   public String updateProc(
		   
		   Board updateParam
		   , List<MultipartFile> file
		   , int[] delFileno
		   
		   ,HttpSession session
		   ,Model model
		   
		   ) {
	   
	   logger.info("updateParam: {}", updateParam);
	   logger.info("file: {}", file);
	   logger.info("delFileno: {}", Arrays.toString(delFileno) );
	   
	   
	   updateParam.setWriterId((String) session.getAttribute("id"));
	   updateParam.setWriterNick((String) session.getAttribute("nick"));
	   
	   
	   menuPleaseService.update(updateParam, file, delFileno);
	   
	   return "redirect:./view?boardNo=" + updateParam.getBoardNo();
   }
   
   
   
   @RequestMapping("/delete")
   public String delete(Board deleteParam, Model model ) {
	   
	   if( deleteParam.getBoardNo() < 1 ) {
			return "redirect:/please/list";
		}
	   
	   menuPleaseService.delete(deleteParam);
	   
	   return "redirect:./list?menu=" + deleteParam.getMenu();
   }
   
   
   	//추천 적용
 	@RequestMapping("/like")
 	public ModelAndView like( Like like, ModelAndView mav, HttpSession session  ) {
 		logger.info("like : {}", like);
 		
 		//추천 정보 토글
 		like.setLikeId((String) session.getAttribute("id"));
 		boolean result = menuPleaseService.like(like);
 		mav.addObject("result", result);
 		
 		//추천 수 조회
 		int cnt = menuPleaseService.getTotalCntLike(like);
 		mav.addObject("cnt", cnt);

 		mav.setViewName("jsonView");
 		
 		return mav;
 	}
   
 	
 	//댓글 목록
 	@GetMapping("/comment/list")
 	public String viewComment(Comment commentParam, Model model) {
 		logger.info("commentParam: {}", commentParam);
 		
 		List<Comment> commentList = menuPleaseService.viewComment(commentParam);
 		
 		model.addAttribute("commentList", commentList);
 		
 		return "jsonView";
 	}
 	
 	
   //댓글 작성
 	@PostMapping("/comment")
 	public String insert(Comment commentParam, Board board) {
 		
 		menuPleaseService.commentInsert(commentParam);
 		
 		return "redirect:/please/view?boardNo=" + commentParam.getBoardNo();
	   
 		
 	}
   
   
 	
 	
 	//댓글 삭제
 	@GetMapping("/comment/delete")
 	public String delete(Comment commnetDelete) {
 		logger.info("commentDelete", commnetDelete);
 		
 		menuPleaseService.delete(commnetDelete);
 		
 		return "jsonView";
 	}
   
   
   
   
   
   
   
   
   
   
   
   
   
   
}