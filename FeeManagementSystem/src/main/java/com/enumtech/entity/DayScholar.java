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
public class DayScholar extends Student{

	private double busFees = TRANSPORT_FEES; // transport Fees
	@Column(columnDefinition = "TINYINT(1)")
	private boolean isDayScholar;
	
	@Override
	public double calculateFees() {
		
		this.setTotalFees(getBaseFees() + busFees);
		return getTotalFees();
	}
	
	@Override
	public void printFeeReceipt() {
	    System.out.println("======== DAY SCHOLAR RECEIPT ========");
	    System.out.println("Name: " + this.getSname());
	    System.out.println("Course: " + this.getCourse());
	    System.out.println("Base Fees: " + this.getBaseFees());
	    System.out.println("Bus Fees: " + this.getBusFees());
	    System.out.println("Total Payable: " + this.calculateFees());
	    System.out.println("=====================================");
	}

	
	@Override
	public void displayStudentDetails() {
		System.out.println("========================");
		System.out.println("Name: "+this.getSname());
		System.out.println("Course: "+this.getCourse());
		System.out.println("Fees: "+this.getBaseFees());
		System.out.println("Bus Charges: "+this.busFees);
		System.out.println("========================");
	}

	@Override
	public String getStudentType() {
	    return "DayScholar";
	}

	
}
