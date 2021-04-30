package com.sirius.domain.Util.UtilTemplate.dto.prod;

import java.math.BigDecimal;

public class ProdDataListItemInventory{
    public Integer id;
    public String barcodeUrl;
    public Integer categoryId;
    public String name;
    public String description;
    public String imageUrl;
    public String videoUrlYt;
    public BigDecimal price;
    public String currencyCode;
    public BigDecimal awaitingFulfillment;
    public BigDecimal awaitingPayment;
    public BigDecimal awaitingPickup;
    public BigDecimal awaitingShipment;
    public BigDecimal inHand;
    public BigDecimal toBeReceived;
    public BigDecimal cancelled;
    public BigDecimal completed;
    public BigDecimal declined;
    public BigDecimal disputed;
    public BigDecimal manualVerificationRequired;
    public BigDecimal pending;
    public BigDecimal partiallyShipped;
    public BigDecimal partiallyRefunded;
    public BigDecimal refunded;
    public BigDecimal shipped;


    public ProdDataListItemInventory(Object[] columns) {
        this.id = (columns[0] != null)? (Integer) columns[0] :null;
        this.barcodeUrl = (columns[1] != null)? (String) columns[1] :null;
        this.categoryId = (columns[2] != null)? (Integer) columns[2] :null;
        this.name = (columns[3] != null)? (String) columns[3] :null;
        this.description = (columns[4] != null)? (String) columns[4] :null;
        this.imageUrl = (columns[5] != null)? (String) columns[5] :null;
        this.videoUrlYt = (columns[6] != null)? (String) columns[6] :null;
        this.price = (columns[7] != null)? (BigDecimal) columns[7] :null;
        this.currencyCode = (columns[8] != null)? (String) columns[8] :null;
        this.awaitingFulfillment = (columns[9] != null)? (BigDecimal) columns[9] :null;
        this.awaitingPayment = (columns[10] != null)? (BigDecimal) columns[10] :null;
        this.awaitingPickup = (columns[11] != null)? (BigDecimal) columns[11] :null;
        this.awaitingShipment = (columns[12] != null)? (BigDecimal) columns[12] :null;
        this.inHand = (columns[13] != null)? (BigDecimal) columns[13] :null;
        this.toBeReceived = (columns[14] != null)? (BigDecimal) columns[14] :null;
        this.cancelled = (columns[15] != null)? (BigDecimal) columns[15] :null;
        this.completed = (columns[16] != null)? (BigDecimal) columns[16] :null;
        this.declined = (columns[17] != null)? (BigDecimal) columns[17] :null;
        this.disputed = (columns[18] != null)? (BigDecimal) columns[18] :null;
        this.manualVerificationRequired = (columns[19] != null)? (BigDecimal) columns[19] :null;
        this.pending = (columns[20] != null)? (BigDecimal) columns[20] :null;
        this.partiallyShipped = (columns[21] != null)? (BigDecimal) columns[21] :null;
        this.partiallyRefunded = (columns[22] != null)? (BigDecimal) columns[22] :null;
        this.refunded = (columns[23] != null)? (BigDecimal) columns[23] :null;
        this.shipped = (columns[24] != null)? (BigDecimal) columns[24] :null;



    }
}