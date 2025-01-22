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
@WebServlet("/login")
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        try(Connection dbconnection = DbConnection.getConnection();){
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            PrintWriter printWriter = resp.getWriter();
            String query = String.format("SELECT * FROM admin WHERE username=? AND password=?",username,password);
            PreparedStatement preparedStatement = dbconnection.prepareStatement(query);
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,password);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                session.setAttribute("username",username);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("Dashboard.jsp");
                requestDispatcher.forward(req,resp);
            }
            else{
                resp.setContentType("text/html");
                session.setAttribute("credentials","Enter Proper Credentials.");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
                requestDispatcher.include(req,resp);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
