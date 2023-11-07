package web.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MenuPleaseDao;
import web.dto.Board;
import web.dto.FileTb;
import web.service.face.MenuPleaseService;
import web.util.Paging;

@Service
public class MenuPleaseServiceImpl implements MenuPleaseService{
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired private MenuPleaseDao menuPleaseDao;
	
	
	@Override
	public List<Board> list(Paging paging) {
		return null;
	}

	@Override
	public Paging getPaging(Paging param) {
		return null;
	}

	@Override
	public Board view(Board viewBoard) {
		return null;
	}

	@Override
	public List<FileTb> getAttachFile(Board viewBoard) {
		return null;
	}

}
