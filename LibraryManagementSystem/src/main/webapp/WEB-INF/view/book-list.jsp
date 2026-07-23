<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Books - Library Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 1200px;
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
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .btn {
            background: #3498db;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }
        .btn:hover {
            background: #2980b9;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #3498db;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .available {
            color: #27ae60;
            font-weight: bold;
        }
        .not-available {
            color: #e74c3c;
            font-weight: bold;
        }
        .stats {
            background: #ecf0f1;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📚 All Books</h1>
            <a href="addBook" class="btn">➕ Add New Book</a>
        </div>
        
        <div class="stats">
            <strong>Total Books: ${totalBooks}</strong> | 
            <a href="home" class="btn" style="background: #7f8c8d;">🏠 Home</a>
        </div>

        <c:if test="${not empty message}">
            <div style="background: #d4edda; color: #155724; padding: 10px; border-radius: 5px; margin-bottom: 20px;">
                ✅ ${message}
            </div>
        </c:if>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>ISBN</th>
                    <th>Status</th>
                    <th>Added Date</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="book" items="${books}">
                    <tr>
                        <td>${book.bookId}</td>
                        <td><strong>${book.title}</strong></td>
                        <td>${book.author}</td>
                        <td>${book.isbn}</td>
                        <td>
                            <c:choose>
                                <c:when test="${book.isAvailable}">
                                    <span class="available">✅ Available</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="not-available">❌ Issued</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${book.addedDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <c:if test="${empty books}">
            <div style="text-align: center; padding: 40px; color: #7f8c8d;">
                <h3>No books found in the library!</h3>
                <p>Start by adding some books to the library.</p>
                <a href="addBook" class="btn">Add First Book</a>
            </div>
        </c:if>
    </div>
</body>
</html>