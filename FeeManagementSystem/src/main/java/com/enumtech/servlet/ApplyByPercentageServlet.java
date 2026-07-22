package com.enumtech.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.enumtech.dao.GetStudent;
import com.enumtech.entity.Student;
import com.enumtech.util.ExceptionMethods;
import com.exception.ParentFeeException;

@WebServlet("/ApplyByPercentageServlet")
public class ApplyByPercentageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int roll = Integer.parseInt(request.getParameter("roll"));
            double percent = Double.parseDouble(request.getParameter("percentage"));

            if (percent != 10 && percent != 20) {
                request.setAttribute("error", "Invalid Discount Selection!");
                request.getRequestDispatcher("discount-apply.jsp")
                        .forward(request, response);
                return;
            }

            Student student = GetStudent.getStudentById(roll);

            if (student == null) {
                request.setAttribute("error", "Student not found!");
                request.getRequestDispatcher("discount-apply.jsp")
                        .forward(request, response);
                return;
            }

            // ✅ VALIDATION
            ExceptionMethods.checkFeeStatusAndPercentage(student, percent);

            // ✅ APPLY DISCOUNT
            student.addDiscount(percent, roll);

            request.setAttribute("student", student);
            request.setAttribute("message",
                percent + "% Discount Applied Successfully on Student: "
                + student.getSname());

        } catch (ParentFeeException e) {
            request.setAttribute("error", e.getMessage());
        } catch (Exception e) {
            request.setAttribute("error", "Invalid Input!");
        }

        request.getRequestDispatcher("discount-apply.jsp")
                .forward(request, response);
    }
}