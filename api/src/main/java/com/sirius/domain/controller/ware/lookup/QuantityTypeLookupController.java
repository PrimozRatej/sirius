package com.sirius.domain.controller.ware.lookup;

import com.sirius.domain.controller.helpers.StringHelper;
import com.sirius.domain.model.ware.lookup.QuantityTypeLookupModelDTO;
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
@RequestMapping("/api/ware/lookup")
@Component
public class QuantityTypeLookupController {

    @Autowired
    ProductController controller;
    @PersistenceContext
    private EntityManager entityManager;

    @GetMapping("/quantity_type")
    public List<QuantityTypeLookupModelDTO> getAll(@RequestParam(required = false) String search) throws IOException, InterruptedException {
        // Thread.sleep(2 * 1000);
        String queryStr = new String(Files.readAllBytes(Paths.get("./src/main/resources/ware/lookup/quantityType.sql")), StandardCharsets.UTF_8);
        Query query = entityManager.createNativeQuery(queryStr);
        List<QuantityTypeLookupModelDTO> list = new ArrayList<>();
        for (Object obj : query.getResultList())
            list.add(new QuantityTypeLookupModelDTO(obj));
        // Filter list
        // Search
        if (!StringHelper.isNullOrEmpty(search)) {
            Predicate<QuantityTypeLookupModelDTO> searchF = quaTyp -> quaTyp.getQuantityType().toLowerCase().contains(search.toLowerCase());
            list = list.stream().filter(searchF)
                    .collect(Collectors.toList());
        }

        return list;
    }
}