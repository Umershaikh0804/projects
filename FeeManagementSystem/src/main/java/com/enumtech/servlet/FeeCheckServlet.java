package com.enumtech.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enumtech.dao.GetStudent;
//import com.enumtech.dao.StudentDAO;
import com.enumtech.entity.Student;

@WebServlet("/FeeCheckServlet")
public class FeeCheckServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        Integer id =Integer.parseInt(request.getParameter("roll"));
        
        // When input is empty
        if (id == null){
            request.setAttribute("error", "Please enter a valid Roll Number");
            request.getRequestDispatcher("fee-check.jsp").forward(request, response);
            return;
        }
        
        int roll = id.intValue();

        // Fetch from DB
        Student student = GetStudent.getStudentById(roll);
       
//        ---------------
        
//        if (student == null) {
//            request.setAttribute("error", "Student Data Not Found");
//        } else {
//
//            
//            request.setAttribute("student", student); // Common fields
//        }

        
//        ----------------
  
        if (student == null){
            request.setAttribute("error", "Student Data Not Found");
        } else {
        	// Identify the actual type of student
            if (student instanceof com.enumtech.entity.DayScholar) {
                request.setAttribute("dayScholar", student);
            } 
            else if (student instanceof com.enumtech.entity.Hostalite) {
                request.setAttribute("hostalite", student);
            }
            
            request.setAttribute("student", student);

        }
//        student.calculateFees();
        if (student != null)
        	student.printFeeReceipt();


        request.getRequestDispatcher("fee-check.jsp").forward(request, response);
    }
}
