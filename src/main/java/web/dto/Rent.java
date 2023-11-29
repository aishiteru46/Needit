package web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Rent {
	
	private int rentNo;
	private int boardNo;
	private String renterId;
	private int rentStatus;
	private int paymentType;
	private Date rentDate;
	private long startTime;
	private long endTime;
	private long currentTime;

}
