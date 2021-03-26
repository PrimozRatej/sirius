package com.sirius.domain.controller.db;

import com.sirius.domain.model.db.AppDTO;
import com.sirius.domain.model.db.AppFilterDTO;
import com.sirius.domain.repository.db.AppFilterRepository;
import com.sirius.domain.repository.db.AppRepository;
import com.sirius.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class AppController {

    @Autowired
    AppRepository repository;

    // Get All App
    @GetMapping("/app")
    public List<AppDTO> getAll() {
        return repository.findAll();
    }

    // Create a new App
    @PostMapping("/app")
    public AppDTO create(@Valid @RequestBody AppDTO entry) {
        return repository.save(entry);
    }

    // Get a Single App
    @GetMapping("/app/{id}")
    public AppDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("App", "id", id));
    }

    // Update a App filter
    @PutMapping("/app/{id}")
    public AppDTO update(@PathVariable(value = "id") Integer id,
                               @Valid @RequestBody AppDTO entry) {

        AppDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("App", "id", id));

        obj = entry;

        AppDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a App filter
    @DeleteMapping("/app/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        AppDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("App", "id", id));

        repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}
