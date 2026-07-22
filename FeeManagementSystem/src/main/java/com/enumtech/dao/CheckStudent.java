package com.enumtech.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.enumtech.entity.Student;
import com.enumtech.messages.ExceptionMessages;
import com.exception.IncorrectUsernameException;
import com.exception.UsernameExistException;

public class CheckStudent {
	

	public static boolean isUserExist(String username) {
		
		validateUsernameRules(username);
		
		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory factory=cfg.buildSessionFactory();
		Session session = factory.openSession();
		
		 String hql = "FROM Student s WHERE s.username = :uname";
		    Student st = session.createQuery(hql, Student.class)
		                        .setParameter("uname", username)
		                        .uniqueResult();
		
		    if(st != null) {
				System.out.println(st.getSname()+" : "+st.getUsername());
				throw new UsernameExistException(ExceptionMessages.USERNAME_EXIST);
			}
		    
		session.close();
		factory.close();
		System.out.println("Any user with the username: "+username+" doesn't exist");
		return true;
	}
	
	
	private static void validateUsernameRules(String username) {

	    // 1️⃣ Space check
	    if (username.contains(" ")) {
	        throw new IncorrectUsernameException(
	                ExceptionMessages.USERNAME_HAS_SPACE);
	    }

	    // 2️⃣ Capital letter check
	    for (char ch : username.toCharArray()) {
	        if (Character.isUpperCase(ch)) {
	            throw new IncorrectUsernameException(
	                    ExceptionMessages.USERNAME_HAS_CAPITAL);
	        }
	    }

	    // 3️⃣ Starts with special character
	    char firstChar = username.charAt(0);

	    if (!Character.isLetterOrDigit(firstChar)) {
	        throw new IncorrectUsernameException(
	                ExceptionMessages.USERNAME_STARTS_WITH_SPECIAL);
	    }
	}



}
