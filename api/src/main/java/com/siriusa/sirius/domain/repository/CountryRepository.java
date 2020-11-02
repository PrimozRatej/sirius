package com.siriusa.sirius.domain.repository;
import com.siriusa.sirius.domain.model.CountryDTO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CountryRepository extends JpaRepository<CountryDTO, String> {

}