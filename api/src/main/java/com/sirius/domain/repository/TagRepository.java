package com.sirius.domain.repository;

import com.sirius.domain.model.db.TagDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TagRepository extends JpaRepository<TagDTO, Integer> {
}