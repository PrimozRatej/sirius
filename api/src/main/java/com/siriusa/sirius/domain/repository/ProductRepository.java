package com.siriusa.sirius.domain.repository;

import com.siriusa.sirius.domain.model.ProductDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<ProductDTO, Integer> {

}