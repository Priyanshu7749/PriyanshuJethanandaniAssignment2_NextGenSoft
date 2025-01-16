package main;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
@WebServlet("/addstudent")
public class AddStudent extends HttpServlet {
    private static final String url = "jdbc:postgresql://localhost:5432/StudentManagmentSystem";
    private static final String username = "postgres";
    private static final String password = "priyanshu";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter printWriter = resp.getWriter();
        try{
            Class.forName("org.postgresql.Driver");
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }


        try(Connection connection = DriverManager.getConnection(url,username,password)){
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String course = req.getParameter("course");
            int year_of_study = Integer.parseInt(req.getParameter("year_of_study"));

            String query = String.format("INSERT INTO students(name,email,phone,course,year_of_study) VALUES(?,?,?,?,?)");
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,email);
            preparedStatement.setString(3,phone);
            preparedStatement.setString(4,course);
            preparedStatement.setInt(5,year_of_study);

            int result = preparedStatement.executeUpdate();
            if(result>0){
                printWriter.println("Inserted Successfully");
            }
            else {
                printWriter.println("There is some Issue.");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
