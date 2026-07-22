package com.enumtech.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enumtech.dto.SearchResult;
import com.enumtech.service.StudentSearchService;

/**
 * Servlet implementation class SearchStudentServlet
 */
@WebServlet("/SearchStudentServlet")
public class SearchStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchStudentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
 
        protected void doGet(HttpServletRequest req, HttpServletResponse res)
                throws ServletException, IOException {

            // Collect inputs (all optional)
            String[] types = req.getParameterValues("type");
            String state = req.getParameter("state");
            String city = req.getParameter("city");
            String course = req.getParameter("course");
            String sortBy = req.getParameter("sortBy");
            String order = req.getParameter("order");

//            Integer minPercent = parseInt(req.getParameter("minPercent"));
//            Integer maxPercent = parseInt(req.getParameter("maxPercent"));
//           
            // for Top N Results
            Integer limit = parseInt(req.getParameter("limit"));

            // Call service
            StudentSearchService service = new StudentSearchService();
//            SearchResult result = service.search(
//                    types, state, city, course,
//                    minPercent, maxPercent,
//                    sortBy, order, limit
//            );
            
            SearchResult result = service.search(
                    types, state, city, course,
                    sortBy, order, limit
            );

            // Send to JSP
            req.setAttribute("students", result.students);
            req.setAttribute("total", result.total);
            req.setAttribute("hostaliteCount", result.hostaliteCount);
            req.setAttribute("dayScholarCount", result.dayScholarCount);
            req.setAttribute("courseCount", result.courseCount);

            req.getRequestDispatcher("search-students.jsp")
               .forward(req, res);
        }

	private Integer parseInt(String v) {
		try {
			return v == null || v.isEmpty() ? null : Integer.parseInt(v);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
