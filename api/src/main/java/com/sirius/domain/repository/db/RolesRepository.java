package com.sirius.domain.repository.db;
import com.sirius.domain.model.db.RolesDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RolesRepository extends JpaRepository<RolesDTO, Integer> {
}