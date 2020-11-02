package com.siriusa.sirius.domain.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;

import com.siriusa.sirius.domain.controller.ProductController;
import com.siriusa.sirius.domain.model.AddressDTO;
import com.siriusa.sirius.domain.model.ProductDTO;
import com.siriusa.sirius.domain.model.ware.ItemsListItemDTO;
import com.siriusa.sirius.domain.repository.AddressRepository;
import com.siriusa.sirius.exception.ResourceNotFoundException;
import java.util.List;

@RestController
@RequestMapping("/api/ware")
public class ItemsListItemController {
    @GetMapping("/w_items")
    public List<ItemsListItemDTO> getAll() {
        ProductController controller = new ProductController();
        List<ProductDTO> list = controller.getAll();
        for(Integer i; i < list.size(); i++)
        {
            ItemsListItemDTO dto = new ItemsListItemDTO();
            dto.
        }
    }
}