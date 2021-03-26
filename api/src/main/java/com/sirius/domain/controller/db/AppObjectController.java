package com.sirius.domain.controller.db;

import com.sirius.domain.model.db.AppFilterDTO;
import com.sirius.domain.model.db.AppObjectDTO;
import com.sirius.domain.repository.db.AppFilterRepository;
import com.sirius.domain.repository.db.AppObjectRepository;
import com.sirius.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class AppObjectController {

    public AppObjectController(AppObjectRepository repository){
        this.repository = repository;
    }

    @Autowired
    AppObjectRepository repository;

    // Get All App objects
    @GetMapping("/app_object")
    public List<AppObjectDTO> getAll() {
        return repository.findAll();
    }

    // Create a new App filter
    @PostMapping("/app_object")
    public AppObjectDTO create(@Valid @RequestBody AppObjectDTO entry) {
        return repository.save(entry);
    }

    // Get a Single App filter
    @GetMapping("/app_object/{id}")
    public AppObjectDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("App object", "id", id));
    }

    // Update a App filter
    @PutMapping("/app_object/{id}")
    public AppObjectDTO update(@PathVariable(value = "id") Integer id,
                               @Valid @RequestBody AppObjectDTO entry) {

        AppObjectDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("App object", "id", id));

        obj = entry;

        AppObjectDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a App filter
    @DeleteMapping("/app_object/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        AppObjectDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("App object", "id", id));

        repository.delete(obj);

        return ResponseEntity.ok().build();
    }

}
