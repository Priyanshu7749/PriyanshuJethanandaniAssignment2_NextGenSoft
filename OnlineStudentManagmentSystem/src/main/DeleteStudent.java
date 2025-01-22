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
import java.util.ArrayList;
@WebServlet("/deletestudent")
public class DeleteStudent extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            resp.sendRedirect("login.jsp");
        }

        String query = "select * from students";
        try(Connection dbconnection = DbConnection.getConnection();
            PreparedStatement preparedStatement = dbconnection.prepareStatement(query)){
            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<Student> students = new ArrayList<>();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");
                String course = resultSet.getString("course");
                int year_of_study = resultSet.getInt("year_of_study");

                Student student = new Student(name,email,phone,course,year_of_study);
                students.add(student);
            }
            req.setAttribute("students",students);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/DeleteStudent.jsp");
            requestDispatcher.include(req,resp);

        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            resp.sendRedirect("login.jsp");
        }
        String email = req.getParameter("email");
        String query = "DELETE FROM students WHERE email = ?";
        try(Connection dbconnection = DbConnection.getConnection();
            PrintWriter printWriter = resp.getWriter(); PreparedStatement preparedStatement = dbconnection.prepareStatement(query)){
            preparedStatement.setString(1,email);
            int result = preparedStatement.executeUpdate();
            if(result !=0){
                resp.setContentType("text/html");
                session.setAttribute("deleted","Student Data Deleted.");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("Dashboard.jsp");
                requestDispatcher.include(req,resp);
            }
            else {
                resp.setContentType("text/html");
                session.setAttribute("deleted","Data not Found.");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("Dashboard.jsp");
                requestDispatcher.include(req,resp);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
