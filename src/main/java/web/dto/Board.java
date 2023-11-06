package web.dto;

import java.util.Date;

public class Board {
	
	private int boardNo;
	private String cateNo;
	private String writerId;
	private Date writeDate;
	private int hit;
	private String title;
	private int price;
	private String content;
	private String location;

	public Board() {}

	public Board(int boardNo, String cateNo, String writerId, Date writeDate, int hit, String title, int price,
			String content, String location) {
		super();
		this.boardNo = boardNo;
		this.cateNo = cateNo;
		this.writerId = writerId;
		this.writeDate = writeDate;
		this.hit = hit;
		this.title = title;
		this.price = price;
		this.content = content;
		this.location = location;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", cateNo=" + cateNo + ", writerId=" + writerId + ", writeDate="
				+ writeDate + ", hit=" + hit + ", title=" + title + ", price=" + price + ", content=" + content
				+ ", location=" + location + "]";
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getCateNo() {
		return cateNo;
	}

	public void setCateNo(String cateNo) {
		this.cateNo = cateNo;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	
}
