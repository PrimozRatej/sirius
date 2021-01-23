package com.sirius.domain.repository;

import com.sirius.domain.model.db.OrderStatusDTO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderStatusRepository extends JpaRepository<OrderStatusDTO, Integer> {
}