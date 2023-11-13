package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Comment;
import web.service.face.MenuPleaseService;

@Controller
@RequestMapping("/comment")
public class MenuPleaseCommentController {

	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired private MenuPleaseService menuPleaseService;
	
	
	@RequestMapping(value = "/insert")
	public String insert(Comment comment, Model model, HttpSession session) {
		
		comment.setWriterId((String) session.getAttribute("id"));
		menuPleaseService.insertComment(comment);
		
		
		return "redirect:/board/view?boardNo="+comment.getBoardNo();
	}
	
	

	
}
