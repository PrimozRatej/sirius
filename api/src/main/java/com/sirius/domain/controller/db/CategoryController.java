package com.sirius.domain.controller.db;

import com.sirius.domain.model.db.CategoryDTO;
import com.sirius.domain.repository.CategoryRepository;
import com.sirius.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class CategoryController {

    @Autowired
    CategoryRepository repository;

    // Get All Categories
    @GetMapping("/categories")
    public List<CategoryDTO> getAll() {
        return repository.findAll();
    }

    // Create a new Category
    @PostMapping("/categories")
    public CategoryDTO create(@Valid @RequestBody CategoryDTO entry) {
        return repository.save(entry);
    }

    // Get a Single Category
    @GetMapping("/categories/{id}")
    public CategoryDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Category", "id", id));
    }

    // Update a Category
    @PutMapping("/categories/{id}")
    public CategoryDTO update(@PathVariable(value = "id") Integer id,
                                            @Valid @RequestBody CategoryDTO entry) {

        CategoryDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Category", "id", id));
                                               
                obj = entry;

        CategoryDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a Category
    @DeleteMapping("/categories/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        CategoryDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Category", "id", id));

                repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}