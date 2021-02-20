package com.sirius.domain.controller.db;
import com.sirius.domain.model.db.RolesDTO;
import com.sirius.domain.model.db.UserRolesDTO;
import com.sirius.domain.model.ware.prod.ProdFilterDTO;
import com.sirius.domain.repository.db.RolesRepository;
import com.sirius.domain.repository.db.UserRolesRepository;
import com.sirius.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/domain")
public class UserRolesController {

    @Autowired
    UserRolesRepository repository;

    // Get All User roles
    @GetMapping("/user_roles")
    public List<UserRolesDTO> getAll() {
        return repository.findAll();
    }

    // Create a new User role
    @PostMapping("/user_roles")
    public UserRolesDTO create(@Valid @RequestBody UserRolesDTO entry) {
        return repository.save(entry);
    }

    // Get a Single User role
    @GetMapping("/user_roles/{id}")
    public UserRolesDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User roles", "id", id));
    }

    // Update a User role
    @PutMapping("/user_roles/{id}")
    public UserRolesDTO update(@PathVariable(value = "id") Integer id,
                           @Valid @RequestBody UserRolesDTO entry) {

        UserRolesDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User roles", "id", id));

        obj = entry;

        UserRolesDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a User role
    @DeleteMapping("/user_roles/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        UserRolesDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User roles", "id", id));

        repository.delete(obj);

        return ResponseEntity.ok().build();
    }

    // Get a Single User role
    @GetMapping("/user_roles/user")
    public List<UserRolesDTO> getByUserId(@RequestParam(required = true) Integer user_id) {
        List<UserRolesDTO> list = new ArrayList<>();
        Predicate<UserRolesDTO> searchF = prod -> prod.getUser_id() == user_id;
        list = list.stream().filter(searchF)
                .collect(Collectors.toList());
        return list;
    }
}