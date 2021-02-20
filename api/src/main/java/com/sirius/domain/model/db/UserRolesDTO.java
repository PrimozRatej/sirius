package com.sirius.domain.model.db;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import javax.persistence.*;

@Entity
@Table(name = "user_roles")
@EntityListeners(AuditingEntityListener.class)
public class UserRolesDTO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer user_id;

    private Integer role_id;

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getRole_id() {
        return role_id;
    }

    public void setRole_id(Integer role_id) {
        this.role_id = role_id;
    }
}
