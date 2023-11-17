package web.service.impl;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.UserProfileDao;

import web.dto.Booking;
import web.dto.User;
import web.dto.UserPage;
import web.service.face.UserProfileService;

@Service
public class UserProfileServiceImpl implements UserProfileService {

	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired UserProfileDao userProfileDao;
	@Autowired private ServletContext context;
	
	@Override
	public void updateInfo(User user) {
		
		userProfileDao.infoUpdate(user);
	}


	@Override
	public void userDelete(String userId) {
		
		userProfileDao.deleteUser(userId);
	}


	@Override
	public void imgUpdate(MultipartFile file, String userId) {
		
		//빈 파일 처리
		if( file.getSize() <= 0 ) {
			return;
		}
        
        
        
        // 허용된 확장자들
        List<String> allowedExtensions = Arrays.asList("jpg", "jpeg", "png", "gif");

        // 원본 파일 이름에서 확장자 추출
        String originalFilename = file.getOriginalFilename();
        String fileExtension = originalFilename.substring(originalFilename.lastIndexOf(".") + 1).toLowerCase();

        // 허용된 확장자인지 검사
        if (!allowedExtensions.contains(fileExtension)) {
            // 허용되지 않은 확장자인 경우 처리 (예: 오류 메시지 반환 또는 예외 처리)
            return;
        }
        
        
        
        // 파일이 저장될 경로
        String storedPath = context.getRealPath("upload");

        // upload 폴더 생성
        File storedFolder = new File(storedPath);
        storedFolder.mkdir();
        
        //저장될 파일 이름
  		String originName = file.getOriginalFilename();
  		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
  		String fileType = originName.substring(originName.lastIndexOf(".")+ 1);

  		//압축 이미지용 저장될 파일 이름
		String thumbnailName = "t_" + storedName;
		logger.info("thumbnailName  : " + thumbnailName );
		
		//저장할 파일 객체
		File dest = new File(storedFolder, storedName);
		
		try {
			
			file.transferTo(dest);
			
	         //--- 이미지 파일 압축하여 저장하기 ---
			
			 //썸네일 파일생성 객체
			 File thumbnailFile = new File(storedPath, "t_" + storedName);
	         
	         //원본 파일을 압축할 파일명 변수에 대입
	         BufferedImage bufOriginImage = ImageIO.read(dest);
	         //압축될 파일의 ('넓이', '높이', '생성될 이미지의 타입') 지정->원하는 크기로 지정가능
	         BufferedImage bufPressImage = new BufferedImage(500, 500, BufferedImage.TYPE_3BYTE_BGR);
	         
	         //BufferedImage 객체에 Grahpic2D객체를 이용해 그리기
	         Graphics2D graphic = bufPressImage.createGraphics();
	         
	         // drawImage 메서드를 호출하여 원본 이미지(원본 BuffedImage)를 
	         //썸네일 BufferedImage에 지정한 크기로 변경하여 왼쪽 상단 "0, 0" 좌표부터 그리기
	         graphic.drawImage(bufOriginImage, 0, 0, 500, 500, null);
	         
	         // ImageIO의 write 메서드를 호출하여 그려진 객체를 파일로 저장
	         //write() -> 매개변수( 파일로 저장할 이미지, (String)이미지 형식, 저장될 경로 )
	         ImageIO.write(bufPressImage, "jpg", thumbnailFile);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//---------------------------------------------------------------------------

		
		// 이미지 정보를 user_page 테이블에 저장
	    UserPage userPage = new UserPage();
	    userPage.setId(userId);
	    userPage.setOriginName(originalFilename);
	    userPage.setStoredName(storedName);
	    userPage.setThumbnailName(thumbnailName);  // 썸네일 이름은 필요에 따라 변경
	    userPage.setFileType(fileType);

	    userProfileDao.updateImg(userPage);
		
		
	}	

	public List<Booking> bookList(Booking book) {
		
		return userProfileDao.selectBookList(book);
	}


	@Override
	public UserPage imgSelect(String userId) {
		
		
		return userProfileDao.selectImg(userId);
	}

}
