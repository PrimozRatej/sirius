package com.siriusa.sirius.domain.repository;

import com.siriusa.sirius.domain.model.OrdersDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrdersRepository extends JpaRepository<OrdersDTO, Integer> {
}