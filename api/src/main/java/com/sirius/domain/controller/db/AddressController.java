package com.sirius.domain.controller.db;

import com.sirius.domain.model.db.AddressDTO;
import com.sirius.domain.repository.AddressRepository;
import com.sirius.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class AddressController {

    @Autowired
    AddressRepository repository;

    // Get All Addresses
    @GetMapping("/address")
    public List<AddressDTO> getAll() {
        return repository.findAll();
    }

    // Create a new Address
    @PostMapping("/address")
    public AddressDTO create(@Valid @RequestBody AddressDTO entry) {
        return repository.save(entry);
    }

    // Get a Single Address
    @GetMapping("/address/{id}")
    public AddressDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Address", "id", id));
    }

    // Update a Address
    @PutMapping("/address/{id}")
    public AddressDTO update(@PathVariable(value = "id") Integer id,
                                            @Valid @RequestBody AddressDTO entry) {

        AddressDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Address", "id", id));
                                               
                obj = entry;

        AddressDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a Address
    @DeleteMapping("/address/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        AddressDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Address", "id", id));

                repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}