package com.sirius.domain.controller.ware.prod;


import com.sirius.domain.controller.db.AppFilterController;
import com.sirius.domain.controller.db.AppObjectController;
import com.sirius.domain.controller.helpers.StringHelper;
import com.sirius.domain.controller.util.UtilController;
import com.sirius.domain.model.db.AppFilterDTO;
import com.sirius.domain.model.db.AppObjectDTO;
import com.sirius.domain.model.util.FriendlyUserDTO;
import com.sirius.domain.model.ware.prod.ProdFilterDTO;
import com.sirius.domain.model.ware.prod.ProductItemDTO;
import com.sirius.domain.repository.db.AppFilterRepository;
import com.sirius.domain.repository.db.AppObjectRepository;
import com.sirius.domain.repository.db.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/ware")
@Component
public class ProdFilterController {

    @PersistenceContext
    private EntityManager entityManager;
    @Autowired
    AppObjectRepository appObjectRepository;

    @Autowired
    AppFilterRepository appFilterRepository;

    @GetMapping("/filters")
    public List<ProdFilterDTO> getFilterList(
            @RequestParam(required = true) boolean isPublic,
            @RequestParam(required = true) String objName
    ) throws IOException, InterruptedException {
        /*Thread.sleep(2 * 1000);*/
        String queryStr = new String(Files.readAllBytes(Paths.get("./src/main/resources/ware/app_filter.sql")), StandardCharsets.UTF_8);
        // Get user from request over JWT
        FriendlyUserDTO user = UtilController.getUserUtil();
        //Set queryStr.
        queryStr = queryStr.replace("<<user_id>>", user.getId().toString());
        queryStr = queryStr.replace("<<obj_name>>", objName);
        Query query = entityManager.createNativeQuery(queryStr);
        List<ProdFilterDTO> list = new ArrayList<>();
        for (Object obj : query.getResultList())
            list.add(new ProdFilterDTO((Object[]) obj));
        Predicate<ProdFilterDTO> searchF = prod -> prod.getIsPublic() == isPublic;
        list = list.stream().filter(searchF)
                .collect(Collectors.toList());
        return list;

    }

    @PostMapping("/filters")
    public Integer saveFilter(@RequestBody ProdFilterDTO prodFilterDTO) throws Exception {
        AppObjectController AppObjectController = new AppObjectController(appObjectRepository);
        List<AppObjectDTO> listAppObj = AppObjectController.getAll();
        // Get app object for to save filter to.
        AppObjectDTO appObj = listAppObj.stream().filter(obj -> obj.getName().equalsIgnoreCase(prodFilterDTO.getObjName())).findFirst().orElse(null);
        AppFilterController AppFilterController = new AppFilterController(appFilterRepository);
        // Get new id for that filter filter.id.max() + 1;
        Integer newId = AppFilterController.getAll().stream().max(Comparator.comparing(v -> v.getId())).get().getId() + 1;
        // Create new filter
        AppFilterDTO dtoToCreate = new AppFilterDTO();
        dtoToCreate.setId(newId);
        dtoToCreate.setApp_object_id(appObj.getId());
        dtoToCreate.setName(prodFilterDTO.getName());
        Date dateNow = new Date(System.currentTimeMillis());
        dtoToCreate.setCreated(new java.sql.Date(dateNow.getTime()));
        dtoToCreate.setCreated_by_user(prodFilterDTO.getCreatedByUser());
        dtoToCreate.setIs_public(prodFilterDTO.getIsPublic());
        dtoToCreate.setFilter_string(prodFilterDTO.getFilterString());
        AppFilterController.create(dtoToCreate);
        return 1;
    }

    @DeleteMapping("/filters")
    public Integer deleteFilter(@RequestBody ProdFilterDTO prodFilterDTO) throws Exception {
        AppObjectController AppObjectController = new AppObjectController(appObjectRepository);
        List<AppObjectDTO> listAppObj = AppObjectController.getAll();
        // Get app object for to save filter to.
        AppObjectDTO appObj = listAppObj.stream().filter(obj -> obj.getName().equalsIgnoreCase(prodFilterDTO.getObjName())).findFirst().orElse(null);
        AppFilterController AppFilterController = new AppFilterController(appFilterRepository);
        // Create new filter
        AppFilterController.delete(prodFilterDTO.getId());
        return 1;
    }

}
