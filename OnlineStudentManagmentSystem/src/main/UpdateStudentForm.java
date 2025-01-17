package main;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/updatestudentform")
public class UpdateStudentForm extends HttpServlet {
    private static final String url = "jdbc:postgresql://localhost:5432/StudentManagmentSystem";
    private static final String username = "postgres";
    private static final String password = "priyanshu";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            Class.forName("org.postgresql.Driver");
        } catch(ClassNotFoundException e){
            e.printStackTrace();
        }

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String course = req.getParameter("course");
        int year_of_study = Integer.parseInt(req.getParameter("year_of_study"));

        String query = "UPDATE students SET name =?, phone=?, course=?, year_of_study=? WHERE email = ?";
        try(Connection connection = DriverManager.getConnection(url,username,password); PrintWriter printWriter = resp.getWriter(); PreparedStatement preparedStatement = connection.prepareStatement(query)){
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,phone);
            preparedStatement.setString(3,course);
            preparedStatement.setInt(4,year_of_study);
            preparedStatement.setString(5,email);
            int result = preparedStatement.executeUpdate();
            if(result>0){
                resp.setContentType("text/html");
                printWriter.println("<h3>Data Updates Successfully</h3>");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("Dashboard.jsp");
                requestDispatcher.include(req,resp);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
