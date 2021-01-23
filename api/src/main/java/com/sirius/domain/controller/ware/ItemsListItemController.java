package com.sirius.domain.controller.ware;

import com.sirius.domain.model.db.ProductDTO;
import com.sirius.domain.model.ware.ListItemDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;
import com.sirius.domain.controller.db.ProductController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/ware")
@Component
public class ItemsListItemController {

    @Autowired
    ProductController controller;

    @GetMapping("/w_items")
    public List<ListItemDTO> getAll() {
        List<ProductDTO> list = controller.getAll();
        List<ListItemDTO> listItems = new ArrayList<>();
        for(Integer i = 0; i < list.size(); i++)
        {
            ListItemDTO dto = new ListItemDTO();
            dto.setId(list.get(i).getId());
            dto.setImgurImgPath(list.get(i).getImage_url());
            dto.setBarCodeNum(list.get(i).getBarcode_num());
            dto.setName(list.get(i).getName());
            dto.setQuantity(5.0);
            dto.setQuaType("Type");
            listItems.add(dto);
        }
        return listItems;
    }
}