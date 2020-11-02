package com.siriusa.sirius.domain.repository;

import com.siriusa.sirius.domain.model.OrderItemDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItemDTO, Integer> {
}