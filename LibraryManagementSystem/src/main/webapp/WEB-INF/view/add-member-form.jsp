<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Member - Library Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #2c3e50;
        }
        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        input:focus {
            border-color: #27ae60;
            outline: none;
        }
        .btn {
            background: #27ae60;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-right: 10px;
        }
        .btn:hover {
            background: #219653;
        }
        .btn-cancel {
            background: #95a5a6;
            text-decoration: none;
            display: inline-block;
            padding: 12px 25px;
        }
        .btn-cancel:hover {
            background: #7f8c8d;
        }
        .form-actions {
            text-align: center;
            margin-top: 30px;
        }
        .auto-id {
            background: #ecf0f1;
            padding: 10px;
            border-radius: 5px;
            color: #7f8c8d;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>👤 Add New Member</h1>
        
        <form:form action="saveMember" method="post" modelAttribute="member">
            <div class="form-group">
                <label>Member ID:</label>
                <div class="auto-id">
                    Auto-generated: ${member.memberId}
                </div>
                <form:hidden path="memberId" />
            </div>
            
            <div class="form-group">
                <label for="name">Full Name:</label>
                <form:input path="name" placeholder="Enter member's full name" />
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <form:input path="email" type="email" placeholder="Enter email address" />
            </div>
            
            <div class="form-group">
                <label for="phone">Phone:</label>
                <form:input path="phone" placeholder="Enter phone number" />
            </div>
            
            <div class="form-actions">
                <button type="submit" class="btn">💾 Save Member</button>
                <a href="members" class="btn btn-cancel">❌ Cancel</a>
            </div>
        </form:form>
    </div>
</body>
</html>