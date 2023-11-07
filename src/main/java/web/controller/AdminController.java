package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	//푸터
	@GetMapping("/layout/footer")
	public void main() {}
	
	//이용약관
	@GetMapping("/terms/term")
	public void term() {}
	
	//개인정보처리방침
	@GetMapping("/terms/privacyPolicy")
	public void privacyPolicy() {}

	//위치기반서비스 이용약관
	@GetMapping("/terms/locationPolicy")
	public void locationPolicy() {}

	//고객센터
	@GetMapping("/admin/customerService")
	public void customerService() {}
	
	//고객센터 -> 공지사항
	@GetMapping("/admin/notice")
	public void notice() {}
	
	//고객센터 -> FAQ
	@GetMapping("/admin/faq")
	public void faq() {}
	
	//고객센터 -> 1:1채팅
	@GetMapping("/admin/chat")
	public void chat() {}
	
	//-------------------------------------
	
	@GetMapping("/admin/admin")
	public void admin() {}
	
	
	
}
