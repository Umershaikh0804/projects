<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LibZone</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            padding: 40px;
            max-width: 900px;
            width: 100%;
            text-align: center;
        }
        
        .header {
            margin-bottom: 30px;
        }
        
        .header h1 {
            color: #2c3e50;
            font-size: 2.5rem;
            margin-bottom: 10px;
        }
        
        .header p {
            color: #7f8c8d;
            font-size: 1.2rem;
        }
        
        .stats {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin: 30px 0;
        }
        
        .stat-card {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            border-left: 4px solid #3498db;
            text-align: center;
            min-width: 150px;
        }
        
        .stat-card h3 {
            color: #2c3e50;
            font-size: 2rem;
            margin-bottom: 5px;
        }
        
        .stat-card p {
            color: #7f8c8d;
            font-size: 0.9rem;
        }
        
        .menu {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-top: 30px;
        }
        
        .menu-item {
            background: #3498db;
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
        }
        
        .menu-item:hover {
            background: #2980b9;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .menu-icon {
            font-size: 2rem;
        }
        
        .footer {
            margin-top: 30px;
            color: #7f8c8d;
            font-size: 0.9rem;
        }
        
        @media (max-width: 768px) {
            .menu {
                grid-template-columns: 1fr;
            }
            
            .stats {
                flex-direction: column;
                gap: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📚 LibZone </h1>
            <p>${tagline}</p>
        </div>
        
        <div class="stats">
            <div class="stat-card">
                <h3>${totalBooks}</h3>
                <p>Total Books</p>
            </div>
            <div class="stat-card">
                <h3>${totalMembers}</h3>
                <p>Total Members</p>
            </div>
        </div>
        
        <div class="menu">
            <a href="books" class="menu-item">
                <span class="menu-icon">📖</span>
                <span>View All Books</span>
            </a>
            <a href="members" class="menu-item">
                <span class="menu-icon">👥</span>
                <span>View All Members</span>
            </a>
            <a href="addBook" class="menu-item">
                <span class="menu-icon">➕</span>
                <span>Add New Book</span>
            </a>
            <a href="addMember" class="menu-item">
                <span class="menu-icon">👤</span>
                <span>Add New Member</span>
            </a>
            <a href="issueBook" class="menu-item">
                <span class="menu-icon">📋</span>
                <span>Issue Book</span>
            </a>
            <a href="returnBook" class="menu-item">
                <span class="menu-icon">↩️</span>
                <span>Return Book</span>
            </a>
        </div>
        
        <div class="footer">
            &copy; 2025 Library Management System. All rights reserved.
        </div>
    </div>
</body>
</html>