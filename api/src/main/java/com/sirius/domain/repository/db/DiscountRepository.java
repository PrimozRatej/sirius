package com.sirius.domain.repository.db;

import com.sirius.domain.model.db.DiscountDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DiscountRepository extends JpaRepository<DiscountDTO, Integer> {
}