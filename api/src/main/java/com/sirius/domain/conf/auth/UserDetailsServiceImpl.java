package com.sirius.domain.conf.auth;

import com.sirius.domain.model.db.UserDTO;
import com.sirius.domain.repository.db.UserRepository;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    private UserRepository userRepository;

    public UserDetailsServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserDTO applicationUser = userRepository.findByUsername(username);
        if (applicationUser == null) {
            throw new UsernameNotFoundException(username);
        }
        List<GrantedAuthority> grands = new ArrayList<>();
        GrantedAuthority auth1 = new GrantedAuthority() {
            @Override
            public String getAuthority() {
                return "GRAND_01";
            }
        };
        GrantedAuthority auth2 = new GrantedAuthority() {
            @Override
            public String getAuthority() {
                return "GRAND_02";
            }
        };

        GrantedAuthority auth3 = new GrantedAuthority() {
            @Override
            public String getAuthority() {
                return "GRAND_03";
            }
        };
        grands.add(auth1);
        grands.add(auth2);
        grands.add(auth3);
        User user = new User(applicationUser.getUsername(), applicationUser.getPasswordHash(), grands);
        return user;
    }
}