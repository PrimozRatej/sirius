package com.siriusa.sirius.domain.model.ware;

public class ItemsListItemDTO {
    private Integer id;
    private String imgurImgPath;
    private String barCodeNum;
    private String name;
    private Double quantity;
    private String quaType;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImgurImgPath() {
        return imgurImgPath;
    }

    public void setImgurImgPath(String imgurImgPath) {
        this.imgurImgPath = imgurImgPath;
    }

    public String getBarCodeNum() {
        return barCodeNum;
    }

    public void setBarCodeNum(String barCodeNum) {
        this.barCodeNum = barCodeNum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getQuantity() {
        return quantity;
    }

    public void setQuantity(Double quantity) {
        this.quantity = quantity;
    }

    public String getQuaType() {
        return quaType;
    }

    public void setQuaType(String quaType) {
        this.quaType = quaType;
    }
}
