package com.sirius.domain.controller.ware.prod;

import com.aspose.pdf.Document;
import com.aspose.pdf.HtmlLoadOptions;
import com.aspose.pdf.SaveFormat;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sirius.domain.Util.JSONUtils;
import com.sirius.domain.Util.UtilTemplate.TemplateDataSelector;
import com.sirius.domain.controller.db.AppTemplateController;
import com.sirius.domain.controller.util.FileTypeConverter;
import com.sirius.domain.controller.util.UtilController;
import com.sirius.domain.model.db.AppTemplateDTO;
import com.sirius.domain.model.ware.prod.*;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.validation.Valid;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;

@RestController
@RequestMapping("/api/ware")
@Component
public class ProdExportController {

    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    AppTemplateController templateController;

    @RequestMapping(value="/download/file", method=RequestMethod.POST)
    public ResponseEntity<byte[]> getFile(@Valid @RequestBody AppTemplateDTO templateInDTO) throws IOException, InterruptedException, JSONException {
        // Get data for template
        Object data = TemplateDataSelector.getData(templateInDTO, entityManager);
        // Get template
        AppTemplateDTO templateDTO = templateController.getById(templateInDTO.getId());
        // Mustache init and refactor
        MustacheFactory mf = new DefaultMustacheFactory();
        Mustache m = mf.compile(new StringReader(templateDTO.getFileData()), "data");

        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(data);

        StringWriter writer = new StringWriter();
        m.execute(writer, JSONUtils.toMap(new JSONObject(json))).flush();
        // Finished html
        String html = writer.toString();
        // Generate selected file
        FileTypeConverter converter = new FileTypeConverter(html, templateInDTO.getFileExtension());
        byte[] content = converter.convert();
        String str = new String(content, StandardCharsets.UTF_8);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(converter.getMIME());

        // Actual filename of your file with file extension
        String filename = templateDTO.getName()+"."+templateDTO.getFileExtension();
        headers.setContentDispositionFormData(filename, filename);
        headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
        ResponseEntity<byte[]> response = new ResponseEntity<>(content, headers, HttpStatus.OK);
        return response;
    }

    @PostMapping("/exports")
    public ProdExportListDTO getAllExportTemplates(@RequestBody ProdExportFilterDTO filter) throws Exception {
        Thread.sleep(2 * 1000);
        String queryStr = new String(Files.readAllBytes(Paths.get("./src/main/resources/ware/export.sql")), StandardCharsets.UTF_8);
        Query query = entityManager.createNativeQuery(queryStr);
        List<ProdExportItemDTO> list = new ArrayList<>();
        for (Object obj : query.getResultList())
            list.add(new ProdExportItemDTO((Object[]) obj));
        // Filter list

        if (filter.getObjName() != null) {
            Predicate<ProdExportItemDTO> searchF = prod -> prod.getObjId().equals(UtilController.getObjectIdByName(filter.getObjName()));
            list = list.stream().filter(searchF)
                    .collect(Collectors.toList());
        }

        if (filter.getType() != null) {
            Predicate<ProdExportItemDTO> searchF = prod -> prod.getFileExtension().equals(filter.getType().toLowerCase(Locale.ROOT));
            list = list.stream().filter(searchF)
                    .collect(Collectors.toList());
        }

        // Get number of all in DB.
        long count = templateController.getAll().stream().count();
        ProdExportListDTO dto = new ProdExportListDTO();
        dto.setFilteredList(list);
        dto.setCountAlInDB((int) count);
        // Get list
        return dto;
    }
}