package web.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Board;
import web.dto.User;
import web.service.face.UserService;


@Controller
@RequestMapping("/user")
public class LoginController {

	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired UserService userService;
	@Autowired JavaMailSender mailSender;


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
	public String loginProc( User user, HttpSession session,HttpServletRequest request, Board boardParam, String type) {
		logger.info("boardParam.getBoardNo() : {}", boardParam.getBoardNo());
		logger.info("boardParam.getMenu() : {}", boardParam.getMenu());
		logger.info("boardParam.getCate() : {}", boardParam.getCate());
		logger.info("type : {}", type);
		
		// 로그인 이전의 URL을 세션에 저장
        String referer = request.getHeader("Referer");
        session.setAttribute("originalUrl", referer);
		
		boolean islogin = userService.login(user);
		user = userService.infoNick(user);
		session.setAttribute("isLogin", islogin);
		
		if(islogin) {
			logger.info("로그인 성공 {}",user);
			session.setAttribute("id", user.getId());
			session.setAttribute("nick", user.getNick());
			session.setAttribute("addr1", user.getAddr1());
			
			 // 세션에서 로그인 이전의 URL을 가져오기
            String originalUrl = (String) session.getAttribute("originalUrl");
            if (originalUrl != null && !originalUrl.contains("/login")) {
                // 로그인 이전의 URL이 있으면 해당 URL로 리디렉션
                return "redirect:" + originalUrl;
            } else {
                // 로그인 이전의 URL이 없거나 로그인 페이지 자체였다면 기본 페이지로 리디렉션
                return "redirect:/main";
            }    
		} else {
			logger.info("로그인 실패");
			return"redirect:./login";
		}
		
	}
	@PostMapping("/logout")
	 @ResponseBody
	    public void logoutPOST(HttpServletRequest request) throws Exception{
	        
	        logger.info("비동기 로그아웃 메서드 진입");
	        
	        HttpSession session = request.getSession();
	        
	        session.invalidate();
	        
	    }
	// mailSending 코드
	@RequestMapping(value = "mailSender.do", method = RequestMethod.GET)
	@ResponseBody
	public String mailSending(String m_email) {

		//뷰에서 넘어왔는지 확인
		//System.out.println("이메일 전송");
		
		//난수 생성(인증번호)
		Random r = new Random();
		int num = r.nextInt(888888) + 111111;  //111111 ~ 999999
		System.out.println("인증번호:" + num);
		
		/* 이메일 보내기 */
        String setFrom = "Needit@gmail.com"; //보내는 이메일
        String toMail = m_email; //받는 사람 이메일
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "Needit 홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + num + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String rnum = Integer.toString(num);  //view로 다시 반환할 때 String만 가능
        
        return rnum;
 
		
	}
}
