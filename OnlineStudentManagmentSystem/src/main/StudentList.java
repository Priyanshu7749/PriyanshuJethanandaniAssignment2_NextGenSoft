package main;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.awt.dnd.DragGestureEvent;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/studentlist")
public class StudentList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            resp.sendRedirect("login.jsp");
        }
        PrintWriter printWriter = resp.getWriter();

        try(Connection dbconnection = DbConnection.getConnection();
            Statement statement = dbconnection.createStatement(); ){
            String query = "SELECT * FROM students";


            ResultSet resultSet = statement.executeQuery(query);
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
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/StudentList.jsp");
            requestDispatcher.include(req,resp);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
