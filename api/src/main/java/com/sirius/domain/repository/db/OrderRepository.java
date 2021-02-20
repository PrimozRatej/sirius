package com.sirius.domain.repository.db;

import com.sirius.domain.model.db.OrderDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<OrderDTO, Integer> {
}