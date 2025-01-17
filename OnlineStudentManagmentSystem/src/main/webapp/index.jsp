<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Login</title>
    <style>
        body {
            background-color: #F9F6EE;
        }
        .login-image {
            height: 87%;
            width: 87%;
            margin-left: 50px;
        }
        .left-container {
            float: right;
            width: 50%;
            margin-top: -8%;
        }
        .login-form {
            width: 30%;
            background-color: white;
            margin-left: 10%;
            margin-top: 8%;
            height: auto;
            border: solid 1px #E0E0E0;
            border-radius: 30px 30px 30px 30px;
            padding: 20px;
        }
        input[type=text], input[type=password] {
            width: 80%;
            margin-left: 10%;
            margin-top: 10%;
            background-color: #D3D3D3;
            height: 40px;
            border: solid 1px #E0E0E0;
            border-radius: 20px;
        }
        input[type=submit] {
            width: 30%;
            margin-left: 35%;
            margin-top: 10%;
            height: 30px;
            border: solid 1px #E0E0E0;
            border-radius: 20px;
            background-color: #4CAF50;
            color: white;
        }
        .error-message {
            color: red;
            text-align: center;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="left-container">
    <img src="login.png" class="login-image"/>
</div>
<div>
    <form action="login" method="post" class="login-form">
        <%
            String error = (String) session.getAttribute("credentials");
            if (error != null) {
        %>
        <div class="error-message"><%= error %></div>
        <%
            }
        %>
        <input type="text" placeholder=" Enter Username" name="username">
        <input type="password" placeholder=" Enter your Password" name="password">
        <input type="submit" value="Login"><br>
    </form>
</div>
</body>
</html>
