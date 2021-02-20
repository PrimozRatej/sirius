package com.sirius.domain.controller.db;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;

import com.sirius.domain.model.db.InventoryItemDTO;
import com.sirius.domain.repository.db.InventoryItemRepository;
import com.sirius.exception.ResourceNotFoundException;
import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class InventoryItemController {

    @Autowired
    InventoryItemRepository repository;

    // Get All Discounts
    @GetMapping("/inventoryItem")
    public List<InventoryItemDTO> getAll() {
        return repository.findAll();
    }

    // Create a new inventoryItem
    @PostMapping("/inventoryItem")
    public InventoryItemDTO create(@Valid @RequestBody InventoryItemDTO entry) {
        return repository.save(entry);
    }

    // Get a Single inventoryItem
    @GetMapping("/inventoryItem/{id}")
    public InventoryItemDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Inventory items", "id", id));
    }

    // Update a inventoryItem
    @PutMapping("/inventoryItem/{id}")
    public InventoryItemDTO update(@PathVariable(value = "id") Integer id,
                                   @Valid @RequestBody InventoryItemDTO entry) {

        InventoryItemDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Inventory items", "id", id));
                                               
                obj = entry;

        InventoryItemDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a inventoryItem
    @DeleteMapping("/inventoryItem/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        InventoryItemDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Inventory items", "id", id));

                repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}