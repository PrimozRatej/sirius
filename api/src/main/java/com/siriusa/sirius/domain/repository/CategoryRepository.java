package com.siriusa.sirius.domain.repository;

import com.siriusa.sirius.domain.model.CategoryDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<CategoryDTO, Integer> {
}