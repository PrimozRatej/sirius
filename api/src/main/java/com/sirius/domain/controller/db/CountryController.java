package com.sirius.domain.controller.db;

import com.sirius.domain.model.db.CountryDTO;
import com.sirius.domain.repository.db.CountryRepository;
import com.sirius.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class CountryController {

    @Autowired
    CountryRepository repository;

    // Get All Categories
    @GetMapping("/country")
    public List<CountryDTO> getAll() {
        return repository.findAll();
    }

    // Create a new Country
    @PostMapping("/country")
    public CountryDTO create(@Valid @RequestBody CountryDTO entry) {
        return repository.save(entry);
    }

    // Get a Single Country
    @GetMapping("/country/{id}")
    public CountryDTO getById(@PathVariable(value = "id") String id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Country", "id", id));
    }

    // Update a Country
    @PutMapping("/country/{id}")
    public CountryDTO update(@PathVariable(value = "id") String id,
                                            @Valid @RequestBody CountryDTO entry) {

        CountryDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Country", "id", id));
                                               
                obj = entry;

        CountryDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a Country
    @DeleteMapping("/country/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") String id) {
        CountryDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Country", "id", id));

                repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}