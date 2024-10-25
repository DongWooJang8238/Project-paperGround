package org.joonzis.controller;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/testserver.do")
public class SocketServer {

	@OnOpen
	public void handelOpen() {
		System.out.println("클라이언트가 접속했습니다.");
	}
	
	@OnClose
	public void handleClose() {
		System.out.println("클라이언트가 종료했습니다.");
	}
	
	@OnMessage
	public String handleMasseage(String msg) {
		System.out.println("클라이언트가 보낸 메시지: " + msg);
		
		return "(응답)" + msg;
	}
	
	@OnError
	public void handleError(Throwable e) {
		System.out.println("에러 발생 " + e.getMessage());
	}
	
}