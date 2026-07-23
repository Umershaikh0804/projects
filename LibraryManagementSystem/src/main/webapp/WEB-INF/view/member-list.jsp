<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Members - Library Management System</title>
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
            background: #27ae60;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }
        .btn:hover {
            background: #219653;
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
            background-color: #27ae60;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .stats {
            background: #ecf0f1;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
        }
        .books-issued {
            background: #3498db;
            color: white;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 0.8rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>👥 All Members</h1>
            <a href="addMember" class="btn">➕ Add New Member</a>
        </div>
        
        <div class="stats">
            <strong>Total Members: ${totalMembers}</strong> | 
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
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Join Date</th>
                    <th>Books Issued</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="member" items="${members}">
                    <tr>
                        <td>${member.memberId}</td>
                        <td><strong>${member.name}</strong></td>
                        <td>${member.email}</td>
                        <td>${member.phone}</td>
                        <td>${member.joinDate}</td>
                        <td>
                            <span class="books-issued">${member.booksIssued} books</span>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <c:if test="${empty members}">
            <div style="text-align: center; padding: 40px; color: #7f8c8d;">
                <h3>No members registered!</h3>
                <p>Start by adding some members to the library.</p>
                <a href="addMember" class="btn">Add First Member</a>
            </div>
        </c:if>
    </div>
</body>
</html>