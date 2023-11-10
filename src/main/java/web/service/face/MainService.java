package web.service.face;

import java.util.List;

import web.dto.Banner;

public interface MainService {

	/**
	 * bannerNo를 통해 storedName을 받아와 썸네일의 띄운다 
	 * 
	 * @return - 사진 저장 배열
	 */
	public List<Banner> getBannerNo();

}
