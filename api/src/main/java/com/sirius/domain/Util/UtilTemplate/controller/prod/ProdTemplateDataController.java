package com.sirius.domain.Util.UtilTemplate.controller.prod;

import com.sirius.domain.Util.UtilTemplate.dto.prod.ProdDataListItemInventory;
import com.sirius.domain.Util.UtilTemplate.dto.prod.ProdTemplateDataDTO;
import com.sirius.domain.controller.util.UtilController;
import com.sirius.domain.model.util.FriendlyUserDTO;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class ProdTemplateDataController {

    public Object getData(EntityManager entityManager) throws IOException {
        String queryStr = new String(Files.readAllBytes(Paths.get("./src/main/resources/ware/prod_export.sql")), StandardCharsets.UTF_8);
        // Get user from request over JWT
        FriendlyUserDTO user = UtilController.getUserUtil();
        // Init data
        ProdTemplateDataDTO data = new ProdTemplateDataDTO();
        Date date = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
        String strDate = dateFormat.format(date);
        data.dateNow0 = strDate;
        data.dateNow1 = strDate;
        data.logoImgPath = "https://imgur.com/Qp9Uei2.png";
        data.storeName = "Sirius shoes store";
        data.userNameSurname = user.getFirstName() +" "+user.getLastName();
        data.inventoryList = new ArrayList<>();
        // append data
        Query query = entityManager.createNativeQuery(queryStr);
        for (Object obj : query.getResultList())
            data.inventoryList.add(new ProdDataListItemInventory((Object[]) obj));

        return data;
    }
}
