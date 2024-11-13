package org.joonzis.security;

import org.joonzis.domain.UserVO;
import org.joonzis.mapper.UserMapper;
import org.joonzis.security.domain.CustomUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailService implements UserDetailsService {

    @Autowired
    private UserMapper mapper;
    
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        
        log.warn("유저 네임 불러오기.. : " + username);
        
        UserVO vo = mapper.selectUserId(username);
        
        log.warn("멤버 매퍼.. : " + vo);
        
        // UserVO가 null이면 UsernameNotFoundException을 발생시킴
        if (vo == null) {
            throw new UsernameNotFoundException("유저를 찾을 수 없습니다: " + username);
        }
        
        return new CustomUser(vo);
    }
}
