package com.sirius.domain.controller.db;

import com.sirius.domain.model.db.AddressDTO;
import com.sirius.domain.model.db.AppFilterDTO;
import com.sirius.domain.repository.db.AddressRepository;
import com.sirius.domain.repository.db.AppFilterRepository;
import com.sirius.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class AppFilterController {

    public AppFilterController(AppFilterRepository repository){
        this.repository = repository;
    }

    @Autowired
    AppFilterRepository repository;

    // Get All App filters
    @GetMapping("/app_filter")
    public List<AppFilterDTO> getAll() {
        return repository.findAll();
    }

    // Create a new App filter
    @PostMapping("/app_filter")
    public AppFilterDTO create(@Valid @RequestBody AppFilterDTO entry) {
        return repository.save(entry);
    }

    // Get a Single App filter
    @GetMapping("/app_filter/{id}")
    public AppFilterDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("App filter", "id", id));
    }

    // Update a App filter
    @PutMapping("/app_filter/{id}")
    public AppFilterDTO update(@PathVariable(value = "id") Integer id,
                             @Valid @RequestBody AppFilterDTO entry) {

        AppFilterDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("App filter", "id", id));

        obj = entry;

        AppFilterDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a App filter
    @DeleteMapping("/app_filter/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        AppFilterDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("App filter", "id", id));

        repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}