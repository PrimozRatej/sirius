package com.siriusa.sirius.domain.repository;

import com.siriusa.sirius.domain.model.DiscountDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DiscountRepository extends JpaRepository<DiscountDTO, Integer> {
}