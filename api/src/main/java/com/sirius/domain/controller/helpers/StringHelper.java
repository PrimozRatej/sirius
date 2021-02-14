package com.sirius.domain.controller.helpers;

public class StringHelper {
    public static boolean isNullOrEmpty(String string){
        if (string == null) return true;
        else if (string.isEmpty()) return true;
        else return false;
    }
}
