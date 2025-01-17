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
@WebServlet("/updatestudent")
public class UpdateStudent extends HttpServlet {
    private static final String url = "jdbc:postgresql://localhost:5432/StudentManagmentSystem";
    private static final String username = "postgres";
    private static final String password = "priyanshu";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            resp.sendRedirect("login.jsp");

        }
        try{
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }

        String query = "SELECT * FROM students";
        try(Connection connection = DriverManager.getConnection(url,username,password);  PreparedStatement preparedStatement = connection.prepareStatement(query); ){

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
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/UpdateStudent.jsp");
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
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String course = req.getParameter("course");
        int year_of_study = Integer.parseInt(req.getParameter("year_of_study"));

//        HttpSession session = req.getSession();
        session.setAttribute("name",name);
        session.setAttribute("email",email);
        session.setAttribute("phone",phone);
        session.setAttribute("course",course);
        session.setAttribute("year_of_study",year_of_study);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("UpdateStudentForm.jsp");
        requestDispatcher.include(req,resp);
    }
}
