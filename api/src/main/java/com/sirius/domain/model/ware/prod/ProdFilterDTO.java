package com.sirius.domain.model.ware.prod;

import java.util.Date;

public class ProdFilterDTO {

    public ProdFilterDTO(Object[] columns) {
        this.id = (columns[0] != null)? (Integer) columns[0] :null;
        this.app = (columns[0] != null)?((String) columns[1]):null;
        this.name = (columns[0] != null)?((String) columns[2]):null;
        this.created = (columns[0] != null)?((Date) columns[3]):null;
        this.createdByUser = (columns[0] != null)?(Integer.parseInt(columns[4].toString())):null;
        this.isPublic = (columns[0] != null)?((Boolean) columns[5]):null;
        this.filterString = (columns[0] != null)?((String) columns[6]):null;
    }

    public ProdFilterDTO(Integer id, String app, String name, Date created, Integer createdByUser, Boolean isPublic, String filterString) {
        this.id = id;
        this.app = app;
        this.name = name;
        this.created = created;
        this.createdByUser = createdByUser;
        this.isPublic = isPublic;
        this.filterString = filterString;
    }
    Integer id;
    String app;
    String name;
    Date created;
    Integer createdByUser;
    Boolean isPublic;
    String filterString;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getCreatedByUser() {
        return createdByUser;
    }

    public void setCreatedByUser(int createdByUser) {
        this.createdByUser = createdByUser;
    }

    public Boolean getPublic() {
        return isPublic;
    }

    public void setPublic(Boolean aPublic) {
        isPublic = aPublic;
    }

    public String getFilterString() {
        return filterString;
    }

    public void setFilterString(String filterString) {
        this.filterString = filterString;
    }
}
