package com.sirius.domain.repository.db;

import com.sirius.domain.model.db.AppFilterDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppFilterRepository extends JpaRepository<AppFilterDTO, Integer> {
}