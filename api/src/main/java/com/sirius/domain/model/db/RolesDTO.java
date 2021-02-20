package com.sirius.domain.model.db;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import javax.persistence.*;

@Entity
@Table(name = "roles")
@EntityListeners(AuditingEntityListener.class)
public class RolesDTO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;

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
}
