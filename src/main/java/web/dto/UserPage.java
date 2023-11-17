package web.dto;

import lombok.Data;

@Data
public class UserPage {
	
	private String id;
	private String grade;
	private int businessNo;
	private String intro;
	private int profileImgNo;
	private String originName;
	private String storedName;
	private String thumbnailName;
	private String fileType;
}
