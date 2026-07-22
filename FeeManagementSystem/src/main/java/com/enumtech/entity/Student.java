package com.enumtech.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

import com.enumtech.dao.UpdateStudent;
import com.enumtech.enums.FeeStatus;
import com.enumtech.service.FeeOperations;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
@Entity
@SuperBuilder
@Table(name = "students")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public abstract class Student implements FeeOperations {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY )
	private int rno;
	private String sname;
	
	@Column(length = 50)
	private String state;

	@Column(length = 50)
	private String city;
	
	@Column(length = 50)
	private String username;
	
	private double percentage;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "feeStatus", length = 20)
	private FeeStatus feeStatus = FeeStatus.ADVANCE_PAID;  // ✅ DEFAULT VALUE


	private String course;
	private double baseFees = GENERAL_FEES; // tuition fees
	private double totalFees;
	
	public static double GENERAL_FEES = 10000.0;
	public static double TRANSPORT_FEES = 7000.0;
	public static double FOOD_FEES = 4000.0;
	public static double FLAT_AMOUNT = 1000.0;

	protected void displayStudentDetails() {
		System.out.println("========================");
		System.out.println("Name: "+this.sname);
		System.out.println("Course: "+this.course);
		System.out.println("Fees: "+this.baseFees);
		System.out.println("========================");
	}
	
	public void addDiscount(double percent, int rollNum) {
	    if (percent <= 0 || percent > 100) {
	        System.out.println("Invalid discount percent");
	        return;
	    }

	    double discountAmount = this.getBaseFees() * (percent / 100);
	    this.setBaseFees(this.getBaseFees() - discountAmount);
	    this.calculateFees();
	    UpdateStudent.updateStudentById( this.getBaseFees(),  this.getTotalFees(), rollNum);

	  //  this.setTotalFees(this.getBaseFees() - discountAmount);

	    System.out.println("Applied " + percent + "% discount. New Fees: " + this.getBaseFees());
	}
	
	public void addDiscount(double flatAmount, boolean isSpecialDiscount,  int rollNum) {

	    if (flatAmount <= 0) {
	        System.out.println("Invalid discount amount");
	        return;
	    }

	    double totalDiscount = flatAmount;

	    // if special discount applies, add the extra special discount
	    if (isSpecialDiscount) {
	        totalDiscount += FLAT_AMOUNT;  // add special discount
	    }

	    // final fees update
	    this.setBaseFees(this.getBaseFees() - totalDiscount);
	    this.calculateFees();
	    UpdateStudent.updateStudentById(this.getBaseFees(),  this.getTotalFees(), rollNum);

	    System.out.println("Applied flat discount. Total Discount = " 
	                        + totalDiscount + ". New Fees: " + this.getBaseFees());
	}
	
	public String getStudentType() {
	    return "STUDENT";
	}



}
