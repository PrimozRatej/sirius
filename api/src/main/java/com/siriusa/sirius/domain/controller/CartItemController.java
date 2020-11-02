package com.siriusa.sirius.domain.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;

import com.siriusa.sirius.domain.model.CartItemDTO;
import com.siriusa.sirius.domain.repository.CartItemRepository;
import com.siriusa.sirius.exception.ResourceNotFoundException;
import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class CartItemController {

    @Autowired
    CartItemRepository repository;

    // Get All Categories
    @GetMapping("/cart_item")
    public List<CartItemDTO> getAll() {
        return repository.findAll();
    }

    // Create a new Cart item
    @PostMapping("/cart_item")
    public CartItemDTO create(@Valid @RequestBody CartItemDTO entry) {
        return repository.save(entry);
    }

    // Get a Single Cart item
    @GetMapping("/cart_item/{id}")
    public CartItemDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Cart item", "id", id));
    }

    // Update a Cart item
    @PutMapping("/cart_item/{id}")
    public CartItemDTO update(@PathVariable(value = "id") Integer id,
                                            @Valid @RequestBody CartItemDTO entry) {

        CartItemDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Cart item", "id", id));
                                               
                obj = entry;

        CartItemDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a Cart item
    @DeleteMapping("/cart_item/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        CartItemDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Cart item", "id", id));

                repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}