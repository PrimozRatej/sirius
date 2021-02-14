package com.sirius.domain.model.ware.lookup;

public class QuantityTypeLookupModelDTO {
    public QuantityTypeLookupModelDTO(Object[] columns) {
        this.quantityType = (columns[0] != null)? columns[0].toString() :null;
    }

    public QuantityTypeLookupModelDTO(String quantityType) {
        this.quantityType = quantityType;
    }

    public QuantityTypeLookupModelDTO(Object value) {
        this.quantityType = (value!= null)? value.toString() :null;
    }

    private String quantityType;

    public String getQuantityType() {
        return quantityType;
    }

    public void setQuantityType(String quantityType) {
        this.quantityType = quantityType;
    }
}
