package com.sirius.domain.controller.db;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;

import com.sirius.domain.model.db.OrderStatusDTO;
import com.sirius.domain.repository.db.OrderStatusRepository;
import com.sirius.exception.ResourceNotFoundException;
import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class OrderStatusController {

    @Autowired
    OrderStatusRepository repository;

    // Get All Order status
    @GetMapping("/order_status")
    public List<OrderStatusDTO> getAll() {
        return repository.findAll();
    }

    // Create a new Order status
    @PostMapping("/order_status")
    public OrderStatusDTO create(@Valid @RequestBody OrderStatusDTO entry) {
        return repository.save(entry);
    }

    // Get a Single Order status
    @GetMapping("/order_status/{id}")
    public OrderStatusDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order status", "id", id));
    }

    // Update a Order status
    @PutMapping("/order_status/{id}")
    public OrderStatusDTO update(@PathVariable(value = "id") Integer id,
                                            @Valid @RequestBody OrderStatusDTO entry) {

        OrderStatusDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order status", "id", id));
                                               
                obj = entry;

        OrderStatusDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a Order status
    @DeleteMapping("/order_status/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        OrderStatusDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order status", "id", id));

                repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}