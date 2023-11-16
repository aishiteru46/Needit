package web.controller;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@RestController
public class NewsController { // SSE를 처리하는 컨트롤러
	
	// CopyOnWriteArrayList를 사용하여 생성된 SSE('SseEmitter'객체)
	// 인스턴스들을 저장하는 리스트
	public List<SseEmitter> emitters = new CopyOnWriteArrayList<>();
	
	@GetMapping(value="/sse/connect", produces = "application/json;charset=UTF-8")
	public String connect() {
		return "남경민 바보";
		
	}
	
	// 클라이언트 subcription(구독)을 위한 메소드
	@CrossOrigin
	@RequestMapping(value = "/subscribe", consumes = MediaType.ALL_VALUE ) // SSE를 구독하기 위한 endpoint
	public SseEmitter subscribe() {
		SseEmitter sseEmitter = new SseEmitter(Long.MAX_VALUE); // SSE객체 생성
		try {
			sseEmitter.send(sseEmitter.event().name("INIT")); // 클라이언트에 이벤트 초기화 이벤트 전달
		} catch (IOException e) {
			e.printStackTrace();
		}
		sseEmitter.onCompletion(() -> emitters.remove(sseEmitter) );
		
		emitters.add(sseEmitter); // 생성된 SseEmitter를 emitters 리스트에 추가
		return sseEmitter; // SseEmitter 반환
	}
	
	// 1. [클라이언트] '/subcribe'에 연결 ->
	// 2. [서버] 해당 클라이언트에 대한 'SseEmitter' 생성하고 초기 이벤트('INIT') 전송 ->
	// 3. [서버] 'dispatchEvent'를 통해 이벤트가 발생하면,
	// 해당 이벤트를 모든 클라이언트의 SseEmitter에 전송하여 실시간으로 데이터 업데이트

	// 모든 클라이언트들에 대한 dispatching을 위한 메소드
	@RequestMapping(value = "/dispatchEvent")
	public void dispatchEventToClients (String freshNews) {
		
		for ( SseEmitter emitter : emitters ) {
			try {
				emitter.send(SseEmitter.event().name("latestNews").data(freshNews));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	
}
