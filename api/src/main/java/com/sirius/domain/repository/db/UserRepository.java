package com.sirius.domain.repository.db;

import com.sirius.domain.model.db.UserDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserDTO, Integer> {

    UserDTO findByUsername(String username);
}