package com.siriusa.sirius.domain.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import com.siriusa.sirius.domain.model.ProductDTO;
import com.siriusa.sirius.domain.repository.ProductRepository;
import com.siriusa.sirius.exception.ResourceNotFoundException;
import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class ProductController {

    @Autowired
    ProductRepository repository;

    // Get All Products
    @GetMapping("/product")
    public List<ProductDTO> getAll() {
        return repository.findAll();
    }

    // Create a new Product
    @PostMapping("/product")
    public ProductDTO create(@Valid @RequestBody ProductDTO entry) {
        return repository.save(entry);
    }

    // Get a Single Product
    @GetMapping("/product/{id}")
    public ProductDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product", "id", id));
    }

    // Update a Product
    @PutMapping("/product/{id}")
    public ProductDTO update(@PathVariable(value = "id") Integer id,
                                            @Valid @RequestBody ProductDTO entry) {

        ProductDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product", "id", id));
                                               
                obj = entry;

        ProductDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a Product
    @DeleteMapping("/product/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        ProductDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product", "id", id));

                repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}