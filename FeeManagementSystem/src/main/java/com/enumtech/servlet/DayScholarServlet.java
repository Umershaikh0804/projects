package com.enumtech.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enumtech.dao.GetStudent;
import com.enumtech.entity.DayScholar;

/**
 * Servlet implementation class HostaliteServlet
 */
@WebServlet("/scholar-students")
public class DayScholarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DayScholarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {

        // Call DAO and fetch all Hostalite students
//        StudentDAO dao = new StudentDAO();
        List<DayScholar> list = GetStudent.getAllScholarStudents();
//        System.out.println(list);

        // Store list in request scope
        req.setAttribute("scholarList", list);

        // Forward to JSP
        RequestDispatcher rd = req.getRequestDispatcher("scholar-students.jsp");
        rd.forward(req, resp);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
