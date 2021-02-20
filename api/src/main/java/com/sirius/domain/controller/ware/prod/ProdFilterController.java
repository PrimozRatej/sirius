package com.sirius.domain.controller.ware.prod;


import com.sirius.domain.controller.helpers.StringHelper;
import com.sirius.domain.model.ware.prod.ProdFilterDTO;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
public class ProdFilterController {

    @PersistenceContext
    private EntityManager entityManager;

    @GetMapping("/filter")
    public List<ProdFilterDTO> getPrivateList(
            @RequestParam(required = true) Integer userId,
            @RequestParam(required = true) Boolean isPublic
    ) throws IOException, InterruptedException {
        String queryStr = new String(Files.readAllBytes(Paths.get("./src/main/resources/ware/app_filter.sql")), StandardCharsets.UTF_8);
        Query query = entityManager.createNativeQuery(queryStr);
        List<ProdFilterDTO> list = new ArrayList<>();
        for (Object obj : query.getResultList())
            list.add(new ProdFilterDTO((Object[]) obj));
        // Filter list
        if (userId != null) {
            Predicate<ProdFilterDTO> searchF = prod -> prod.getCreatedByUser() == userId;
            list = list.stream().filter(searchF)
                    .collect(Collectors.toList());
        }

        if (isPublic != null) {
            Predicate<ProdFilterDTO> searchF = prod -> prod.getPublic() == isPublic;
            list = list.stream().filter(searchF)
                    .collect(Collectors.toList());
        }

        return list;
    }
}
