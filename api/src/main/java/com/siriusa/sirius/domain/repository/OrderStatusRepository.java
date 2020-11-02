package com.siriusa.sirius.domain.repository;

import com.siriusa.sirius.domain.model.OrderItemDTO;
import com.siriusa.sirius.domain.model.OrderStatusDTO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderStatusRepository extends JpaRepository<OrderStatusDTO, Integer> {
}