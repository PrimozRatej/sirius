package com.sirius.domain.model.db;
import net.bytebuddy.implementation.bind.annotation.Default;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "app_filter")
@EntityListeners(AuditingEntityListener.class)
public class AppFilterDTO {

    @Id
    // @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer app_object_id;

    private String name;

    private Date created;

    private Integer created_by_user;

    private Boolean is_public;

    private String filter_string;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getApp_object_id() {
        return app_object_id;
    }

    public void setApp_object_id(Integer app_object_id) {
        this.app_object_id = app_object_id;
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

    public Integer getCreated_by_user() {
        return created_by_user;
    }

    public void setCreated_by_user(Integer created_by_user) {
        this.created_by_user = created_by_user;
    }

    public Boolean getIs_public() {
        return is_public;
    }

    public void setIs_public(Boolean is_public) {
        this.is_public = is_public;
    }

    public String getFilter_string() {
        return filter_string;
    }

    public void setFilter_string(String filter_string) {
        this.filter_string = filter_string;
    }
}
