<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Transactions - Library Management System</title>
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
            background: #e67e22;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            margin: 0 5px;
        }
        .btn:hover {
            background: #d35400;
        }
        .btn-return {
            background: #27ae60;
        }
        .btn-return:hover {
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
            background-color: #e67e22;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .status-issued {
            background: #f39c12;
            color: white;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 0.8rem;
        }
        .status-returned {
            background: #27ae60;
            color: white;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 0.8rem;
        }
        .fine {
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
        .no-transactions {
            text-align: center;
            padding: 40px;
            color: #7f8c8d;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📋 All Transactions</h1>
            <div>
                <a href="issueBook" class="btn">📖 Issue Book</a>
                <a href="returnBook" class="btn btn-return">↩️ Return Book</a>
            </div>
        </div>
        
        <div class="stats">
            <strong>Active Transactions: ${activeTransactions}</strong> | 
            <a href="home" class="btn" style="background: #7f8c8d;">🏠 Home</a>
        </div>

        <c:if test="${not empty message}">
            <div style="background: #d4edda; color: #155724; padding: 10px; border-radius: 5px; margin-bottom: 20px;">
                ✅ ${message}
            </div>
        </c:if>

        <c:if test="${not empty transactions}">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Book</th>
                        <th>Member</th>
                        <th>Issue Date</th>
                        <th>Due Date</th>
                        <th>Return Date</th>
                        <th>Fine</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="transaction" items="${transactions}">
                        <tr>
                            <td>${transaction.transactionId}</td>
                            <td><strong>${transaction.book.title}</strong></td>
                            <td>${transaction.member.name}</td>
                            <td>${transaction.issueDate}</td>
                            <td>${transaction.dueDate}</td>
                            <td>
                                <c:if test="${not empty transaction.returnDate}">
                                    ${transaction.returnDate}
                                </c:if>
                                <c:if test="${empty transaction.returnDate}">
                                    -
                                </c:if>
                            </td>
                            <td class="fine">
                                <c:if test="${transaction.fineAmount > 0}">
                                    ₹${transaction.fineAmount}
                                </c:if>
                                <c:if test="${transaction.fineAmount == 0}">
                                    -
                                </c:if>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${transaction.status == 'ISSUED'}">
                                        <span class="status-issued">ISSUED</span>
                                    </c:when>
                                    <c:when test="${transaction.status == 'RETURNED'}">
                                        <span class="status-returned">RETURNED</span>
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        
        <c:if test="${empty transactions}">
            <div class="no-transactions">
                <h3>No transactions found!</h3>
                <p>Start by issuing some books to members.</p>
                <a href="issueBook" class="btn">Issue First Book</a>
            </div>
        </c:if>
    </div>
</body>
</html>