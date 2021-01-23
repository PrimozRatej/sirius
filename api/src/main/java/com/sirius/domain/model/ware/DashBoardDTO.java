package com.sirius.domain.model.ware;

import java.math.BigInteger;

public class DashBoardDTO {
public Integer quaToPacked;
public Integer packToShiped;
public Integer packToBeDelivered;
public Integer packToBeInvoice;
public Integer inHand;
public Integer toBeReceived;

    public DashBoardDTO()
    {
        quaToPacked = null;
        packToShiped = null;
        packToBeDelivered = null;
        packToBeInvoice = null;
        inHand = null;
        toBeReceived = null;
    }

    public DashBoardDTO(Object[] columns) {
        this.quaToPacked = (columns[0] != null)?((BigInteger) columns[0]).intValue():null;
        this.packToShiped = (columns[0] != null)?((BigInteger) columns[1]).intValue():null;
        this.packToBeDelivered = (columns[0] != null)?((BigInteger) columns[2]).intValue():null;
        this.packToBeInvoice = (columns[0] != null)?((BigInteger) columns[3]).intValue():null;
        this.inHand = (columns[0] != null)?((BigInteger) columns[4]).intValue():null;
        this.toBeReceived = (columns[0] != null)?((BigInteger) columns[5]).intValue():null;
    }

    public Integer getQuaToPacked() {
        return quaToPacked;
    }

    public void setQuaToPacked(Integer quaToPacked) {
        this.quaToPacked = quaToPacked;
    }

    public Integer getPackToShiped() {
        return packToShiped;
    }

    public void setPackToShiped(Integer packToShiped) {
        this.packToShiped = packToShiped;
    }

    public Integer getPackToBeDelivered() {
        return packToBeDelivered;
    }

    public void setPackToBeDelivered(Integer packToBeDelivered) {
        this.packToBeDelivered = packToBeDelivered;
    }

    public Integer getPackToBeInvoice() {
        return packToBeInvoice;
    }

    public void setPackToBeInvoice(Integer packToBeInvoice) {
        this.packToBeInvoice = packToBeInvoice;
    }

    public Integer getInHand() {
        return inHand;
    }

    public void setInHand(Integer inHand) {
        this.inHand = inHand;
    }

    public Integer getToBeReceived() {
        return toBeReceived;
    }

    public void setToBeReceived(Integer toBeReceived) {
        this.toBeReceived = toBeReceived;
    }
}