package main;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


@WebServlet("/updatestudentform")
public class UpdateStudentForm extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            resp.sendRedirect("login.jsp");
        }

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String course = req.getParameter("course");
        int year_of_study = Integer.parseInt(req.getParameter("year_of_study"));
        String currentEmail = req.getParameter("currentEmail"); // Assume this is the original email

        String selectquery = "SELECT COUNT(*) FROM students WHERE email = ? AND email != ?";
        String updatequery = "UPDATE students SET name = ?, email = ?, phone = ?, course = ?, year_of_study = ? WHERE email = ?";

        try (Connection dbconnection = DbConnection.getConnection();
             PrintWriter printWriter = resp.getWriter()) {

            try (PreparedStatement selectstatement = dbconnection.prepareStatement(selectquery)) {
                selectstatement.setString(1, email);
                selectstatement.setString(2, currentEmail);
                ResultSet resultSet = selectstatement.executeQuery();
                if (resultSet.next() && resultSet.getInt(1) > 0) {
                    resp.setContentType("text/html");
                    req.setAttribute("email_exists","Email already Exists.");
                    RequestDispatcher requestDispatcher = req.getRequestDispatcher("UpdateStudentForm.jsp");
                    requestDispatcher.include(req, resp);
                    return;
                }
            }
            try (PreparedStatement updatestatement = dbconnection.prepareStatement(updatequery)) {
                updatestatement.setString(1, name);
                updatestatement.setString(2, email);
                updatestatement.setString(3, phone);
                updatestatement.setString(4, course);
                updatestatement.setInt(5, year_of_study);
                updatestatement.setString(6, currentEmail);
                int result = updatestatement.executeUpdate();

                if (result > 0) {
                    resp.setContentType("text/html");
                    session.setAttribute("updated","Data Updated Successfully.");
                    RequestDispatcher requestDispatcher = req.getRequestDispatcher("Dashboard.jsp");
                    requestDispatcher.include(req, resp);
                } else {
                    resp.setContentType("text/html");
                    printWriter.println("<h3>Failed to update data. Please try again.</h3>");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
