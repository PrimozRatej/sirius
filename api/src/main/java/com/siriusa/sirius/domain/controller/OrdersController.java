package com.siriusa.sirius.domain.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;

import com.siriusa.sirius.domain.model.OrdersDTO;
import com.siriusa.sirius.domain.repository.OrdersRepository;
import com.siriusa.sirius.exception.ResourceNotFoundException;
import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class OrdersController {

    @Autowired
    OrdersRepository repository;

    // Get All Orders
    @GetMapping("/orders")
    public List<OrdersDTO> getAll() {
        return repository.findAll();
    }

    // Create a new Order
    @PostMapping("/orders")
    public OrdersDTO create(@Valid @RequestBody final OrdersDTO entry) {
        return repository.save(entry);
    }

    // Get a Single Order
    @GetMapping("/orders/{id}")
    public OrdersDTO getById(@PathVariable(value = "id") final Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order", "id", id));
    }

    // Update a Order
    @PutMapping("/orders/{id}")
    public OrdersDTO update(@PathVariable(value = "id") final Integer id,
                                            @Valid @RequestBody final OrdersDTO entry) {

        OrdersDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order", "id", id));
                                               
                obj = entry;

        final OrdersDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a Order
    @DeleteMapping("/orders/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") final Integer id) {
        final OrdersDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order", "id", id));

                repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}