package com.sirius.domain.model.ware.prod;

import java.util.List;

public class ProductListDTO {
    List<ProductItemDTO> filteredList;
    int countAlInDB;

    public List<ProductItemDTO> getFilteredList() {
        return filteredList;
    }

    public void setFilteredList(List<ProductItemDTO> filteredList) {
        this.filteredList = filteredList;
    }

    public int getCountAlInDB() {
        return countAlInDB;
    }

    public void setCountAlInDB(int countAlInDB) {
        this.countAlInDB = countAlInDB;
    }
}
