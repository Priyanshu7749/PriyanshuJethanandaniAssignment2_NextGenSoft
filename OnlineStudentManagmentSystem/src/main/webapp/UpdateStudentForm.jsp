<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Form</title>
</head>
<body>

<%
    String name = (String) session.getAttribute("name");
    String email = (String) session.getAttribute("email");
    String phone = (String) session.getAttribute("phone");
    String course = (String) session.getAttribute("course");
    int year_of_study = (int) session.getAttribute("year_of_study");
   %>
<form action="updatestudentform" method="post">
    <input type="text" placeholder="Enter Name" name="name" value="<%= name%>" required>
    <input type="email" placeholder="Enter Email" name="email" value="<%= email %>" required>
    <input type="text"  placeholder="Enter Phone Number" name="phone" value="<%= phone %>" required>
    <input type="text" placeholder="Course Name" name="course" value="<%= course %>" required>
    <input type="text"  placeholder="Year of Study" name="year_of_study" value = "<%= year_of_study %>" required>
    <input type="submit" value="Submit">
</form>
</body>
</html>