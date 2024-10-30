package org.joonzis.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.joonzis.domain.ChatRoomDTO;
import org.joonzis.domain.ChattingDTO;
import org.joonzis.service.UsedShopService;
import org.springframework.context.ApplicationContext;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@ServerEndpoint("/testserver.do")
public class SocketServer {

	private UsedShopService service;
	private static Set<Session> sessions = new HashSet<>();
	
	public SocketServer() {
        ApplicationContext context = ApplicationContextProvider.getApplicationContext();
        this.service = context.getBean(UsedShopService.class);
    }

	@OnOpen
	public void handelOpen(Session session) {
		log.warn("채팅방 오픈 췍췤췍췤");
		sessions.add(session);

		int ubno = Integer.parseInt(session.getRequestParameterMap().get("ubno").get(0));
		int sellmno = Integer.parseInt(session.getRequestParameterMap().get("sellmno").get(0));
		int buymno = Integer.parseInt(session.getRequestParameterMap().get("buymno").get(0));

		System.out.println("클라이언트가 접속했습니다. ubno: " + ubno + ", sellmno: " + sellmno + ", buymno: " + buymno);

		ChatRoomDTO chat = new ChatRoomDTO();
		chat.setUbno(ubno);
		chat.setSellmno(sellmno);
		chat.setBuymno(buymno);

		log.warn("데이터 저장 확인. ubno: " + chat.getUbno() + ", sellmno: " + chat.getSellmno() + ", buymno: "
				+ chat.getBuymno());
		// 채팅 방 생성
		// 채팅 방 유무 check ( sellmno(판매자번호), buymno(구매자번호), ubno(중고상품번호)를 통해 select 해서
		// 존재한다면 1, 없다면 0 판단 )
		int chatRoomCheck = service.chatingRoomCheck(chat);

		if (chatRoomCheck == 1) {
			log.warn("채팅방 존재" + chatRoomCheck);
			// 채팅 방이 있을 시 ( 기존 데이터를 가져와서 뿌려주기 , 채팅 이어서 하기. *근데 여기서 뿌려주는게 맞는지, onMessage를 통해서
			// 뿌려주는게 맞는지 모르겠다. )
			// 1. 채팅방(content)에 접근 하기 위한 chatno 조회
			int chatno = service.getChattingNumber(chat);
			
			// 2. chatno를 통해 채팅방(content) 조회 후 리스트에 담기
			List<ChattingDTO> list = service.getChattingContent(chatno);
			
			// 3. 채팅 내역이 존재하는지 유무 확인
			if(list != null && !list.isEmpty()) {
				// 3-1. 채팅 내역이 존재한다면 출력되는지 로그를 찍어 확인
				for (ChattingDTO chattingDTO : list) {
					log.warn("채팅 내역 : " + chattingDTO.getContent());
				}
				
				// ObjectMapper를 사용하여 List를 JSON으로 변환
				ObjectMapper mapper = new ObjectMapper();
				try {
					String chatHistory = mapper.writeValueAsString(list);
					session.getBasicRemote().sendText(chatHistory);
				} catch (Exception e) {
					log.error("채팅 내역 전송 오류: " + e.getMessage());
				}
			}else {
				// 3-2. 채팅 내역이 존재하지 않을 때 출력 할 로그
				log.warn("채팅 내역이 존재하지 않습니다.");
//				ChattingDTO chatdto = new ChattingDTO();
//				chatdto.setChatno(chatno);
				
				try {
					session.getBasicRemote().sendText(String.valueOf(chatno));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		// 4. 채팅 방이 없을 시 ( sellmno, buymno, ubno를 통해 tbl_chat_room에 insert 하기 )
		} else if (chatRoomCheck == 0) {
			log.warn("채팅방 미존재" + chatRoomCheck);
			int createChatRoom = service.chatingRoomInsert(chat);
			log.warn("채팅 룸 생성 성공 유무 : " + createChatRoom);
		} else {
			log.warn("무야이건 채팅방은 2개일 수 없어.." + chatRoomCheck);
		}

	}

	@OnClose
	public void handleClose(Session session) {
		sessions.remove(session);
		System.out.println("클라이언트가 종료했습니다.");
	}

	@OnMessage
    public void handleMessage(String msgJson, Session session) {
        log.warn("넘어온 json 파일 : " + msgJson);

        ObjectMapper objectMapper = new ObjectMapper();
        MessageData messageData;

        try {
            messageData = objectMapper.readValue(msgJson, MessageData.class);
            log.warn("데이터 파싱 완료: " + messageData);
        } catch (Exception e) {
            log.error("데이터 파싱 오류: " + e.getMessage());
            try {
                session.getBasicRemote().sendText("(오류: 데이터 파싱 실패)");
            } catch (IOException ioException) {
                log.error("오류 메시지 전송 실패: " + ioException.getMessage());
            }
            return;
        }

        String msg = messageData.getMsg();
        int yourMsg = messageData.getSellmno();
        int myMsg = messageData.getBuymno();
        int ubno = messageData.getUbno();

        ChatRoomDTO chat = new ChatRoomDTO();
        chat.setSellmno(yourMsg);
        chat.setBuymno(myMsg);
        chat.setUbno(ubno);
        int chatno = service.getChattingNumber(chat);

        ChattingDTO chatting = new ChattingDTO();
        chatting.setChatno(chatno);
        chatting.setMno(myMsg);
        chatting.setContent(msg);

        int chattingCheck = service.insertChattingContent(chatting);
        log.warn("채팅 내용 저장 결과 : " + chattingCheck);

        long nowTime = System.currentTimeMillis();
        Date sqlDate = new Date(nowTime);
        String responseMessage = "[" + sqlDate + "] : " + msg;

        for (Session s : sessions) {
            try {
                s.getBasicRemote().sendText(responseMessage);
            } catch (IOException e) {
                log.error("브로드캐스트 메시지 전송 오류: " + e.getMessage());
            }
        }
    }


	@OnError
	public void handleError(Throwable e) {
		System.out.println("에러 발생 " + e.getMessage());
	}

}

//JSON 파싱을 위한 클래스
class MessageData {
 private String msg;
 private int sellmno;
 private int buymno;
 private int ubno;

 // Getters and Setters
 public String getMsg() { return msg; }
 public void setMsg(String msg) { this.msg = msg; }

 public int getSellmno() { return sellmno; }
 public void setSellmno(int sellmno) { this.sellmno = sellmno; }

 public int getBuymno() { return buymno; }
 public void setBuymno(int buymno) { this.buymno = buymno; }
 
 public int getUbno() { return ubno; }
 public void setUbno(int ubno) { this.ubno = ubno; }
}