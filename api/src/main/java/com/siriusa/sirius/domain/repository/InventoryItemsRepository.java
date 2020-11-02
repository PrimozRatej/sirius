package com.siriusa.sirius.domain.repository;

import com.siriusa.sirius.domain.model.DiscountDTO;
import com.siriusa.sirius.domain.model.InventoryItemsDTO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InventoryItemsRepository extends JpaRepository<InventoryItemsDTO, Integer> {
}