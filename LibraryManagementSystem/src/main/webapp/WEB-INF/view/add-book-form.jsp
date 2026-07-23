<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Book - Library Management System</title>
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
        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        input[type="text"]:focus {
            border-color: #3498db;
            outline: none;
        }
        .btn {
            background: #3498db;
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
            background: #2980b9;
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
        <h1>📖 Add New Book</h1>
        
        <form:form action="saveBook" method="post" modelAttribute="book">
            <div class="form-group">
                <label>Book ID:</label>
                <div class="auto-id">
                    Auto-generated: ${book.bookId}
                </div>
                <form:hidden path="bookId" />
            </div>
            
            <div class="form-group">
                <label for="title">Book Title:</label>
                <form:input path="title" placeholder="Enter book title" />
            </div>
            
            <div class="form-group">
                <label for="author">Author:</label>
                <form:input path="author" placeholder="Enter author name" />
            </div>
            
            <div class="form-group">
                <label for="isbn">ISBN:</label>
                <form:input path="isbn" placeholder="Enter ISBN number" />
            </div>
            
            <div class="form-actions">
                <button type="submit" class="btn">💾 Save Book</button>
                <a href="books" class="btn btn-cancel">❌ Cancel</a>
            </div>
        </form:form>
    </div>
</body>
</html>