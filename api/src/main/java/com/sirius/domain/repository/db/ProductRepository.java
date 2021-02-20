package com.sirius.domain.repository.db;

import com.sirius.domain.model.db.ProductDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<ProductDTO, Integer> {

}