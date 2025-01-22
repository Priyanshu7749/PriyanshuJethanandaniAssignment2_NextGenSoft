<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard</title>
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
        .welcome{
            text-align: center;
            font-size: xx-large;
            margin-right: 700px;
            width: 100%;
        }
        .right-part{
            float:right;
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
        .add-student{
            position: absolute;
            align-text: center;
            margin-top: 10px;
            margin-left: 285px;
            font-size: xx-large;
            color: #4CAF50;
        }
        .delete_student{
            position: absolute;
            align-text: center;
            margin-top: 10px;
            margin-left: 350px;
            font-size: xx-large;
            color: red;
        }
        .delete_student img{
            width: 30px;
            height: 30px;
        }
        .update_student{
            position: absolute;
            align-text: center;
            margin-top: 10px;
            margin-left: 285px;
            font-size: xx-large;
            color: #4CAF50;
        }
    </style>
</head>
<body>
    <%
        String username = (String) session.getAttribute("username");
    %>
    <div class="right-part">
    <h3 class="welcome">Welcome: <%= username%> </h3>

    <%
        String addsuccessfull = (String) session.getAttribute("inserted");
        if(addsuccessfull != null){
    %>
    <div class="add-student"><%= addsuccessfull %></div>
    <%
        session.removeAttribute("inserted");
        }
    %>

    <%
            String delete_student = (String) session.getAttribute("deleted");
            if(delete_student != null){
        %>
        <div class="delete_student"><%= delete_student %></div>
        <%
            session.removeAttribute("deleted");
            }
        %>
        <%
            String update_student = (String) session.getAttribute("updated");
            if(update_student != null){
        %>
        <div class="update_student"><%= update_student %></div>
        <%
            session.removeAttribute("updated");
            }
        %>
    </div>


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
</body>
</html>