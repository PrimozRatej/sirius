package com.siriusa.sirius.domain.repository;

import com.siriusa.sirius.domain.model.CartItemDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartItemRepository extends JpaRepository<CartItemDTO, Integer> {
}