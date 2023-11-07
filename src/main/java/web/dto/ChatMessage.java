package web.dto;

import java.util.Date;

public class ChatMessage {
	
	private String roomId;
	private String 	sender;
	private String message;
	private Date sendWrite;
	
	public ChatMessage() {}

	public ChatMessage(String roomId, String sender, String message, Date sendWrite) {
		super();
		this.roomId = roomId;
		this.sender = sender;
		this.message = message;
		this.sendWrite = sendWrite;
	}

	@Override
	public String toString() {
		return "ChatMessage [roomId=" + roomId + ", sender=" + sender + ", message=" + message + ", sendWrite="
				+ sendWrite + "]";
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getSendWrite() {
		return sendWrite;
	}

	public void setSendWrite(Date sendWrite) {
		this.sendWrite = sendWrite;
	}
	

}
