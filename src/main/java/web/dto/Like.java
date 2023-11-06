package web.dto;

public class Like {
	
	private int likeNo;
	private String likeId;
	private int boardNo;

	public Like() {}

	public Like(int likeNo, String likeId, int boardNo) {
		super();
		this.likeNo = likeNo;
		this.likeId = likeId;
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "Like [likeNo=" + likeNo + ", likeId=" + likeId + ", boardNo=" + boardNo + "]";
	}

	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}

	public String getLikeId() {
		return likeId;
	}

	public void setLikeId(String likeId) {
		this.likeId = likeId;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	
}
