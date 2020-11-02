package com.siriusa.sirius.domain.model;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import javax.persistence.*;

@Entity
@Table(name = "product")
@EntityListeners(AuditingEntityListener.class)
public class ProductDTO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String barcode_num;

    private String barcode_url;

    private Integer category_id;

    private String name;

    private String description;

    private String image_url;

    private String video_url_yt;

    private Double price;

    private String currency_code;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBarcode_num() {
        return barcode_num;
    }

    public void setBarcode_num(String barcode_num) {
        this.barcode_num = barcode_num;
    }

    public String getBarcode_url() {
        return barcode_url;
    }

    public void setBarcode_url(String barcode_url) {
        this.barcode_url = barcode_url;
    }

    public Integer getCategory_id() {
        return category_id;
    }

    public void setCategory_id(Integer category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public String getVideo_url_yt() {
        return video_url_yt;
    }

    public void setVideo_url_yt(String video_url_yt) {
        this.video_url_yt = video_url_yt;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getCurrency_code() {
        return currency_code;
    }

    public void setCurrency_code(String currency_code) {
        this.currency_code = currency_code;
    }
}