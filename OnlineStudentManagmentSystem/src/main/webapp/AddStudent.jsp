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
        margin-top: -480px;
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
        .wrapper {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    margin-left: 20%;
                }

                .form-container {
                    background: #ffffff;
                    padding: 10px 20px;
                    border-radius: 10px;
                    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
                    text-align: center;
                    width: 100%;
                    max-width: 400px;
                    margin-top: -15px;
                }
                .form-container p{
                    text-align: left;
                    margin-bottom: 2px;
                }
                .form-container h2 {
                    margin-bottom: 10px;
                    font-size: 20px;
                    color: #333;
                    margin-top: 3px;
                }
            .form-container label {
                display: block;
                text-align: left;
                font-size: 12px;
                font-weight: bold;
                color: #333;
                margin-bottom: 3px;
            }
                .form-container input[type="text"],
                .form-container input[type="email"],
                .form-container input[type="submit"] {
                    width: 80%;
                    padding: 8px 10px;
                    margin: 5px 0 10px;
                    border: 1px solid #ddd;
                    border-radius: 5px;
                    font-size: 14px;
                }

                .form-container input[type="text"]:focus,
                .form-container input[type="email"]:focus {
                    border-color: #2575fc;
                    outline: none;
                    box-shadow: 0 0 3px rgba(37, 117, 252, 0.5);
                }

                .form-container input[type="submit"] {
                    background: linear-gradient(to right, #6a11cb, #2575fc);
                    color: #fff;
                    border: none;
                    cursor: pointer;
                    font-weight: bold;
                    font-size: 14px;
                    padding: 8px;
                    transition: all 0.3s ease;
                    width: 50%;
                }
            .email_exists{
                color: red;
                align-text: center;
                font-size: large;
            }
     </style>
</head>
<body>

<script>
function validationForm(){
    var name = document.forms["addform"]["name"].value;
    if (name == ""){
        alert("Name is required");
        return false;
    }
</script>
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
    <div class="wrapper">
            <div class="form-container">
                <h2><u>Add Student Details</u></h2>
                <form action="addstudent" method="post" name="addform" onsubmit="return validationForm()">
                    <p>(<span style="color: red; position: absolute; margin-top: 3px;">*</span><span style="position: absolute; margin-left: 10px;">means field required)</span></p>
                    <label for="name">Name:<span style="color: red;">*</span></label>
                    <input type="text" placeholder="Enter Name" name="name" required>
                    <label for="name">Email:<span style="color: red;">*</span></label>
                    <input type="email" placeholder="Enter Email" name="email" required>
                    <label for="name">Phone:<span style="color: red;">*</span></label>
                    <input type="text" oninput="this.value = this.value.replace(/[^0-9]/g, '')" maxlength="10" placeholder="Enter Phone Number" name="phone" required>
                    <label for="name">Course:<span style="color: red;">*</span></label>
                    <input type="text" placeholder="Course Name" name="course" required>
                    <label for="name">Year of Study:<span style="color: red;">*</span></label>
                    <input type="text" oninput="this.value = this.value.replace(/[^0-9]/g, '')" placeholder="Year of Study" name="year_of_study" required>
                    <input type="submit" value="Submit">
                    <%
                        String email_exist = (String) request.getAttribute("email_exists");
                        if(email_exist != null){
                    %>
                    <div class="email_exists"><%= email_exist %></div>
                    <%
                        }
                    %>
                </form>
            </div>
        </div>
    </div>
</body>
</html>