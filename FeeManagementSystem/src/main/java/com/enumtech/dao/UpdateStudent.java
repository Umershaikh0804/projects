package com.enumtech.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.enumtech.entity.Student;

public class UpdateStudent {

	
	public static void updateStudentById(double baseFees, double totalFees, int rollNum) {
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory=cfg.buildSessionFactory();
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		
		 Student std = session.get(Student.class, rollNum);

		    if (std != null) {
		        //Student s = (Student) obj;
		        std.setBaseFees(baseFees);
		        std.setTotalFees(totalFees);

		        session.update(std); // 🔥 pushes updated values to DB
		        
		    }
		
		
		tx.commit();
		session.close();
		factory.close();
	}
}
