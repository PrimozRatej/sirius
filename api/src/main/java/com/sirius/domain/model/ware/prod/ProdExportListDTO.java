package com.sirius.domain.model.ware.prod;

import java.util.List;

public class ProdExportListDTO {
        List<ProdExportItemDTO> filteredList;
        int countAlInDB;

        public List<ProdExportItemDTO> getFilteredList() {
            return filteredList;
        }

        public void setFilteredList(List<ProdExportItemDTO> filteredList) {
            this.filteredList = filteredList;
        }

        public int getCountAlInDB() {
            return countAlInDB;
        }

        public void setCountAlInDB(int countAlInDB) {
            this.countAlInDB = countAlInDB;
        }
}
