package com.enumtech.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.enumtech.dao.CheckStudent;
import com.enumtech.dao.InsertStudent;
import com.enumtech.entity.DayScholar;
import com.enumtech.entity.Hostalite;
import com.enumtech.util.Location;
import com.enumtech.util.ExceptionMethods;
import com.exception.CityNotExistException;
import com.exception.FullNameException;
import com.exception.IncorrectUsernameException;
import com.exception.StateNotExistException;
import com.exception.UsernameExistException;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		HttpSession session = request.getSession();

		String name = request.getParameter("sname");
		String username = request.getParameter("username");
		String course = request.getParameter("course");
		String studentType = request.getParameter("student-type");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String percentageStr = request.getParameter("percentage");

		// Store values in session (for form refill)
		session.setAttribute("sname", name);
		session.setAttribute("username", username);
		session.setAttribute("state", state);
		session.setAttribute("city", city);
		session.setAttribute("course", course);

		// ---------------- PERCENTAGE VALIDATION ----------------
		double percentage = 0.0;

		try {
			percentage = Double.parseDouble(percentageStr);

			if (percentage < 0 || percentage > 100) {
				throw new IllegalArgumentException("Percentage must be between 0 and 100");
			}

		} catch (Exception e) {
			session.setAttribute("toastMessage", "Invalid Percentage Value (0-100 only)");
			session.setAttribute("toastType", "error");
			response.sendRedirect(studentType.equals("hostalite") ? "hostalite-form.jsp" : "dayscholar-form.jsp");
			return;
		}

		// ==========================================================
		// =================== HOSTALITE ============================
		// ==========================================================
		if (studentType.equals("hostalite")) {

			Hostalite h1 = new Hostalite();
			h1.setPercentage(percentage);

			try {
				// Username validation
				if (!CheckStudent.isUserExist(username)) {
					throw new UsernameExistException("Username '" + username + "' already exists! Please choose another.");
				}
				h1.setUsername(username);

				// Name validation
				if (!ExceptionMethods.countWhitespaces(name)) {
					throw new FullNameException("Name must contain at least first and last name");
				}
				h1.setSname(name);

				// State validation
				if (!Location.STATE_CITY_MAP.containsKey(state)) {
					throw new StateNotExistException("State '" + state + "' doesn't exist in our database");
				}
				h1.setState(state);

				List<String> cities = Location.STATE_CITY_MAP.get(state);
				if (!cities.contains(city)) {
					throw new CityNotExistException("City '" + city + "' doesn't belong to " + state);
				}
				h1.setCity(city);

				h1.setCourse(course);
				h1.setHostalite(true);
				
				// Insert into database (void method)
				InsertStudent.addStudent(h1);
				
				// Success - set toast message
				session.setAttribute("toastMessage", name + " added successfully as Hostalite Student!");
				session.setAttribute("toastType", "success");
				clearSession(session);
				response.sendRedirect("home-page2.jsp");
				return;

			} catch (StateNotExistException ex) {
				session.setAttribute("toastMessage", ex.getMessage());
				session.setAttribute("toastType", "error");
				response.sendRedirect("hostalite-form.jsp");
				return;
			} catch (IncorrectUsernameException ex) {
				session.setAttribute("toastMessage", ex.getMessage());
				session.setAttribute("toastType", "error");
				response.sendRedirect("hostalite-form.jsp");
				return;
			} catch (UsernameExistException ex) {
				session.setAttribute("toastMessage", ex.getMessage());
				session.setAttribute("toastType", "error");
				response.sendRedirect("hostalite-form.jsp");
				return;
			} catch (FullNameException ex) {
				session.setAttribute("toastMessage", ex.getMessage());
				session.setAttribute("toastType", "error");
				response.sendRedirect("hostalite-form.jsp");
				return;
			} catch (CityNotExistException ex) {
				session.setAttribute("toastMessage", ex.getMessage());
				session.setAttribute("toastType", "error");
				response.sendRedirect("hostalite-form.jsp");
				return;
			} catch (Exception ex) {
				session.setAttribute("toastMessage", "Error adding student: " + ex.getMessage());
				session.setAttribute("toastType", "error");
				response.sendRedirect("hostalite-form.jsp");
				return;
			}
		}
		// ==========================================================
		// =================== DAY SCHOLAR ==========================
		// ==========================================================
		else {

			DayScholar d1 = new DayScholar();
			d1.setPercentage(percentage);

			try {
				// Username validation
				if (!CheckStudent.isUserExist(username)) {
					throw new UsernameExistException("Username '" + username + "' already exists! Please choose another.");
				}
				d1.setUsername(username);

				// Name validation
				if (!ExceptionMethods.countWhitespaces(name)) {
					throw new FullNameException("Name must contain at least first and last name");
				}
				d1.setSname(name);

				// State validation
				if (!Location.STATE_CITY_MAP.containsKey(state)) {
					throw new StateNotExistException("State '" + state + "' doesn't exist in our database");
				}
				d1.setState(state);

				List<String> cities = Location.STATE_CITY_MAP.get(state);
				if (!cities.contains(city)) {
					throw new CityNotExistException("City '" + city + "' doesn't belong to " + state);
				}
				d1.setCity(city);

				d1.setCourse(course);
				d1.setDayScholar(true);
				
				// Insert into database (void method)
				InsertStudent.addStudent(d1);
				
				// Success - set toast message
				session.setAttribute("toastMessage", name + " added successfully as Day Scholar!");
				session.setAttribute("toastType", "success");
				clearSession(session);
				response.sendRedirect("home-page2.jsp");
				return;

			} catch (StateNotExistException ex) {
				session.setAttribute("toastMessage", ex.getMessage());
				session.setAttribute("toastType", "error");
				response.sendRedirect("dayscholar-form.jsp");
				return;
			} catch (IncorrectUsernameException ex) {
				session.setAttribute("toastMessage", ex.getMessage());
				session.setAttribute("toastType", "error");
				response.sendRedirect("dayscholar-form.jsp");
				return;
			} catch (UsernameExistException ex) {
				session.setAttribute("toastMessage", ex.getMessage());
				session.setAttribute("toastType", "error");
				response.sendRedirect("dayscholar-form.jsp");
				return;
			} catch (FullNameException ex) {
				session.setAttribute("toastMessage", ex.getMessage());
				session.setAttribute("toastType", "error");
				response.sendRedirect("dayscholar-form.jsp");
				return;
			} catch (CityNotExistException ex) {
				session.setAttribute("toastMessage", ex.getMessage());
				session.setAttribute("toastType", "error");
				response.sendRedirect("dayscholar-form.jsp");
				return;
			} catch (Exception ex) {
				session.setAttribute("toastMessage", "Error adding student: " + ex.getMessage());
				session.setAttribute("toastType", "error");
				response.sendRedirect("dayscholar-form.jsp");
				return;
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	// ---------------- CLEAR SESSION METHOD ----------------
	private void clearSession(HttpSession session) {
		session.removeAttribute("sname");
		session.removeAttribute("username");
		session.removeAttribute("state");
		session.removeAttribute("city");
		session.removeAttribute("course");
		// Don't remove toast attributes here - they're needed for display
	}
}