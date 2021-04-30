package com.sirius.domain.model.ware.prod;

import org.json.JSONException;
import org.json.JSONObject;

import java.math.BigInteger;

public class ProductItemDTO {

    public ProductItemDTO(Object[] columns) {
        this.id = (columns[0] != null)? (Integer) columns[0] :null;
        this.imgurImgPath = (columns[0] != null)?((String) columns[1]):null;
        this.barCodeNum = (columns[0] != null)?((String) columns[2]):null;
        this.name = (columns[0] != null)?((String) columns[3]):null;
        this.quantity = (columns[0] != null)?(Double.parseDouble(columns[4].toString())):null;
        this.quaType = (columns[0] != null)?((String) columns[5]):null;
    }

    public ProductItemDTO(Integer id, String imgurImgPath, String barCodeNum, String name, Double quantity, String quaType) {
        this.id = id;
        this.imgurImgPath = imgurImgPath;
        this.barCodeNum = barCodeNum;
        this.name = name;
        this.quantity = quantity;
        this.quaType = quaType;
    }

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
