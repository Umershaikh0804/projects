<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Issue Book - Library Management System</title>
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
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        .btn {
            background: #e67e22;
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
            background: #d35400;
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
        .error {
            background: #f8d7da;
            color: #721c24;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📋 Issue Book</h1>
        
        <c:if test="${not empty error}">
            <div class="error">❌ ${error}</div>
        </c:if>

        <form action="issueBook" method="post">
            <div class="form-group">
                <label for="bookId">Select Book:</label>
                <select name="bookId" required>
                    <option value="">-- Select a Book --</option>
                    <c:forEach var="book" items="${availableBooks}">
                        <option value="${book.bookId}">
                            ${book.title} by ${book.author}
                        </option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="form-group">
                <label for="memberId">Select Member:</label>
                <select name="memberId" required>
                    <option value="">-- Select a Member --</option>
                    <c:forEach var="member" items="${allMembers}">
                        <option value="${member.memberId}">
                            ${member.name} (ID: ${member.memberId})
                        </option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="form-actions">
                <button type="submit" class="btn">✅ Issue Book</button>
                <a href="home" class="btn btn-cancel">🏠 Home</a>
            </div>
        </form>
        
        <c:if test="${empty availableBooks}">
            <div style="text-align: center; padding: 20px; color: #7f8c8d;">
                <p>❌ No books available for issuing!</p>
                <a href="books" class="btn" style="background: #3498db;">View Books</a>
            </div>
        </c:if>
    </div>
</body>
</html>