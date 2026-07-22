package com.enumtech.enums;

public enum FeeStatus {

    UNPAID,           // 0%
    ADVANCE_PAID,     // >0% and <50%
    PARTIALLY_PAID,   // >=50% and <100%
    FULLY_PAID        // 100%
}

