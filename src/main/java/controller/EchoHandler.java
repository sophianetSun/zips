package controller;

import java.util.HashSet; 
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	Set<WebSocketSession> clients = new HashSet<WebSocketSession>();

	@Override	// 연결 종료시 호출되는 메서드
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		System.out.println("클라이언트 접속이 헤제됨 : " + status.getReason());
	}

	@Override	// 연결 되었을시 호출되는 메서드
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		System.out.println("클라이언트 접속됨");
	}

	@Override	// 메시지 수신시 호출되는 메서드
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		String payloadMessage = (String)message.getPayload();
		System.out.println("서버에 도착한 메시지 : " + payloadMessage);
		clients.add(session);
		for(WebSocketSession s : clients) {
			s.sendMessage(new TextMessage(payloadMessage));
		}
	}

	@Override // 전송 에러시 호출되는 메서드
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		super.handleTransportError(session, exception);
		System.out.println("오류 발생됨 : " + exception.getMessage());
	}
}
