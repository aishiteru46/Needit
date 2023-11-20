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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.dto.Like;
import web.dto.Rent;
import web.dto.User;
import web.dto.UserFile;
import web.service.face.UserProfileService;

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
	public String profileView(Rent rent, Model model
			, HttpSession session, User user,Like like) {
		
		user.setId((String)session.getAttribute("id"));

		List<Map<String,Object>> list = userProfileService.rentList(user);
		model.addAttribute("booklist",list);
		
		
		
		//----------------------------------
		// 세션에서 사용자 ID 가져오기
        String userId = (String) session.getAttribute("id");
        
        // 사용자의 프로필 이미지 정보 가져오기
        UserFile img = userProfileService.imgSelect(userId);
        
        //회원등급 조회
        User userGrade = userProfileService.selectUserGrade(user);
        model.addAttribute("userGrade",userGrade);
        
        //추천수 조회
        int likeCount = userProfileService.cntLike(like);
        //회원등업
		User grade = userProfileService.updateGrade(likeCount, user);
		logger.info("회원등급{}",grade);
		model.addAttribute("grade",grade);
        
        //모델에 이미지 정보 추가
        model.addAttribute("img", img);
        
		
		return "profile/view";
		
	}
	
	//회원정보수정
	@GetMapping("/infoupdate")
	public String infoUpdate( ) {
		return "profile/userUpdate";
	}

	@PostMapping("/infoupdate")
	public String infoUpdateProc(User user, HttpSession session) {
		
		logger.info("회원정보업데이트 : {}", user);
		
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
	
	public String imgUpdateProc(@RequestParam("file") MultipartFile file, HttpSession session) {
		
		
		// 사용자 ID 가져오기
        String userId = (String) session.getAttribute("id");
        
        // 프로필 사진 업로드 및 데이터베이스에 저장
        userProfileService.imgUpdate(file, userId);

		return "redirect:/profile";
	}
	
	

	//프로필사진 삭제
	@PostMapping("/imgdelete")
	public String imgDelete(UserFile userFile) {
		
		userProfileService.imgDelete(userFile);
		
		return "/profile";
	}
	
	
	
	//자기소개
	@GetMapping("/introduce")
	public String intoduce() {
		
		return "/profile/view";
	}


	@PostMapping("/introduce")
	public String introduceProc(User user, Model model) {
		
		
		
		userProfileService.introduceUpdate(user);
		
		model.addAttribute("userpage", user);
		
		
		return "redirect:/profile/view";
	}
	
	@RequestMapping("/basket")
	public String basket() {
		
		return null;
	}
	
	
	
}
