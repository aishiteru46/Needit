package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Board;
import web.dto.User;
import web.service.face.UserService;


@Controller
@RequestMapping("/user")
public class LoginController {

	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired UserService userService;


	@GetMapping("/signup")
	public void signUp() {}
	
	@PostMapping("/signup")
	public String signUpProc( User user) {
		logger.info("회원가입 : {}",user);
		
		userService.join(user);
		
		return "redirect:./login";
	}
	
	@RequestMapping("/idCheck")
	public @ResponseBody boolean idCheck(User user) {
		boolean result = userService.idCheck(user);
		
		logger.info("{}",result);
		
		return result;
		
	}
	
	@RequestMapping("/nickCheck")
	public @ResponseBody boolean ncikCheck(User user) {
		boolean result = userService.ncikCheck(user);
		
		logger.info("{}",result);
		
		return result;
		
	}
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String loginProc( User user, HttpSession session, Board boardParam, String type) {
		logger.info("boardParam : {}", boardParam.getBoardNo());
		logger.info("boardParam : {}", boardParam.getMenu());
		logger.info("type : {}", type);
		
		boolean islogin = userService.login(user);
		user = userService.infoNick(user);
		session.setAttribute("isLogin", islogin);
		
		if(islogin) {
			logger.info("로그인 성공 {}",user);
			session.setAttribute("id", user.getId());
			session.setAttribute("nick", user.getNick());
			session.setAttribute("addr1", user.getAddr1());
			
			if( boardParam.getBoardNo() > 0 ) {

				return"redirect:/menu/" + type + "/view?boardNo="+boardParam.getBoardNo()+"&menu="+boardParam.getMenu();
			} else {
				
				return"redirect:/main";
			}
			
		} else {
			logger.info("로그인 실패");
			return"redirect:./login";
		}
		
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/main";
		
	}
}
