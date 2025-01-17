<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student List</title>
    <style>
        body{
            background-color: #F9F6EE;
        }
        .header{
            background-color: #0c2542;
            width: 18%;
            height: 100vh;
            margin-left: -8px;
            margin-top: -8px;
            margin-bottom: -8px;
            color: white;
        }
        .dashboard{
            color: white;
            text-decoration: none;
            display: flex;
            padding: 10px;
            text-align: center;
            margin-left: 50px;
            font-size: large;
            opacity: 0.7;
            position: absolute;
            margin-top: 100px;
        }
        .header .a{
            color: white;
            text-decoration: none;
            display: flex;
            padding: 10px;
            text-align: center;
            margin-left: 50px;
            font-size: large;
            opacity: 0.7;
        }
        .logout-btn{
            background-color: red;
            color: white;
            border: none;
            padding: 10px;
            width: 50%;
            font-size: medium;
            cursor: pointer;
            margin-top: 400px;
            margin-left: 25%;
            border-radius: 10px;
        }
        .right-part{
            float:right;
            margin-top: -400px;
            margin-right: 15%;
                    }
                    .header img{
                        width: 25px;
                        height: 25px;
                        margin-right: 10px;

                    }
                    .dashboard-img{
                        position: absolute;
                        margin-top: 105px;
                        margin-left: 25px;
                        opacity: 0.7;
                    }
                    .addstudent-img{
                        position: absolute;
                        margin-top: 178px;
                        margin-left: 25px;
                        opacity: 0.7;
                    }
                    .studentlist-img{
                        position: absolute;
                        margin-top: 228px;
                        margin-left: 25px;
                        opacity: 0.7;
                    }
                    .updatestudent-img{
                        position: absolute;
                        margin-top: 279px;
                        margin-left: 25px;
                        opacity: 0.7;
                    }
                    .deletestudent-img{
                        position: absolute;
                        margin-top: 329px;
                        margin-left: 25px;
                        opacity: 0.7;
                    }
        table {
                  width: 100%;
                  border-collapse: collapse;
                }
                th, td {
                  border: 1px solid #ddd;
                  padding: 8px;
                }
                th {
                  background-color: #9E9F9E;
                  text-align: left;
                }
                td{
                background-color: white;
                }
        .update-btn{
                     background-color: blue;
                     border: none;
                     color: white;
                     text-align: center;
                     text-decoration: none;
                     margin: 4px 2px;
                     cursor: pointer;
                     border-radius: 4px;
        }
    </style>
</head>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.Student" %>
<body>
<div class="header">
        <img src="data-report.png" class="dashboard-img"/><a href="Dashboard.jsp"  class="dashboard">Dashboard</a>
        <img src="addstudent.png" class="addstudent-img"/><a href="addstudent" class="a" style="position: absolute; margin-top: 170px;">Add Student</a>
        <img src="studentlist.png" class="studentlist-img"/><a href="studentlist" class="a" style="position: absolute; margin-top: 220px;">Student List</a>
        <img src="update.png" class="updatestudent-img"/><a href="updatestudent" class="a" style="position: absolute; margin-top: 270px;">Update Student</a>
        <img src="deletestudent.png" class="deletestudent-img"/><a href="deletestudent" class="a" style="position: absolute; margin-top: 320px;">Delete Student</a>
        <form action="logout" method="post">
        <input type="submit" value="Logout" class="logout-btn">

        </form>
    </div>
    <div class="right-part">
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
            <input type="hidden" name="name" value="<%= student.getName() %>">
            <input type="hidden" name="phone" value="<%= student.getPhone() %>">
            <input type="hidden" name="course" value="<%= student.getCourse() %>">
            <input type="hidden" name="year_of_study" value="<%= student.getYearOfStudy() %>">
            <input type="submit" value="update" class="update-btn"></form></td>
        </tr>
        <%
                }
            }
        %>
    </table>
    </div>
</body>
</html>