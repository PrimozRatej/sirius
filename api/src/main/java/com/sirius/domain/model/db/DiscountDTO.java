package com.sirius.domain.model.db;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.sql.Date;

import javax.persistence.*;

@Entity
@Table(name = "discount")
@EntityListeners(AuditingEntityListener.class)
public class DiscountDTO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;

    private String  description;
    
    private Integer discount_value;

    private Date created;

    private Date valid_from;

    private Date valid_to;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Integer getDiscount_value() {
        return discount_value;
    }

    public void setDiscount_value(Integer discount_value) {
        this.discount_value = discount_value;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getValid_from() {
        return valid_from;
    }

    public void setValid_from(Date valid_from) {
        this.valid_from = valid_from;
    }

    public Date getValid_to() {
        return valid_to;
    }

    public void setValid_to(Date valid_to) {
        this.valid_to = valid_to;
    }

}