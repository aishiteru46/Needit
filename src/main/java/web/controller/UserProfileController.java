package web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.dto.User;
import web.service.face.UserProfileService;

@Controller
@RequestMapping("/profile")
public class UserProfileController {
	
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired UserProfileService userProfileService;
	
	@GetMapping("/infoupdate")
	public String infoUpdate( ) {
		return "profile/userUpdate";
	}

	@PostMapping("/infoupdate")
	public String infoUpdateProc(
			User user
			, RedirectAttributes rttr
			, HttpSession session
			, String pw1
			, String pw2
			
			) {
		
		//회원 수정 안될떄
		if(user.getId()==null || user.getId().equals("") ||
		   pw1==null || pw1.equals("") ||
		   pw2==null || pw2.equals("") ||
		   user.getName()==null ||	user.getName().equals("")) {
			rttr.addFlashAttribute("msg", "모든 내용을 입력하세요");	
			return "redirect:/infoupdate";
		}
		
		if (!pw1.equals(pw2)) {
			rttr.addFlashAttribute("msg", "비밀번호 불일치");
			return "redirect:/infoupdate";
		}
		
		//회원 수정
		
		
		
		
		return null;
				
		
	}
	
	
	
	
	@RequestMapping("/imgupdate")
	public String imgUpdate(
			HttpServletRequest req
			, HttpSession session
			, RedirectAttributes rttr
			
			) {
		
		
		
		
		
		
		
	return null;
		
		
		
		
	}
	

	
}
