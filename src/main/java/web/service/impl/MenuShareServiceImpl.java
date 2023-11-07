package web.service.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MenuShareDao;
import web.dto.Board;
import web.service.face.MenuShareFace;
import web.util.Paging;

@Service
public class MenuShareServiceImpl implements MenuShareFace{
	
	//로그 객체 
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired MenuShareDao menuShareDao;
	@Autowired ServletContext context;
	
	@Override
	public Paging getPaging(Paging param) {
		
		int totalCount = menuShareDao.selectCntAll(param);
		
		Paging paging = new Paging(totalCount, param.getCurPage());
		
		return paging;
	}
	
	@Override
	public List<Board> selectBoardStatus(Paging paging, Board board) {
		
		return menuShareDao.selectShareList(board);
	}



	
}
