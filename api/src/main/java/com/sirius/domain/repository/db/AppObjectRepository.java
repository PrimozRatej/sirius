package com.sirius.domain.repository.db;

import com.sirius.domain.model.db.AppObjectDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppObjectRepository extends JpaRepository<AppObjectDTO, Integer> {
}
