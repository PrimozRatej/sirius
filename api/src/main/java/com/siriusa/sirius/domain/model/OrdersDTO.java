package com.siriusa.sirius.domain.model;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.sql.Date;

import javax.persistence.*;

@Entity
@Table(name = "orders")
@EntityListeners(AuditingEntityListener.class)
public class OrdersDTO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer user_id;
    
    private Integer address_id;

    private Integer discount_id;

    private String order_status_code;

    private String currency_code;

    private Date created;

    private Date modified;

    private String amount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getAddress_id() {
        return address_id;
    }

    public void setAddress_id(Integer address_id) {
        this.address_id = address_id;
    }

    public Integer getDiscount_id() {
        return discount_id;
    }

    public void setDiscount_id(Integer discount_id) {
        this.discount_id = discount_id;
    }

    public String getOrder_status_code() {
        return order_status_code;
    }

    public void setOrder_status_code(String order_status_code) {
        this.order_status_code = order_status_code;
    }

    public String getCurrency_code() {
        return currency_code;
    }

    public void setCurrency_code(String currency_code) {
        this.currency_code = currency_code;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getModified() {
        return modified;
    }

    public void setModified(Date modified) {
        this.modified = modified;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }
}