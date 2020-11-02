package com.siriusa.sirius.domain.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;

import com.siriusa.sirius.domain.model.TagDTO;
import com.siriusa.sirius.domain.repository.TagRepository;
import com.siriusa.sirius.exception.ResourceNotFoundException;
import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class TagController {

    @Autowired
    TagRepository repository;

    // Get All Tags
    @GetMapping("/tag")
    public List<TagDTO> getAll() {
        return repository.findAll();
    }

    // Create a new Tag
    @PostMapping("/tag")
    public TagDTO create(@Valid @RequestBody TagDTO entry) {
        return repository.save(entry);
    }

    // Get a Single Tag
    @GetMapping("/tag/{id}")
    public TagDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Tag", "id", id));
    }

    // Update a Tag
    @PutMapping("/tag/{id}")
    public TagDTO update(@PathVariable(value = "id") Integer id,
                                            @Valid @RequestBody TagDTO entry) {

        TagDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Tag", "id", id));
                                               
                obj = entry;

        TagDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a Tag
    @DeleteMapping("/tag/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        TagDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Tag", "id", id));

                repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}