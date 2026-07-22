package com.enumtech.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enumtech.dao.GetStudent;
import com.enumtech.entity.Student;

/**
 * Servlet implementation class ApplyByFlatAmountServlet
 */
@WebServlet("/ApplyByFlatAmountServlet")
public class ApplyByFlatAmountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyByFlatAmountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        try {
	            int roll = Integer.parseInt(request.getParameter("roll"));
	            double amount = Double.parseDouble(request.getParameter("amount"));

	            if (amount <= 0) {
	                request.setAttribute("error", "Enter a valid discount amount!");
	                request.getRequestDispatcher("discount-apply.jsp").forward(request, response);
	                return;
	            }

	            Student student = GetStudent.getStudentById(roll);

	            if (student == null) {
	                request.setAttribute("error", "Student not found");
	                request.getRequestDispatcher("discount-apply.jsp").forward(request, response);
	                return;
	            } else {
	                student.addDiscount(amount,false,roll);  // APPLY FLAT AMOUNT DISCOUNT

	                request.setAttribute("student", student);
	                request.setAttribute("message",
	                    "Flat Amount Discount Applied Successfully on Student: " + student.getSname());
	            }

	        } catch (Exception e) {
	            request.setAttribute("error", "Invalid input! Please check values.");
	        }

	        request.getRequestDispatcher("discount-apply.jsp").forward(request, response);
	    }

}
