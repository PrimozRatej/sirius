package com.sirius.domain.controller.db;

import com.sirius.domain.model.db.CurrencyDTO;
import com.sirius.domain.repository.CurrencyRepository;
import com.sirius.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class CurrencyController {

    @Autowired
    CurrencyRepository repository;

    // Get All Categories
    @GetMapping("/currency")
    public List<CurrencyDTO> getAll() {
        return repository.findAll();
    }

    // Create a new Currency
    @PostMapping("/currency")
    public CurrencyDTO create(@Valid @RequestBody CurrencyDTO entry) {
        return repository.save(entry);
    }

    // Get a Single Currency
    @GetMapping("/currency/{id}")
    public CurrencyDTO getById(@PathVariable(value = "id") String id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Currency", "id", id));
    }

    // Update a Currency
    @PutMapping("/currency/{id}")
    public CurrencyDTO update(@PathVariable(value = "id") String id,
                                            @Valid @RequestBody CurrencyDTO entry) {

        CurrencyDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Currency", "id", id));
                                               
                obj = entry;

        CurrencyDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a Currency
    @DeleteMapping("/currency/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") String id) {
        CurrencyDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Currency", "id", id));

                repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}