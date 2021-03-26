package com.sirius.domain.model.ware.prod;

import java.util.Date;

public class ProdFilterDTO {
    ProdFilterDTO(){

    }

    public ProdFilterDTO(Object[] columns) {
        this.id = (columns[0] != null)? (Integer) columns[0] :null;
        this.appObjectId = (columns[1] != null)?((Integer) columns[1]):null;
        this.app = (columns[2] != null)?((String)columns[2]):null;
        this.name = (columns[3] != null)?((String) columns[3]):null;
        this.created = (columns[4] != null)?((Date) columns[4]):null;
        this.createdByUser = (columns[5] != null)?(Integer.parseInt(columns[5].toString())):null;
        this.isPublic = (columns[6] != null)?((Boolean) columns[6]):null;
        this.filterString = (columns[7] != null)?((String) columns[7]):null;
        this.username = (columns[8] != null)?((String) columns[8]):null;
        this.objName = (columns[9] != null)?((String) columns[9]):null;
    }

    public ProdFilterDTO(Integer id, Integer appObjectId, String app, String name, Date created, Integer createdByUser, Boolean isPublic, String filterString, String username, String objName) {
        this.id = id;
        this.appObjectId = appObjectId;
        this.app = app;
        this.name = name;
        this.created = created;
        this.createdByUser = createdByUser;
        this.isPublic = isPublic;
        this.filterString = filterString;
        this.username = username;
        this.objName = objName;
    }
    Integer id;
    Integer appObjectId;
    String app;
    String name;
    Date created;
    Integer createdByUser;
    Boolean isPublic;
    String filterString;
    String username;
    String objName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAppObjectId() {
        return appObjectId;
    }

    public void setAppObjectId(Integer appObjectId) {
        this.appObjectId = appObjectId;
    }

    public String getApp() {
        return app;
    }

    public void setApp(String app) {
        this.app = app;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Integer getCreatedByUser() {
        return createdByUser;
    }

    public void setCreatedByUser(Integer createdByUser) {
        this.createdByUser = createdByUser;
    }

    public Boolean getIsPublic() {
        return isPublic;
    }

    public void setIsPublic(Boolean aPublic) {
        isPublic = aPublic;
    }

    public String getFilterString() {
        return filterString;
    }

    public void setFilterString(String filterString) {
        this.filterString = filterString;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getObjName() {
        return objName;
    }

    public void setObjName(String objName) {
        this.objName = objName;
    }
}
