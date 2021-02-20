package com.sirius.domain.repository.db;

import com.sirius.domain.model.db.CartItemDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartItemRepository extends JpaRepository<CartItemDTO, Integer> {
}