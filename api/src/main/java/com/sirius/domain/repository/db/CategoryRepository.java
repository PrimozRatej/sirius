package com.sirius.domain.repository.db;

import com.sirius.domain.model.db.CategoryDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<CategoryDTO, Integer> {
}