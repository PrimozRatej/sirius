package com.sirius.domain.repository;

import com.sirius.domain.model.db.OrderItemDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItemDTO, Integer> {
}