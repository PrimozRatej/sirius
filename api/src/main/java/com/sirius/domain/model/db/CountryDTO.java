package com.sirius.domain.model.db;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import javax.persistence.*;

@Entity
@Table(name = "country")
@EntityListeners(AuditingEntityListener.class)
public class CountryDTO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String iso;

    private String name;
    
    private String printable_name;

    private String iso3;

    private String numcode;

    public String getIso() {
        return iso;
    }

    public void setIso(String iso) {
        this.iso = iso;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrintable_name() {
        return printable_name;
    }

    public void setPrintable_name(String printable_name) {
        this.printable_name = printable_name;
    }

    public String getIso3() {
        return iso3;
    }

    public void setIso3(String iso3) {
        this.iso3 = iso3;
    }

    public String getNumcode() {
        return numcode;
    }

    public void setNumcode(String numcode) {
        this.numcode = numcode;
    }
}