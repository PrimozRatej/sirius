package com.sirius.domain.controller.db;

import com.sirius.domain.model.db.AppFilterDTO;
import com.sirius.domain.model.db.AppObjectDTO;
import com.sirius.domain.model.db.AppTemplateDTO;
import com.sirius.domain.repository.db.AppFilterRepository;
import com.sirius.domain.repository.db.AppObjectRepository;
import com.sirius.domain.repository.db.AppTemplateRepository;
import com.sirius.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class AppTemplateController {

    public AppTemplateController(AppTemplateRepository repository){
        this.repository = repository;
    }

    @Autowired
    AppTemplateRepository repository;

    // Get All App templates
    @GetMapping("/app_template")
    public List<AppTemplateDTO> getAll() {
        return repository.findAll();
    }

    // Create a new App template
    @PostMapping("/app_template")
    public AppTemplateDTO create(@Valid @RequestBody AppTemplateDTO entry) {
        return repository.save(entry);
    }

    // Get a single App template
    @GetMapping("/app_template/{id}")
    public AppTemplateDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("App object", "id", id));
    }

    // Update a App template
    @PutMapping("/app_template/{id}")
    public AppTemplateDTO update(@PathVariable(value = "id") Integer id,
                               @Valid @RequestBody AppTemplateDTO entry) {

        AppTemplateDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("App object", "id", id));

        obj = entry;

        AppTemplateDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a App template
    @DeleteMapping("/app_template/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        AppTemplateDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("App object", "id", id));

        repository.delete(obj);

        return ResponseEntity.ok().build();
    }

}
