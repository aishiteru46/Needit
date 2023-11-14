package web.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MainDao;
import web.dto.Banner;
import web.dto.Board;
import web.dto.FileTb;
import web.service.face.MainService;

@Service
public class MainServiceImpl implements MainService {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired MainDao mainDao;

	//베너 사진 업로드
	@Override
	public List<Banner> getBannerNo() {
		
		List<Banner> banner = new ArrayList<Banner>();
		banner = mainDao.getStoredName();
		return banner;
	}

	//최신 대여해요 게시글
	
	
	
	//최신 나눔해요 게시글
	@Override
	public List<Map<String, Object>> selectBoardStatus(Board board) {
		logger.info("{}",board);
		board.getTitle();
		return mainDao.selectAll(board);
	}

	@Override
	public List<FileTb> getImg(FileTb file) {
		logger.info("{}",file);
		file.getFileNo();
		return mainDao.selectFileImg(file);
	}

}
