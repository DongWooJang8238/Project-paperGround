package org.joonzis.security.domain;

import java.util.Collection;
import java.util.Collections;

import org.joonzis.domain.UserVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CustomUser extends User {

    private static final long serialVersionUID = 1L;
    
    private UserVO user;
    
    // 기존 생성자
    public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }
    
    // 변경된 UserVO를 사용하는 생성자
    public CustomUser(UserVO vo) {
        // userRole 필드를 사용하여 권한 생성
        super(vo.getUserId(), vo.getUserPw(),
              Collections.singletonList(new SimpleGrantedAuthority(vo.getUserRole())));
        
        this.user = vo;
    }
}
