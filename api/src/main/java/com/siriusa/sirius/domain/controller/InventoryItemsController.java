package com.siriusa.sirius.domain.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;

import com.siriusa.sirius.domain.model.InventoryItemsDTO;
import com.siriusa.sirius.domain.repository.InventoryItemsRepository;
import com.siriusa.sirius.exception.ResourceNotFoundException;
import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class InventoryItemsController {

    @Autowired
    InventoryItemsRepository repository;

    // Get All Discounts
    @GetMapping("/inventoryItems")
    public List<InventoryItemsDTO> getAll() {
        return repository.findAll();
    }

    // Create a new InventoryItems
    @PostMapping("/inventoryItems")
    public InventoryItemsDTO create(@Valid @RequestBody InventoryItemsDTO entry) {
        return repository.save(entry);
    }

    // Get a Single InventoryItems
    @GetMapping("/inventoryItems/{id}")
    public InventoryItemsDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Inventory items", "id", id));
    }

    // Update a InventoryItems
    @PutMapping("/inventoryItems/{id}")
    public InventoryItemsDTO update(@PathVariable(value = "id") Integer id,
                                            @Valid @RequestBody InventoryItemsDTO entry) {

        InventoryItemsDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Inventory items", "id", id));
                                               
                obj = entry;

        InventoryItemsDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a InventoryItems
    @DeleteMapping("/inventoryItems/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        InventoryItemsDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Inventory items", "id", id));

                repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}