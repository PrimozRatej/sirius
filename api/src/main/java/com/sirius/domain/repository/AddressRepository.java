package com.sirius.domain.repository;

import com.sirius.domain.model.db.AddressDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AddressRepository extends JpaRepository<AddressDTO, Integer> {
}