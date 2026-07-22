package com.enumtech.util;

import com.enumtech.entity.Student;
import com.enumtech.enums.FeeStatus;
import com.exception.DiscountNotAppliedException;
import com.exception.FullFeesPaidException;
import com.exception.FullNameException;

public class ExceptionMethods {

    public static boolean countWhitespaces(String name) {
        int count = 0;

        for (char ch : name.toCharArray()) {
            if (Character.isWhitespace(ch)) {
                count++;
            }
        }

        if (count < 2) {
            throw new FullNameException(
                "PLEASE ENTER THE FULLNAME [YOUR-NAME FATHER-NAME SUR-NAME]"
            );
        }

        return true;
    }


    // ✅ UPDATED METHOD
    public static void checkFeeStatusAndPercentage(Student student, double discountPercent) {

        double averagePer = 50.0;
        double mediumPer = 70.0;

        // If already fully paid
        if (student.getFeeStatus() == FeeStatus.FULLY_PAID) {
            throw new FullFeesPaidException(
                student.getSname() + " has already paid Full Fees"
            );
        }

        double studentPer = student.getPercentage();

        // If applying 10% discount
        if (discountPercent == 10.0) {
            if (studentPer < averagePer) {
                throw new DiscountNotAppliedException(
                    student.getSname() + " is below 50%. Cannot apply 10% discount."
                );
            }
        }

        // If applying 20% discount
        if (discountPercent == 20.0) {
            if (studentPer < mediumPer) {
                throw new DiscountNotAppliedException(
                    student.getSname() + " is below 70%. Cannot apply 20% discount."
                );
            }
        }
    }
}