<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Return Book - Library Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
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
        .error {
            background: #f8d7da;
            color: #721c24;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .transaction-info {
            background: #d1ecf1;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>↩️ Return Book</h1>
        
        <c:if test="${not empty error}">
            <div class="error">❌ ${error}</div>
        </c:if>

        <form action="returnBook" method="post">
            <div class="form-group">
                <label for="transactionId">Select Issued Book to Return:</label>
                <select name="transactionId" required>
                    <option value="">-- Select an issued book --</option>
                    <c:forEach var="transaction" items="${issuedTransactions}">
                        <option value="${transaction.transactionId}">
                            ${transaction.book.title} - Issued to ${transaction.member.name} 
                            (Due: ${transaction.dueDate})
                        </option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="form-actions">
                <button type="submit" class="btn">✅ Return Book</button>
                <a href="transactions" class="btn btn-cancel">📋 View Transactions</a>
                <a href="home" class="btn btn-cancel">🏠 Home</a>
            </div>
        </form>
        
        <c:if test="${empty issuedTransactions}">
            <div style="text-align: center; padding: 40px; color: #7f8c8d;">
                <h3>No books currently issued!</h3>
                <p>All books are available in the library.</p>
                <a href="issueBook" class="btn">Issue a Book</a>
            </div>
        </c:if>
    </div>
</body>
</html>