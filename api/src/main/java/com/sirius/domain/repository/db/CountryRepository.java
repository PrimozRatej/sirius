package com.sirius.domain.repository.db;
import com.sirius.domain.model.db.CountryDTO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CountryRepository extends JpaRepository<CountryDTO, String> {

}