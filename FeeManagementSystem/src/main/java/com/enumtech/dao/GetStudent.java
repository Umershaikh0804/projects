package com.enumtech.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.enumtech.entity.DayScholar;
import com.enumtech.entity.Hostalite;
import com.enumtech.entity.Student;

public class GetStudent {
	
	public static List<Hostalite> getAllHostaliteStudents() {
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory=cfg.buildSessionFactory();
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		
		List <Hostalite> list = session
					.createQuery("from Hostalite ", Hostalite.class)
					.list();
//		List<Student> list = session
//		        .createQuery("from Student where isHostalite = true", Student.class)
//		        .list();
		
		for (Hostalite hostalite : list) {
			System.out.println(hostalite.getSname());
		}
		
		tx.commit();
		
		
		session.close();
		factory.close();
		return list;
	}
	
	public static List<DayScholar> getAllScholarStudents() {
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory=cfg.buildSessionFactory();
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		
		List <DayScholar> list = session
					.createQuery("from DayScholar ", DayScholar.class)
					.list();
//		List<Student> list = session
//		        .createQuery("from Student where isHostalite = true", Student.class)
//		        .list();
		
		for (DayScholar stud : list) {
			System.out.println(stud.getSname());
		}
		
		tx.commit();
		
		
		session.close();
		factory.close();
		return list;
	}

	public static Student getStudentById(int roll) {
		
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory=cfg.buildSessionFactory();
		Session session = factory.openSession();
		
		return session.get(Student.class, roll);
		
	}

	public static List<Student> getAllStudents() {

	    Configuration cfg = new Configuration();
	    cfg.configure("hibernate.cfg.xml");

	    SessionFactory factory = cfg.buildSessionFactory();
	    Session session = factory.openSession();

	    List<Student> list;

	    try {
	        list = session
	                .createQuery("from Student", Student.class)
	                .list();
	    } catch (Exception e) {
	        e.printStackTrace();
	        list = List.of(); // ✅ NEVER return null
	    } finally {
	        session.close();
	        factory.close();
	    }

	    return list;
	}



}
