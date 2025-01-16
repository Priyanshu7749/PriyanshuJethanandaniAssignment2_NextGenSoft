<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student List</title>
</head>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.Student" %>
<body>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Course</th>
            <th>Year of Study</th>
            <th>Action</th>
        </tr>
        <%
            ArrayList<Student> students = (ArrayList<Student>) request.getAttribute("students");
            if (students != null) {
                for (Student student : students) {
        %>
        <tr>
            <td><%= student.getName() %></td>
            <td><%= student.getEmail() %></td>
            <td><%= student.getPhone() %></td>
            <td><%= student.getCourse() %></td>
            <td><%= student.getYearOfStudy() %></td>
            <td><form action="updatestudent" method="post">
            <input type="hidden" name ="email" value="<%= student.getEmail()%>">
            <input type="submit" value="update"></form></td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>