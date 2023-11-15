package web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Board;
import web.service.face.MapService;

@Controller
public class MapController {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired private MapService mapService;
	
	@GetMapping("/map")
	public String map() {
		return "map/map";
	}
	
	@GetMapping("/map/list")
	public String list( Model model ) {
		List<List<Board>> board = mapService.list();
		model.addAttribute("board", board);
		return "jsonView";
	}
}
