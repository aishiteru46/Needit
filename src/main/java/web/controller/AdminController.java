package web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Banner;
import web.dto.Board;
import web.dto.Report;
import web.service.face.AdminService;
import web.util.Paging;

@Controller
public class AdminController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired AdminService adminService;
	@Autowired JavaMailSender mailSender;
	
	//소개 페이지(오프닝 페이지)
	@GetMapping("/opening")
	public void opening() {}
	
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
	public String customerService() {
		return "admin/customerService";
	}
	
	//고객센터 -> FAQ
	@GetMapping("/admin/faq")
	public String faq() {
		return "admin/faq";
	}
	
	//고객센터 -> 1:1채팅
	@GetMapping("/admin/chat")
	public void chat() {}
	
	//-------------------------------------
	
	//관리자 로그아웃
	@RequestMapping("/main")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/main";
	}
	
	//관리자 메인페이지
	@GetMapping("/admin")
	public String admin() {
		return "/admin/admin";
	}
	
	//관리자 일일 방문자수 조회
	@GetMapping("/admin/dayVisit")
	public void dayVisit() {}

	//관리자 신고접수 목록
	@GetMapping("/admin/reportList")
	public void reportList() {}
	
	//관리자 업체요청 목록 
	@GetMapping("/admin/businessReq")
	public void businessReq() {}

	//관리자 메인배너 접속
	@GetMapping("/admin/bannerUpdate")
	public void banner() {}
	
	//관리자 메인배너 수정
	@PostMapping("/admin/bannerUpdate")
	public String bannerUpdate( 
			Banner bannerParam, 
			List<MultipartFile> file,
			HttpSession session,
			Model model
			) {
		logger.info("bannerParam : {}", bannerParam.getBannerNo());
		
		adminService.bannerUpdate(bannerParam, file);
		//--------------------------------------
		
		List<Banner> bannerNames = new ArrayList<Banner>();
		bannerNames = adminService.getBannerNo();
		logger.info(bannerNames.toString());
		
		model.addAttribute("file", bannerNames);
		
		//배너사진 관리자 페이지 세션에 저장
		session.setAttribute("file", bannerNames);
		return "admin/bannerUpdate";
	}
	
	
	//관리자 공지조회
	@GetMapping("/admin/noticeUpdate")
	public void noticeUpdate() {}
	
	//관리자 공지등록
	@PostMapping("/admin/noticeUpdate")
	public String noticeUpdateProc(
			Board writeNotice,
			HttpSession session
			) {
		
		writeNotice.setWriterId((String) session.getAttribute("id"));
		writeNotice.setWriterNick((String) session.getAttribute("nick"));
		
		adminService.writeNotice(writeNotice);
		
		return "redirect:/admin/noticeUpdate";
	}
	
	//공지사항 list 조회
	@GetMapping("/admin/noticeList")
	public void noticeList(Model model, HttpSession session) {
		
		List<Board> noticeList = adminService.noticeList(); 
		model.addAttribute("noticeList", noticeList);
		session.setAttribute("noticeList", noticeList);
		
//		logger.info("공지사항 목록 : {}", noticeList);
	}
	
	
	
	
	//관리자 회원이메일 발송 
	@GetMapping("/admin/emailSend")
	public void emailSend() {}
	
	
	// mailSending 코드
	@RequestMapping(value = "/admin/emailSend", method = RequestMethod.POST)
	@ResponseBody
	public String emailSend(String m_email) {

		//뷰에서 넘어왔는지 확인
		//System.out.println("이메일 전송");
		
		//난수 생성(인증번호)
		Random r = new Random();
		int num = r.nextInt(888888) + 111111;  //111111 ~ 999999
//		System.out.println("인증번호:" + num);
		
		/* 이메일 보내기 */
        String setFrom = "Needit@gmail.com"; //보내는 이메일
        String toMail = m_email; //받는 사람 이메일
        String title = "Needit 방문을 환영합니다.";
        String content = 
                "Needit 홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "저희 서비스를 이용해 주셔서 감사합니다." + 
                "<br>" + 
                "많은 이용 부탁드립니다.";
        
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
	
	//신고버튼 클릭시
	@GetMapping("/admin/report")
	public void report() {}
	
	//신고 접수
	//추후 수정
	@PostMapping("/admin/report")
	public String reportUpdate(Report reportNo, HttpSession session) {
		logger.info("report [POST]");
		logger.info("{}", reportNo);
		
		reportNo.setReportId(session.getId());
		
		return "redirect:/main";
	}
	
	//-------------------------------------

	
	
	
}
