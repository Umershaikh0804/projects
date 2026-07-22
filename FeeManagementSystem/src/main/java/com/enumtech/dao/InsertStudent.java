package com.enumtech.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.enumtech.entity.DayScholar;
import com.enumtech.entity.Hostalite;

public class InsertStudent {
	
	
	

	public static void addStudent(Hostalite h) {
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory=cfg.buildSessionFactory();
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		
		h.calculateFees();
		
		session.save(h);
		tx.commit();
		
		System.out.println(h.getSname()+" is Inserted");
		
		session.close();
		factory.close();
		

	}

	public static void addStudent(DayScholar d) {
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory=cfg.buildSessionFactory();
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		d.calculateFees();
		session.save(d);
		tx.commit();
		
		System.out.println(d.getSname()+" is Inserted");
		
		session.close();
		factory.close();
		
	}
}
