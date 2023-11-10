package web.dao.face;

import java.util.List;

import web.dto.Banner;

public interface MainDao {

	/**
	 * DB에서 storedName을 받아와 main.jsp에 썸네일로 띄운다
	 * 
	 * @return 사진 저장 배열
	 */
	public List<Banner> getStoredName();

}
