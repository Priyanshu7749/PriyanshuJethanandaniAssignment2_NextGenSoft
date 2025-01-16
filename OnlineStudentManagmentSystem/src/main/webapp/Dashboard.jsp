<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard</title>
</head>
<body>
    <%
        String username = (String) session.getAttribute("username");
    %>
    <h3>Welcome: <%= username%> </h3>
    <a href="AddStudent.jsp">Add Student</a>
    <a href="studentlist">Student List</a>
    <a href="updatestudent">Update Student</a>
    <a href="DeleteStudent.jsp">Delete Student</a>
    <form action="logout" method="post">
    <input type="submit" value="logout">
    </form>
</body>
</html>