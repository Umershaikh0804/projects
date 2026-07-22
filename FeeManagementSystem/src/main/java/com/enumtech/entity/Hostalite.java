package com.enumtech.entity;

import javax.persistence.Column;
import javax.persistence.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
@SuperBuilder
public class Hostalite extends Student {

	private double foodCharges = FOOD_FEES;
	
	@Column(columnDefinition = "TINYINT(1)")
	private boolean isHostalite;
	
	@Override
	public double calculateFees() {
	    this.setTotalFees(getBaseFees() + this.getFoodCharges());
	    return getTotalFees();
	}
	
	@Override
	public void printFeeReceipt() {
	    System.out.println("======== HOSTALITE RECEIPT ========");
	    System.out.println("Name: " + getSname());
	    System.out.println("Course: " + getCourse());
	    System.out.println("Base Fees: " + getBaseFees());
	    System.out.println("Food Charges: " + foodCharges);
	    System.out.println("Total Payable: " + calculateFees());
	    System.out.println("===================================");
	}

	
	@Override
	public void displayStudentDetails() {
		System.out.println("========================");
		System.out.println("Name: "+this.getSname());
		System.out.println("Course: "+this.getCourse());
		System.out.println("Fees: "+this.getBaseFees());
		System.out.println("Food Charges: "+this.foodCharges);
		System.out.println("========================");
	}
	
	@Override
	public String getStudentType() {
	    return "Hostalite";
	}

}
