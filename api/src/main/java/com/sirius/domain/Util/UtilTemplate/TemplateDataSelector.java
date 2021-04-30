package com.sirius.domain.Util.UtilTemplate;

import com.sirius.domain.Util.UtilTemplate.controller.prod.ProdTemplateDataController;
import com.sirius.domain.controller.util.UtilController;
import com.sirius.domain.model.db.AppTemplateDTO;

import javax.persistence.EntityManager;
import java.io.IOException;

public class TemplateDataSelector {
    public static Object getData(AppTemplateDTO templateInDTO, EntityManager entityManager) throws IOException {
        String objName = UtilController.getObjectNameById(templateInDTO.getObjId());
        switch(objName) {
            case "prod":
                return new ProdTemplateDataController().getData(entityManager);
            default:
                return null;
        }
    }
}
