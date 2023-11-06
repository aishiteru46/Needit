package web.dto;

import java.util.Date;

public class Booking {
	
	private int bookNo;
	private int bookStatus;
	private Date bookDate;
	private int boardNo;
	private String bookerId;

	public Booking() {}

	public Booking(int bookNo, int bookStatus, Date bookDate, int boardNo, String bookerId) {
		super();
		this.bookNo = bookNo;
		this.bookStatus = bookStatus;
		this.bookDate = bookDate;
		this.boardNo = boardNo;
		this.bookerId = bookerId;
	}

	@Override
	public String toString() {
		return "Booking [bookNo=" + bookNo + ", bookStatus=" + bookStatus + ", bookDate=" + bookDate + ", boardNo="
				+ boardNo + ", bookerId=" + bookerId + "]";
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public int getBookStatus() {
		return bookStatus;
	}

	public void setBookStatus(int bookStatus) {
		this.bookStatus = bookStatus;
	}

	public Date getBookDate() {
		return bookDate;
	}

	public void setBookDate(Date bookDate) {
		this.bookDate = bookDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBookerId() {
		return bookerId;
	}

	public void setBookerId(String bookerId) {
		this.bookerId = bookerId;
	}
	
	
}
