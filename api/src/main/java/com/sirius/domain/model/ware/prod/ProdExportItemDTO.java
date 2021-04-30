package com.sirius.domain.model.ware.prod;

import org.w3c.dom.Text;

public class ProdExportItemDTO {
    public ProdExportItemDTO(Object[] columns) {
        this.id = (columns[0] != null)? (Integer) columns[0] :null;
        this.appId = (columns[1] != null)? (Integer) columns[1] :null;
        this.objId = (columns[2] != null)?((Integer) columns[2]):null;
        this.name = (columns[3] != null)?((String) columns[3]):null;
        this.fileExtension = (columns[4] != null)?((String) columns[4]):null;
        this.fileData = (columns[5] != null)?((String) columns[5]):null;
        this.description = (columns[6] != null)?((String) columns[6]):null;
    }

    public ProdExportItemDTO(Integer id, Integer appId, Integer objId, String name, String fileExtension, String fileData, String description) {
        this.id = id;
        this.appId = appId;
        this.objId = objId;
        this.name = name;
        this.fileExtension = fileExtension;
        this.fileData = fileData;
        this.description = description;
    }
    private Integer id;
    private Integer appId;
    private Integer objId;
    private String name;
    private String fileExtension;
    private String fileData;
    private String description;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAppId() {
        return appId;
    }

    public void setAppId(Integer appId) {
        this.appId = appId;
    }

    public Integer getObjId() {
        return objId;
    }

    public void setObjId(Integer objId) {
        this.objId = objId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFileExtension() {
        return fileExtension;
    }

    public void setFileExtension(String fileExtension) {
        this.fileExtension = fileExtension;
    }

    public String getFileData() {
        return fileData;
    }

    public void setFileData(String fileData) {
        this.fileData = fileData;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
