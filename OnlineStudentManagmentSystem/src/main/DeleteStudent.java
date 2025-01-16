package main;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
@WebServlet("/deletestudent")
public class DeleteStudent extends HttpServlet {
    private static final String url = "jdbc:postgresql://localhost:5432/StudentManagmentSystem";
    private static final String username = "postgres";
    private static final String password = "priyanshu";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        String query = "select * from students";
        try(Connection connection = DriverManager.getConnection(url,username,password); PreparedStatement preparedStatement = connection.prepareStatement(query)){
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
            requestDispatcher.forward(req,resp);

        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
//        System.out.println(email);
        String query = "DELETE FROM students WHERE email = ?";
        try(Connection connection = DriverManager.getConnection(url,username,password); PrintWriter printWriter = resp.getWriter(); PreparedStatement preparedStatement = connection.prepareStatement(query)){
            preparedStatement.setString(1,email);
            int result = preparedStatement.executeUpdate();
            if(result !=0){
                resp.setContentType("text/html");
                printWriter.println("<h3>Data Deleted Successfully.</h3>");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("Dashboard.jsp");
                requestDispatcher.include(req,resp);
            }
            else {
                resp.setContentType("text/html");
                printWriter.println("<h3>Data not Found..</h3>");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("Dashboard.jsp");
                requestDispatcher.include(req,resp);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
