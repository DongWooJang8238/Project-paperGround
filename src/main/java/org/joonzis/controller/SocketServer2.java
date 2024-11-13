package org.joonzis.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.joonzis.domain.ChattingDTO;
import org.joonzis.service.UsedShopService;
import org.springframework.context.ApplicationContext;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@ServerEndpoint("/sellserver.do")
public class SocketServer2 {

    private UsedShopService service;

    public SocketServer2() {
        ApplicationContext context = ApplicationContextProvider.getApplicationContext();
        this.service = context.getBean(UsedShopService.class);
    }

    @OnOpen
    public void handelOpen(Session session) {
        log.warn("채팅방 오픈 췍췤췤췤");
        
//        int chatno = Integer.parseInt(session.getRequestParameterMap().get("chatno").get(0));
//        System.out.println("클라이언트가 접속했습니다. chatno: " + chatno);
//
//        // 채팅 내역을 조회하고 전송
//        List<ChattingDTO> list = service.getChattingContent(chatno);
//        
//        if (list != null && !list.isEmpty()) {
//            ObjectMapper mapper = new ObjectMapper();
//            try {
//                String chatHistory = mapper.writeValueAsString(list);
//                session.getBasicRemote().sendText(chatHistory);
//            } catch (Exception e) {
//                log.error("채팅 내역 전송 오류: " + e.getMessage());
//            }
//        } else {
//            log.warn("채팅 내역이 존재하지 않습니다.");
//            try {
//                session.getBasicRemote().sendText(String.valueOf(chatno));
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
    }

    @OnClose
    public void handleClose(Session session) {
        log.warn("세션 종료됨: " + session.getId());
    }

    @OnMessage
    public void handleMessage(String msgJson, Session session) {
        log.warn("넘어온 json 파일 : " + msgJson);
        
        ObjectMapper objectMapper = new ObjectMapper();
        MessageData2 messageData = null;

        try {
            messageData = objectMapper.readValue(msgJson, MessageData2.class);
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
        int chatno = messageData.getChatno();
        int mno = messageData.getMno();
        log.warn("클라이언트가 보낸 메시지 : " + msg);
        log.warn("클라이언트 상대방 번호 : " + chatno);
        log.warn("클라이언트 내 번호 : " + mno);

        ChattingDTO chatting = new ChattingDTO();
        chatting.setChatno(chatno);
        chatting.setMno(mno);
        chatting.setContent(msg);

        int chattingCheck = service.insertChattingContent(chatting);
        log.warn("채팅 내용 저장 결과 : " + chattingCheck);

        long nowTime = System.currentTimeMillis();
        Date sqlDate = new Date(nowTime);
        String responseMessage = "[" + sqlDate + "] : " + msg;

    }

    @OnError
    public void handleError(Throwable e) {
        log.error("에러 발생 " + e.getMessage());
    }
}

// JSON 파싱을 위한 클래스
class MessageData2 {
    private String msg;
    private int chatno;
    private int mno;

    // Getters and Setters
    public String getMsg() { return msg; }
    public void setMsg(String msg) { this.msg = msg; }

    public int getChatno() { return chatno; }
    public void setChatno(int chatno) { this.chatno = chatno; }

    public int getMno() { return mno; }
    public void setMno(int mno) { this.mno = mno; }
}
