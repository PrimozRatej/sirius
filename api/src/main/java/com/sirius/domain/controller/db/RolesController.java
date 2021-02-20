package com.sirius.domain.controller.db;
import com.sirius.domain.model.db.RolesDTO;
import com.sirius.domain.repository.db.RolesRepository;
import com.sirius.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class RolesController {

    @Autowired
    RolesRepository repository;

    // Get All Roles
    @GetMapping("/roles")
    public List<RolesDTO> getAll() {
        return repository.findAll();
    }

    // Create a new Role
    @PostMapping("/roles")
    public RolesDTO create(@Valid @RequestBody RolesDTO entry) {
        return repository.save(entry);
    }

    // Get a Single Role
    @GetMapping("/roles/{id}")
    public RolesDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Roles", "id", id));
    }

    // Update a Role
    @PutMapping("/roles/{id}")
    public RolesDTO update(@PathVariable(value = "id") Integer id,
                             @Valid @RequestBody RolesDTO entry) {

        RolesDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Roles", "id", id));

        obj = entry;

        RolesDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a Role
    @DeleteMapping("/roles/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        RolesDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Roles", "id", id));

        repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}