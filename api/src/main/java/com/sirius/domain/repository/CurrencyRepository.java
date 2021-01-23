package com.sirius.domain.repository;
import com.sirius.domain.model.db.CurrencyDTO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CurrencyRepository extends JpaRepository<CurrencyDTO, String> {

}