package com.siriusa.sirius.domain.controller.ware;

import org.springframework.web.bind.annotation.*;
import com.siriusa.sirius.domain.controller.ProductController;
import com.siriusa.sirius.domain.model.ProductDTO;
import com.siriusa.sirius.domain.model.ware.ItemsListItemDTO;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/ware")
public class ItemsListItemController {
    @GetMapping("/w_items")
    public List<ItemsListItemDTO> getAll() {
        ProductController controller = new ProductController();
        List<ProductDTO> list = controller.getAll();
        List<ItemsListItemDTO> listItems = new ArrayList<>();
        for(Integer i = 0; i < list.size(); i++)
        {
            ItemsListItemDTO dto = new ItemsListItemDTO();
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