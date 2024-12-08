package org.joonzis.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {

        String redirectUrl = request.getParameter("urlPage");
        log.warn("Login Success" + redirectUrl);
        
        if(redirectUrl.equals("http://localhost:9090/User/login") || 
        		redirectUrl.equals("http://localhost:9090/User/signup") || 
        		redirectUrl.equals("http://localhost:9090/User/findId") || 
        		redirectUrl.equals("http://localhost:9090/User/findPw")) {
        	redirectUrl = "http://localhost:9090/";
        }
        

        List<String> roleNames = new ArrayList<>();

        authentication.getAuthorities().forEach(auth -> {
            roleNames.add(auth.getAuthority());
        });
        
        log.warn("ROLE NAMES : " + roleNames);
        
        if (roleNames.contains("ADMIN_ROLE")) {
            response.sendRedirect(redirectUrl);
            return;
        }
        
        response.sendRedirect(redirectUrl);
    }
}
