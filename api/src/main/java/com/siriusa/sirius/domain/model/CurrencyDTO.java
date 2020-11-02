package com.siriusa.sirius.domain.model;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import javax.persistence.*;

@Entity
@Table(name = "currency")
@EntityListeners(AuditingEntityListener.class)
public class CurrencyDTO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String code;

    private String name;
    
    private String symbol;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }
}