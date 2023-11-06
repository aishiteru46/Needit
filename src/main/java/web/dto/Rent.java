package web.dto;

import java.util.Date;

public class Rent {
	
	private int rentNo;
	private int rentStatus;
	private Date rentDate;
	private int boardNo;
	private String id;

	public Rent() {}

	public Rent(int rentNo, int rentStatus, Date rentDate, int boardNo, String id) {
		super();
		this.rentNo = rentNo;
		this.rentStatus = rentStatus;
		this.rentDate = rentDate;
		this.boardNo = boardNo;
		this.id = id;
	}

	@Override
	public String toString() {
		return "Rent [rentNo=" + rentNo + ", rentStatus=" + rentStatus + ", rentDate=" + rentDate + ", boardNo="
				+ boardNo + ", id=" + id + "]";
	}

	public int getRentNo() {
		return rentNo;
	}

	public void setRentNo(int rentNo) {
		this.rentNo = rentNo;
	}

	public int getRentStatus() {
		return rentStatus;
	}

	public void setRentStatus(int rentStatus) {
		this.rentStatus = rentStatus;
	}

	public Date getRentDate() {
		return rentDate;
	}

	public void setRentDate(Date rentDate) {
		this.rentDate = rentDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
