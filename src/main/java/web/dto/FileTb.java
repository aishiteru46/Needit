package web.dto;

public class FileTb {
	
	private int fileNo;
	private String originName;
	private String storedName;
	private String thumbnailName;
	private String fileType;
	private int boardNo;

	public FileTb() {}

	public FileTb(int fileNo, String originName, String storedName, String thumbnailName, String fileType,
			int boardNo) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.storedName = storedName;
		this.thumbnailName = thumbnailName;
		this.fileType = fileType;
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "FileTb [fileNo=" + fileNo + ", originName=" + originName + ", storedName=" + storedName
				+ ", thumbnailName=" + thumbnailName + ", fileType=" + fileType + ", boardNo=" + boardNo + "]";
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}

	public String getThumbnailName() {
		return thumbnailName;
	}

	public void setThumbnailName(String thumbnailName) {
		this.thumbnailName = thumbnailName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
}
