package com.sirius.domain.controller.db;

import com.sirius.domain.model.db.DiscountDTO;
import com.sirius.domain.repository.db.DiscountRepository;
import com.sirius.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class DiscountController {

    @Autowired
    DiscountRepository repository;

    // Get All Discounts
    @GetMapping("/discount")
    public List<DiscountDTO> getAll() {
        return repository.findAll();
    }

    // Create a new Discount
    @PostMapping("/discount")
    public DiscountDTO create(@Valid @RequestBody DiscountDTO entry) {
        return repository.save(entry);
    }

    // Get a Single Discount
    @GetMapping("/discount/{id}")
    public DiscountDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Discount", "id", id));
    }

    // Update a Discount
    @PutMapping("/discount/{id}")
    public DiscountDTO update(@PathVariable(value = "id") Integer id,
                                            @Valid @RequestBody DiscountDTO entry) {

        DiscountDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Discount", "id", id));
                                               
                obj = entry;

        DiscountDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a Discount
    @DeleteMapping("/discount/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        DiscountDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Discount", "id", id));

                repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}