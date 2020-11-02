package com.siriusa.sirius.domain.repository;
import com.siriusa.sirius.domain.model.CurrencyDTO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CurrencyRepository extends JpaRepository<CurrencyDTO, String> {

}