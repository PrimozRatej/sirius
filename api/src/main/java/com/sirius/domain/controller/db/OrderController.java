package com.sirius.domain.controller.db;

import com.sirius.domain.model.db.OrderDTO;
import com.sirius.domain.repository.db.OrderRepository;
import com.sirius.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class OrderController {

    @Autowired
    OrderRepository repository;

    // Get All Order
    @GetMapping("/order")
    public List<OrderDTO> getAll() {
        return repository.findAll();
    }

    // Create a new Order
    @PostMapping("/order")
    public OrderDTO create(@Valid @RequestBody final OrderDTO entry) {
        return repository.save(entry);
    }

    // Get a Single Order
    @GetMapping("/order/{id}")
    public OrderDTO getById(@PathVariable(value = "id") final Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order", "id", id));
    }

    // Update a Order
    @PutMapping("/order/{id}")
    public OrderDTO update(@PathVariable(value = "id") final Integer id,
                           @Valid @RequestBody final OrderDTO entry) {

        OrderDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order", "id", id));
                                               
                obj = entry;

        final OrderDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a Order
    @DeleteMapping("/order/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") final Integer id) {
        final OrderDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order", "id", id));

                repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}