package com.siriusa.sirius.domain.repository;

import com.siriusa.sirius.domain.model.ProductDetailsDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductDetailsRepository extends JpaRepository<ProductDetailsDTO, Integer> {

}