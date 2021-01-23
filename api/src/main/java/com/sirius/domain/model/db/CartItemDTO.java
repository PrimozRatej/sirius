package com.sirius.domain.model.db;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import java.sql.Date;
import javax.persistence.*;

@Entity
@Table(name = "cart_item")
@EntityListeners(AuditingEntityListener.class)
public class CartItemDTO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer user_id;
    
    private Integer product_id;

    private Boolean saved_for_later;

    private Integer quantity;

    private Date time_added;

    private Date time_modified;

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

    public Integer getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Integer product_id) {
        this.product_id = product_id;
    }

    public Boolean getSaved_for_later() {
        return saved_for_later;
    }

    public void setSaved_for_later(Boolean saved_for_later) {
        this.saved_for_later = saved_for_later;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Date getTime_added() {
        return time_added;
    }

    public void setTime_added(Date time_added) {
        this.time_added = time_added;
    }

    public Date getTime_modified() {
        return time_modified;
    }

    public void setTime_modified(Date time_modified) {
        this.time_modified = time_modified;
    }

    
}