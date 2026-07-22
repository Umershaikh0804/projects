package com.enumtech;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.enumtech.entity.DayScholar;
import com.enumtech.entity.Hostalite;

public class DriverApp {

	public static void main(String[] args) {
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory=cfg.buildSessionFactory();
		    	
		    	/* this factory object will be used to execute the database functions*/

		Hostalite s1 =new Hostalite();
		DayScholar d1 =new DayScholar();
		
		s1.setSname("Ali");
		s1.setCourse("BBACA");
		//s1.setFoodCharges(2400.0);
		s1.setHostalite(true);
		s1.displayStudentDetails();
		//s1.addDiscount(1300, false,1);
		//s1.calculateFees();
		s1.printFeeReceipt();
		
		d1.setSname("Sabir");
		d1.setCourse("BBACA");
		d1.setBusFees(1500.0);
		d1.setDayScholar(true);
//		d1.displayStudentDetails();
		System.out.println();
		
		
		//System.out.println(s1.getSname());
		System.out.println(factory);
		System.out.println(factory.isClosed());
	}
}
