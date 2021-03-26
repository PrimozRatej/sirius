package com.sirius.domain.repository.db;

import com.sirius.domain.model.db.AppDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppRepository extends JpaRepository<AppDTO, Integer> {
}