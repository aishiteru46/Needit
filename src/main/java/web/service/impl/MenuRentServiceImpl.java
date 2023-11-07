package web.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MenuRentDao;
import web.service.face.MenuRentService;
import web.util.Paging;

@Service
public class MenuRentServiceImpl implements MenuRentService {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired private MenuRentDao menuRentDao;

	@Override
	public Paging getPaging(Paging param) {
		
		//총 게시글 수 조회
		int totalCount = menuRentDao.selectCntAll();
		
		//페이징 객체 생성(페이징 계산)
		Paging paging = new Paging( totalCount, param.getCurPage() );
		
		return paging;
	}

	@Override
	public void list(Paging param) {
		
	}

}
