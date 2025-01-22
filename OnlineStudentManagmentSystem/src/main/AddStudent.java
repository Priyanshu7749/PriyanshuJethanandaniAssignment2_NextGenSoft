package main;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Properties;

@WebServlet("/addstudent")
public class AddStudent extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            resp.sendRedirect("login.jsp");
        }

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/AddStudent.jsp");
            requestDispatcher.include(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            resp.sendRedirect("login.jsp");
        }
        PrintWriter printWriter = resp.getWriter();

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String course = req.getParameter("course");
        int year_of_study = Integer.parseInt(req.getParameter("year_of_study"));
        String query = String.format("INSERT INTO students(name,email,phone,course,year_of_study) VALUES(?,?,?,?,?)");
        try(Connection dbConnection = DbConnection.getConnection();
            PreparedStatement preparedStatement = dbConnection.prepareStatement(query)){

            preparedStatement.setString(1,name);
            preparedStatement.setString(2,email);
            preparedStatement.setString(3,phone);
            preparedStatement.setString(4,course);
            preparedStatement.setInt(5,year_of_study);

            int result = preparedStatement.executeUpdate();
            if(result>0){
                resp.setContentType("text/html");
                session.setAttribute("inserted","Student Added Successfully.");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("Dashboard.jsp");
                requestDispatcher.include(req,resp);
            }
        }catch (SQLException e){
            if(e.getErrorCode() == 0){
                req.setAttribute("email_exists","Email already Exists.");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/AddStudent.jsp");
                requestDispatcher.include(req,resp);
            }
            else{
                e.printStackTrace();
            }
        }
    }
}
