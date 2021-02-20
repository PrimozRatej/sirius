package com.sirius.domain.repository.db;

import com.sirius.domain.model.db.ProductDetailsDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductDetailsRepository extends JpaRepository<ProductDetailsDTO, Integer> {

}