package web.controller;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.dto.User;
import web.service.face.UserProfileService;

@Controller
@RequestMapping("/profile")
public class UserProfileController {
	
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired UserProfileService userProfileService;
	
	
	@GetMapping("")
	public String profile() {
		
		return "redirect:/profile/imgupdate";
	}
	
	
	
	
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
	
	
	
	
	
	
	
	@RequestMapping("/imgupdate")
	public String imgUpdate(
			HttpServletRequest req
			, HttpSession session
			, RedirectAttributes rttr
			, Model model
			) {
		
		
		String id = (String) session.getAttribute("id");
		model.addAttribute("id", id);
		
		
		
		
		
		
		
	return "/profile/view";
		
		
		
		
	}
	

	
}
