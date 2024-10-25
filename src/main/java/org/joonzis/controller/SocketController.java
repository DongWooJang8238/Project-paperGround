package org.joonzis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class SocketController {
	
	@GetMapping(value = "/test.do")
	public String test(Model model) {
		log.warn("채팅 컨트롤러..");
		return "test";
	}
}