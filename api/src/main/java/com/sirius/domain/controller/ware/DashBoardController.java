package com.sirius.domain.controller.ware;
import com.sirius.domain.model.ware.DashBoardDTO;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@RestController
@RequestMapping("/api/ware")
public class DashBoardController {
    // Get All Addresses
    @PersistenceContext
    private EntityManager entityManager;

    @GetMapping("/dashboard")
    public DashBoardDTO get() throws InterruptedException, IOException {
        String queryStr = new String(Files.readAllBytes(Paths.get("./src/main/resources/ware/dashboard.sql")), StandardCharsets.UTF_8);
        Query query = entityManager.createNativeQuery(queryStr);
        DashBoardDTO dto = new DashBoardDTO((Object[]) query.getSingleResult());
        return dto;
    }
}