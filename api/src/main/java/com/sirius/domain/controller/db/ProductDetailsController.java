package com.sirius.domain.controller.db;

import com.sirius.domain.model.db.ProductDetailsDTO;
import com.sirius.domain.repository.ProductDetailsRepository;
import com.sirius.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class ProductDetailsController {

    @Autowired
    ProductDetailsRepository repository;

    // Get All Products
    @GetMapping("/product_details")
    public List<ProductDetailsDTO> getAll() {
        return repository.findAll();
    }

    // Create a new Product details
    @PostMapping("/product_details")
    public ProductDetailsDTO create(@Valid @RequestBody ProductDetailsDTO entry) {
        return repository.save(entry);
    }

    // Get a Single Product details
    @GetMapping("/product_details/{id}")
    public ProductDetailsDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product details", "id", id));
    }

    // Update a Product details
    @PutMapping("/product_details/{id}")
    public ProductDetailsDTO update(@PathVariable(value = "id") Integer id,
                                            @Valid @RequestBody ProductDetailsDTO entry) {

        ProductDetailsDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product details", "id", id));
                                               
                obj = entry;

        ProductDetailsDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a Product details
    @DeleteMapping("/product_details/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        ProductDetailsDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product details details", "id", id));

                repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}