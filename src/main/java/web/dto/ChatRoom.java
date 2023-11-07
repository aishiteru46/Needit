package web.dto;

public class ChatRoom {
	
	private String roomId;
	private String userA;
	private String userB;

	public ChatRoom() {}

	public ChatRoom(String roomId, String userA, String userB) {
		super();
		this.roomId = roomId;
		this.userA = userA;
		this.userB = userB;
	}

	@Override
	public String toString() {
		return "ChatRoom [roomId=" + roomId + ", userA=" + userA + ", userB=" + userB + "]";
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getUserA() {
		return userA;
	}

	public void setUserA(String userA) {
		this.userA = userA;
	}

	public String getUserB() {
		return userB;
	}

	public void setUserB(String userB) {
		this.userB = userB;
	}
	
}
