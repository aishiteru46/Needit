package web.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import web.dto.Board;
import web.dto.Booking;
import web.dto.Comment;
import web.dto.FileTb;
import web.dto.Like;
import web.service.face.MenuShareFace;
import web.util.Paging;

@Controller
@RequestMapping("/share")
public class MenuShareController {
	
	//로그 객체 
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	
	@Autowired MenuShareFace menuShareFace;
	
	@GetMapping("/list")
	public String list(
			Board board, Paging param
			, Model model,FileTb file
			, Like like) {
		logger.info("list get");
		
		//페이징 계산
		Paging paging = menuShareFace.getPaging(param);
		
		//나눔 게시판 조회
		List<Map<String, Object>> list = menuShareFace.selectBoardStatus(paging, board);
		
		logger.info("리스또{}",list);
		model.addAttribute("list",list);
		model.addAttribute("paging",paging);
		
		file.setBoardNo(board.getBoardNo());	
		
		logger.info("메뉴{}",paging);
		logger.info("카테고리 들어오나?{}",param.getCate());
		
		return "menu/share/list";
	}
	
	@RequestMapping("/view")
	public String view(
			Board board, HttpSession session
			, Model model
			) {
		Board view = menuShareFace.view(board);
		
		//첨부파일 정보 전달
		List<FileTb> boardfile = menuShareFace.getAttachFile( board );
		model.addAttribute("boardfile", boardfile);
		
		logger.info("보드넘버{}",view);
		model.addAttribute("view", view);
		
		//추천 상태 조회
		Like like = new Like();
		like.setBoardNo(board.getBoardNo()); //게시글 번호
		like.setLikeId((String)session.getAttribute("id")); //로그인한 아이디

		//추천 상태 전달
		boolean isLike = menuShareFace.isLike(like);
		model.addAttribute("isLike", isLike);
		model.addAttribute("cntLike", menuShareFace.getTotalCntLike(like));
		
		return "menu/share/view";
	}
	
	@GetMapping("/write")
	public String write( Board board ) {
		
		return "menu/share/write";
	}
	
	@PostMapping("/write")
	public String writeProc(
		Board writerContent,
		HttpSession session,
		List<MultipartFile> upFile
			) {
		writerContent.setWriterId((String)session.getAttribute("id"));
		writerContent.setWriterNick((String)session.getAttribute("nick"));
		//글작성
		menuShareFace.write(writerContent,upFile);
		logger.info("writerContent{}",writerContent);
		
		return "redirect:/share/view?boardNo=" + writerContent.getBoardNo() + "&menu=" + writerContent.getMenu() + "&cate=" + writerContent.getCate();
	}
	
	@GetMapping("/update")
	public String update(Board updateParam, Model model) {
		
		if( updateParam.getBoardNo() < 1 ) {
			return "redirect:./list";
		}
		//상세보기 페이지 아님 표시
		updateParam.setHit(-1);
		
		
		//상세보기 게시글 조회
		updateParam = menuShareFace.view(updateParam);
		model.addAttribute("updateBoard", updateParam);
		
		//첨부파일 정보 전달
		List<FileTb> boardfile = menuShareFace.getAttachFile( updateParam );
		model.addAttribute("boardfile", boardfile);

		
		
		return "menu/share/update";
		
	}
	
	@PostMapping("/update")
	public String updateProc(
			Board updateParam
			, List<MultipartFile> file
			, int[] delFileno
			, HttpSession session
			, Model model) {
		
		logger.info("updateParam {}", updateParam);
		logger.info("file {}", file);
		logger.info("delFileno {}", Arrays.toString(delFileno));


		updateParam.setWriterId((String) session.getAttribute("id"));
		updateParam.setWriterNick((String) session.getAttribute("nick"));
		
		menuShareFace.updateBoard(updateParam, file, delFileno);
		
		return "redirect:./view?boardNo=" + updateParam.getBoardNo();
	}
	
	@RequestMapping("/delete")
	public String delete(Board deleteParam, Model model) {
		
		if( deleteParam.getBoardNo() < 1 ) {
			return "redirect:/share/list";
		}

		menuShareFace.delete( deleteParam );
		
		return "redirect:./list?menu=" + deleteParam.getMenu() + "&cate=" + deleteParam.getCate();
	
	}
	
	@RequestMapping("/like")
	public ModelAndView like( Like like, ModelAndView mav, HttpSession session  ) {
		logger.info("like : {}", like);
		
		//추천 정보 토글
		like.setLikeId((String) session.getAttribute("id"));
		boolean result = menuShareFace.like(like);
		mav.addObject("result", result);
		
		//추천 수 조회
		int cnt = menuShareFace.getTotalCntLike(like);
		mav.addObject("cnt", cnt);

		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//댓글입력
	@PostMapping("/comment/insert")
	public String commentinsert(
			Comment comment, HttpSession session
			, Model model) {
		comment.setWriterId((String)session.getAttribute("id"));
		comment.setWriterNick((String)session.getAttribute("nick"));
		
		logger.info("코멘트나와야함{}",comment);
		
		//댓글 입력
		menuShareFace.commentinsert(comment);
		
		return "redirect:/share/comment/list?boardNo=" + comment.getBoardNo();
	}
	
	//댓글 리스트
	@GetMapping("/comment/list")
	public String list(
			Comment comment
			, HttpSession session
			, Model model) {
		comment.setWriterId((String)session.getAttribute("id"));
		comment.setWriterNick((String)session.getAttribute("nick"));
		//댓글 리스트 전달
		List<Comment> commentList = menuShareFace.list(comment);
		model.addAttribute("commentList", commentList);
		
		return "jsonView";
		
	}
	
	//댓글 삭제
	@RequestMapping("/comment/delete")
	public String delete(Comment commentDelete) {
		logger.info("commentDelete : {}", commentDelete);
		
		menuShareFace.commentdelete(commentDelete);
		
		return "jsonView";
	}
	@GetMapping("/book")
	public String book() {
		
		return "menu/share/book";
		
	}
	
	@PostMapping("/book")
	@ResponseBody
	public boolean book(
			Booking book, HttpSession session
			, Model model) {
		book.setBookerId((String)session.getAttribute("id"));
		logger.info("예약정보{}", book);
		logger.info("나와라잇{}", book.getStartTime());
		logger.info("나와라잇2{}", book.getEndTime());
		
		model.addAttribute("currentDate", new Date());
		model.addAttribute("today", new Date());
		
		//예약 확인
		boolean check = menuShareFace.checkBook(book);
		logger.info("예약 확인{}",check);
		model.addAttribute("check",check);
		
		return check;
		
	}
	
	
	
	
	
	

}
