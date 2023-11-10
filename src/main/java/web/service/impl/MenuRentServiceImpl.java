package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.MenuRentDao;
import web.dto.Board;
import web.dto.FileTb;
import web.service.face.MenuRentService;
import web.util.Paging;

@Service
public class MenuRentServiceImpl implements MenuRentService {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired private MenuRentDao menuRentDao;
	@Autowired private ServletContext context;
	
	@Override
	public List<Board> list(Paging paging) {
		logger.info("MenuRentServiceImpl list() 호출");
		return menuRentDao.selectAll(paging);
	}

	@Override
	public Paging getPaging(Paging param) {
		
		//총 게시글 수 조회
		int totalCount = menuRentDao.selectCntAll(param);
		
		//페이징 객체 생성(페이징 계산)
		Paging paging = new Paging( param.getMenu(), totalCount, param.getCurPage() );
		
		return paging;
	}

	@Override
	public Board view(Board board) {
		
		//update 일 때에는 조회수가 증가되지 않는다
		if( board.getHit() != -1 ) {
			//조회수 증가
			menuRentDao.updateHit(board);
		}
		
		return menuRentDao.selectByBoardNo(board);
	}

	@Override
	public void write(Board writeParam, List<MultipartFile> file) {
		
		//글작성 
		menuRentDao.insertBoard(writeParam);
		
		//첨부파일이 없을 경우 처리
		if( file.size() == 0 ) {
			return;
		}

		for(MultipartFile f : file) {
			this.fileinsert( f, writeParam.getBoardNo() );
		}

	}
	
	private void fileinsert( MultipartFile file, int boardNo ) {
		//빈 파일 처리
		if( file.getSize() <= 0 ) {
			return;
		}
		logger.info("boardNo{}",boardNo);
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		
		//upload 폴더 생성
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		
		//저장될 파일 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		String fileType = originName.substring(originName.lastIndexOf(".")+ 1);
		
		//저장할 파일 객체
		File dest = new File(storedFolder, storedName);
	
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//---------------------------------------------------------------------------

		FileTb fileTb = new FileTb();
		fileTb.setBoardNo( boardNo );
		fileTb.setOriginName( originName );
		fileTb.setStoredName( storedName );
		fileTb.setFileType(fileType);
		
		menuRentDao.insertFile( fileTb );

	}



}
