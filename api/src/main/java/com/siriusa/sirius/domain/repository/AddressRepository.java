package com.siriusa.sirius.domain.repository;

import com.siriusa.sirius.domain.model.AddressDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AddressRepository extends JpaRepository<AddressDTO, Integer> {
}