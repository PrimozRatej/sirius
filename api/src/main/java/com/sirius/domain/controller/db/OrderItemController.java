package com.sirius.domain.controller.db;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;

import com.sirius.domain.model.db.OrderItemDTO;
import com.sirius.domain.repository.db.OrderItemRepository;
import com.sirius.exception.ResourceNotFoundException;
import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class OrderItemController {

    @Autowired
    OrderItemRepository repository;

    // Get All Order items
    @GetMapping("/order_item")
    public List<OrderItemDTO> getAll() {
        return repository.findAll();
    }

    // Create a new Order item
    @PostMapping("/order_item")
    public OrderItemDTO create(@Valid @RequestBody OrderItemDTO entry) {
        return repository.save(entry);
    }

    // Get a Single Order item
    @GetMapping("/order_item/{id}")
    public OrderItemDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order item", "id", id));
    }

    // Update a Order item
    @PutMapping("/order_item/{id}")
    public OrderItemDTO update(@PathVariable(value = "id") Integer id,
                                            @Valid @RequestBody OrderItemDTO entry) {

        OrderItemDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order item", "id", id));
                                               
                obj = entry;

        OrderItemDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a Order item
    @DeleteMapping("/order_item/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        OrderItemDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order item", "id", id));

                repository.delete(obj);

        return ResponseEntity.ok().build();
    }
}