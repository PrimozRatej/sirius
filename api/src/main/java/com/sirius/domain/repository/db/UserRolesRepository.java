package com.sirius.domain.repository.db;

import com.sirius.domain.model.db.RolesDTO;
import com.sirius.domain.model.db.UserRolesDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRolesRepository extends JpaRepository<UserRolesDTO, Integer> {
}
