package com.sirius.domain.controller.db;

import com.sirius.domain.model.db.UserDTO;
import com.sirius.domain.repository.UserRepository;
import com.sirius.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class UserController {

    @Autowired
    UserRepository repository;

    // Get All Users
    @GetMapping("/user")
    public List<UserDTO> getAll() {
        return repository.findAll();
    }

    // Create a new User
    @PostMapping("/user")
    public UserDTO create(@Valid @RequestBody UserDTO entry) {
        return repository.save(entry);
    }

    // Get a Single User
    @GetMapping("/user/{id}")
    public UserDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User", "id", id));
    }

    // Update a User
    @PutMapping("/user/{id}")
    public UserDTO update(@PathVariable(value = "id") Integer id,
                                            @Valid @RequestBody UserDTO entry) {

        UserDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User", "id", id));
                                               
                obj = entry;

        UserDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a User
    @DeleteMapping("/user/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        UserDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User", "id", id));

                repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}