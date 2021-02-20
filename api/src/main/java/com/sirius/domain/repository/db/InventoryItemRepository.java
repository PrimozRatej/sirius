package com.sirius.domain.repository.db;

import com.sirius.domain.model.db.InventoryItemDTO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InventoryItemRepository extends JpaRepository<InventoryItemDTO, Integer> {
}