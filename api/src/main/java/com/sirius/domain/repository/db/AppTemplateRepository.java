package com.sirius.domain.repository.db;

import com.sirius.domain.model.db.AppTemplateDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppTemplateRepository extends JpaRepository<AppTemplateDTO, Integer> {
}
