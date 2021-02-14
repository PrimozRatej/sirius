package com.sirius.domain.controller.ware;

import com.sirius.domain.controller.helpers.StringHelper;
import com.sirius.domain.model.db.ProductDTO;
import com.sirius.domain.model.ware.ProductItemDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;
import com.sirius.domain.controller.db.ProductController;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/ware")
@Component
public class ProductListController {

    @Autowired
    ProductController controller;
    @PersistenceContext
    private EntityManager entityManager;

    @GetMapping("/products")
    public List<ProductItemDTO> getAll(
            @RequestParam(required = false) String search,
            @RequestParam(required = false) Integer skuFrom,
            @RequestParam(required = false) Integer skuTo,
            @RequestParam(required = false) Integer skuExact,
            @RequestParam(required = false) Integer quantityFrom,
            @RequestParam(required = false) Integer quantityTo,
            @RequestParam(required = false) Integer quantityExact,
            @RequestParam(required = false) String quantityType
    ) throws IOException, InterruptedException {
        // Thread.sleep(2 * 1000);
        String queryStr = new String(Files.readAllBytes(Paths.get("./src/main/resources/ware/products.sql")), StandardCharsets.UTF_8);
        Query query = entityManager.createNativeQuery(queryStr);
        List<ProductItemDTO> list = new ArrayList<>();
        for (Object obj : query.getResultList())
            list.add(new ProductItemDTO((Object[]) obj));
        // Filter list
        // Search
        if (!StringHelper.isNullOrEmpty(search)) {
            Predicate<ProductItemDTO> searchF = prod -> prod.getName().toLowerCase().contains(search.toLowerCase());
            list = list.stream().filter(searchF)
                    .collect(Collectors.toList());
        }
        // SKU
        if (skuFrom != null || skuTo != null) {
            if (skuFrom != null) {
                Predicate<ProductItemDTO> searchF = prod -> prod.getId() >= skuFrom;
                list = list.stream().filter(searchF)
                        .collect(Collectors.toList());
            }

            if (skuTo != null) {
                Predicate<ProductItemDTO> searchF = prod -> prod.getId() <= skuTo;
                list = list.stream().filter(searchF)
                        .collect(Collectors.toList());
            }
        }
        if (skuExact != null) {
            Predicate<ProductItemDTO> searchF = prod -> prod.getId() == skuExact;
            list = list.stream().filter(searchF)
                    .collect(Collectors.toList());
        }

        // Quantity
        if (quantityFrom != null || quantityTo != null) {
            if (quantityFrom != null) {
                Predicate<ProductItemDTO> searchF = prod -> prod.getQuantity() >= quantityFrom;
                list = list.stream().filter(searchF)
                        .collect(Collectors.toList());
            }

            if (quantityTo != null) {
                Predicate<ProductItemDTO> searchF = prod -> prod.getQuantity() <= quantityTo;
                list = list.stream().filter(searchF)
                        .collect(Collectors.toList());
            }
        }
        if (quantityExact != null) {
            Predicate<ProductItemDTO> searchF = prod -> prod.getQuantity().intValue() == quantityExact;
            list = list.stream().filter(searchF)
                    .collect(Collectors.toList());
        }

        if (quantityType != null) {
            Predicate<ProductItemDTO> searchF = prod -> prod.getQuaType().equals(quantityType);
            list = list.stream().filter(searchF)
                    .collect(Collectors.toList());
        }

        return list;
    }

    public List<ProductItemDTO> map(List<ProductDTO> list) {
        return list.stream()
                .map(prod -> new ProductItemDTO(
                        prod.getId(),
                        prod.getImage_url(),
                        prod.getBarcode_url(),
                        prod.getName(),
                        5.0,
                        "kom"
                ))
                .collect(Collectors.toList());
    }

}