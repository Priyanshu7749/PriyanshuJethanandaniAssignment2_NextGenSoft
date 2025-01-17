<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Student</title>
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
     </style>
</head>
<body>
<div class="header">
    <img src="data-report.png" class="dashboard-img"/><a href="Dashboard.jsp"  class="dashboard">Dashboard</a>
    <img src="addstudent.png" class="addstudent-img"/><a href="AddStudent.jsp" class="a" style="position: absolute; margin-top: 170px;">Add Student</a>
    <img src="studentlist.png" class="studentlist-img"/><a href="studentlist" class="a" style="position: absolute; margin-top: 220px;">Student List</a>
    <img src="update.png" class="updatestudent-img"/><a href="updatestudent" class="a" style="position: absolute; margin-top: 270px;">Update Student</a>
    <img src="deletestudent.png" class="deletestudent-img"/><a href="deletestudent" class="a" style="position: absolute; margin-top: 320px;">Delete Student</a>
    <form action="logout" method="post">
    <input type="submit" value="Logout" class="logout-btn">

    </form>
    </div>
    <div class="right-part">
    <form action="addstudent" method="post">
        <input type="text" placeholder="Enter Name" name="name" required>
        <input type="email" placeholder="Enter Email" name="email" required>
        <input type="text"  placeholder="Enter Phone Number" name="phone" required>
        <input type="text" placeholder="Course Name" name="course" required>
        <input type="text"  placeholder="Year of Study" name="year_of_study" required>
        <input type="submit" value="Submit">
    </form>
    </div>
</body>
</html>