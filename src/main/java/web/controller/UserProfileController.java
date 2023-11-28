package web.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.dto.Basket;
import web.dto.Board;
import web.dto.Business;
import web.dto.Comment;
import web.dto.Like;
import web.dto.Rent;
import web.dto.User;
import web.dto.UserFile;
import web.service.face.MenuPleaseService;
import web.service.face.UserProfileService;
import web.util.Paging;

@Controller
@RequestMapping("/profile")
public class UserProfileController {
	
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired UserProfileService userProfileService;
	
	
	//아무것도없이 /profile했을때 view로연결
	@GetMapping("")
	public String profile( ) {
		
		return "redirect:/profile/view";
	}
	
	
	@RequestMapping("/view")
	public String profileView(
			
			Rent rent
			, Model model
			, HttpSession session
			, User user
			, Like like
			, Board board
			, Comment comment
			, Paging param
			, Basket basket
			) {
		board.setWriterId((String)session.getAttribute("id"));
		user.setId((String)session.getAttribute("id"));
		like.setLikeId((String)session.getAttribute("id"));
		param.setUserId((String)session.getAttribute("id"));
		if((boolean)session.getAttribute("isLogin") == false) {
			return "redirect:/user/login";
		}
		
		Paging paging = userProfileService.getPaging(param);
		paging.setUserId((String)session.getAttribute("id"));

		//내 게시물에 예약한 정보
		List<Map<String,Object>> myList = userProfileService.myRentList(paging,user);
		logger.info("예약 정보 나와라아아아아{}",myList);
		model.addAttribute("myList",myList);
		
		//내가 예약한 정보
		List<Map<String,Object>> list = userProfileService.rentList(user);
		model.addAttribute("list",list);
		
		//----------------------------------
		// 세션에서 사용자 ID 가져오기
        String userId = (String) session.getAttribute("id");
        
        
        //추천수 조회
        int likeCount = userProfileService.cntLike(user);
        logger.info("likeCount두두{}",likeCount);
        //회원등급 조회
        User userGrade = userProfileService.selectUserGrade(user);
        logger.info("등급나와라잇{}",userGrade.getGrade());
        //회원등업
        if( (boolean)session.getAttribute("isLogin") == true) {
        	
		userProfileService.updateGrade(likeCount, userGrade);
        }
        User userGradeResult = userProfileService.gradeResult(userGrade);
        logger.info("reudd{}",userGradeResult);
        model.addAttribute("userGrade",userGradeResult.getGrade());
        
        // 사용자의 프로필 이미지 정보 가져오기
        UserFile  img = userProfileService.imgSelect(userId);
        logger.info("이미지 {} : ", img);
        //모델에 이미지 정보 추가
        model.addAttribute("img", img);

        //--------------------------------------------------------------
        //이걸로 user테이블 정보 다 가져올게요
        User profile = userProfileService.userAllSelect(user);
		
		model.addAttribute("user", profile);
        
		//--------------------------------------------------------------
		
		//내가 쓴 글 보기
		
		board.setWriterId((String) session.getAttribute("id"));
		
		//게시글 목록 조회
		List<Map<String, Object>> myBoardList = userProfileService.myBoardList(paging);
		model.addAttribute("paging", paging);
		logger.info("내가쓴글 list: {}", myBoardList);
		model.addAttribute("myBoardList", myBoardList);
		
		
		List<Board> boardList = userProfileService.boardSelectById(board);
		logger.info("내가쓴글목록: {}", boardList);
		
		// 모델에 페이징 정보와 글 목록 추가
	    model.addAttribute("boardPaging", paging);
		model.addAttribute("board", boardList);
		//--------------------------------------------------------------

		//내가 쓴 댓글 보기
		
		comment.setWriterId((String) session.getAttribute("id"));
		
		List<Map<String, Object>> commentList = userProfileService.commentSelectById(comment);
		logger.info("내가쓴댓글목록: {}", commentList);
		model.addAttribute("comment", commentList);
		
		//---------------------------------------------------------------
		
		//내 찜 목록
		List<Map<Board, Object>> basketList = userProfileService.selectBasketList(board);
		logger.info("바스켓또{}",basketList);
		model.addAttribute("basketList",basketList);
		
		return "profile/view";
		
		
	}
	
	//회원정보수정
	@GetMapping("/infoupdate")
	public String infoUpdate(User user, Model model, HttpSession session) {
		
		user.setId((String) session.getAttribute("id"));
		
		
		User loginUser = userProfileService.loginUserSelect(user);
		logger.info("loginUser: {}", loginUser);
		model.addAttribute("user", loginUser);
		
		return "profile/userUpdate";
	}

	@PostMapping("/infoupdate")
	public String infoUpdateProc(User user, HttpSession session, Model model) {
		
		logger.info("회원정보업데이트 : {}", user);
		
		User loginUser = userProfileService.loginUserSelect(user);
		logger.info("loginUser: {}", loginUser);
		
		model.addAttribute("user", loginUser);
		
		userProfileService.updateInfo(user);
		
		session.setAttribute("nick", user.getNick());
		
		return "redirect:/main";
		
	}
	
	
	//회원탈퇴
	@PostMapping("/delete")
	public String delete(@RequestParam("id") String userId, HttpSession session, RedirectAttributes rttr) {
	    // 세션에서 로그인된 사용자의 ID 가져오기
	    String sessionId = (String) session.getAttribute("id");

	    // 현재 로그인된 사용자와 탈퇴하려는 사용자의 ID가 일치하는지 확인
	    if (sessionId.equals(userId)) {
	        // 사용자 정보 삭제 로직 수행
	        userProfileService.userDelete(userId);

	        // 세션 무효화 (로그아웃)
	        session.invalidate();

	        rttr.addFlashAttribute("msgType", "성공 메세지");
	        rttr.addFlashAttribute("msg", "회원 탈퇴가 완료되었습니다.");
	        return "redirect:/main";
	    } else {
	        // 권한이 없는 사용자가 탈퇴를 시도한 경우
	        rttr.addFlashAttribute("msgType", "실패 메세지");
	        rttr.addFlashAttribute("msg", "잘못된 접근입니다.");
	        return "redirect:/main";
	    }
	}
	
	
	//프로필사진등록
	@GetMapping("/imgupdate")
	public String imgUpdate() {
		
		return "/profile/view";
	}
	
	@PostMapping("/imgupdate")
	
	public String imgUpdateProc(@RequestPart("file") MultipartFile file, HttpSession session, Model model) {
		
		
		// 사용자 ID 가져오기
        String userId = (String) session.getAttribute("id");
        
        // 프로필 사진 업로드 및 데이터베이스에 저장
        userProfileService.imgUpdate(file, userId);
        
     // 사용자의 프로필 이미지 정보 가져오기
        UserFile img = userProfileService.imgSelect(userId);
        logger.info("프로필이미지ajax {} : ", img);
        model.addAttribute("img", img);
        //모델에 이미지 정보 추가
        
        

        return "jsonView";
	}
	
	

	//프로필사진 삭제
	@GetMapping("/imgdelete")
	public String imgDelete(UserFile userFile, HttpSession session) {
		
		logger.info("userFile 프로필삭제:{}", userFile);
		userFile.setId((String) session.getAttribute("id"));
		userProfileService.imgDelete(userFile);
		
		
		return "jsonView";
	}
	
	//자기소개
	@GetMapping("/introduce")
	public String intoduce(User user, Model model) {
		
		User intro = userProfileService.userAllSelect(user);
		
		logger.info("인트로{}",intro.getIntro());
		
		model.addAttribute("user", intro);
		
		return "/profile/introduce";
	}


	@PostMapping("/introduce")
	public String introduceProc(User user, Model model) {

		logger.info("자기소개 업데이트 : {}",user);
		//자기소개 업데이트
		userProfileService.introduceUpdate(user);
		
		User intro = userProfileService.userAllSelect(user);
		
		
		model.addAttribute("user", intro);
		
		return "jsonView";
	}
	
	
	
	@RequestMapping("/confirm")
	public String confirm(Rent rent, Model model,HttpSession session) {
		logger.info("렌트 번호{}",rent);
		
		rent.setRenterId((String)session.getAttribute("id"));
		
		//업데이트 여부 확인 confirm
        boolean confirmStatus = userProfileService.updateRentStatus(rent);
        logger.info("성공{}",confirmStatus);
        model.addAttribute("confirm",confirmStatus);
        
        boolean checkCon = userProfileService.checkConfirm(rent);
		logger.info("컨트롤러 컨펌{}",checkCon);
		session.setAttribute("checkCon", checkCon);
		model.addAttribute("checkCon", checkCon);
        
      
		return "jsonView";
		
	}
	
	@RequestMapping("/cancel")
	public String cancel(Rent rent, Model model, HttpSession session) {
		logger.info("렌트 번호캔슬{}",rent);
		
		//업데이트 여부 확인 cancel
		boolean cancelStatus = userProfileService.updateRentCancel(rent);
		logger.info("취소{}",cancelStatus);
        model.addAttribute("cancel",cancelStatus);
        
        boolean checkCan = userProfileService.checkCancel(rent);
      	logger.info("컨트롤러 취소{}",checkCan);
      	session.setAttribute("checkCan", checkCan);
      	model.addAttribute("checkCan", checkCan);
        

		return "jsonView";

	}
	
	@GetMapping("/business")
	public void business() {
		
	}
	
	@PostMapping("/business")
	public String businessProc(
			Business busi, User user
			, HttpSession session) {
		logger.info("업체{}",busi);
		
		busi.setId((String) session.getAttribute("id"));
		user.setId((String) session.getAttribute("id"));
		
		
		userProfileService.insertBusiness(busi, user);
		return "redirect:/profile/view";
	}
	
	
	
//	
//	//내가 쓴 글 목록 가져오기
//	@GetMapping("/writelist")
//	public String writeList(HttpSession session, User user, Model model) {
//		
//		user.setId((String) session.getAttribute("id"));
//		
//		List<Board> board = userProfileService.boardSelectById(user);
//		
//		model.addAttribute("board", board);
//		
//		return "/profile/view";
//	}
//	
	
	
	
}
