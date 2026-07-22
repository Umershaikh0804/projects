<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Home · Scholar & Hostalite</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
        }

        body {
            min-height: 100vh;
            background-color: #f2f5f9;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1.5rem;
            position: relative;
            overflow-x: hidden;
        }

        /* Background */
        body::before {
            content: "";
            position: fixed;
            inset: 0;
            background: url('https://images.unsplash.com/photo-1581291518633-83b4ebd1d83e?q=80&w=2070&auto=format&fit=crop') center/cover no-repeat;
            opacity: 0.18;
            pointer-events: none;
            z-index: 0;
        }

        /* Main Panel */
        .glass-panel {
            position: relative;
            z-index: 10;
            width: 100%;
            max-width: 1100px;
            background: rgba(255, 255, 255, 0.88);
            backdrop-filter: blur(10px);
            border-radius: 2.5rem;
            box-shadow: 0 25px 50px -15px rgba(0, 0, 0, 0.25);
            padding: 2.5rem;
        }

        /* Header */
        .welcome-header {
            margin-bottom: 2.5rem;
        }

        .title-section h1 {
            font-size: 2.5rem;
            font-weight: 700;
            background: linear-gradient(145deg, #1A2A3A, #2C3E50);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .title-section p {
            font-size: 1rem;
            color: #4a5c6e;
            margin-top: 0.4rem;
        }

        /* Toast Notification */
        .toast-notification {
            position: fixed;
            top: 30px;
            right: 30px;
            min-width: 320px;
            max-width: 400px;
            background: white;
            border-radius: 12px;
            padding: 16px 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            display: flex;
            align-items: center;
            gap: 12px;
            z-index: 9999;
            animation: slideIn 0.3s ease-out forwards;
            border-left: 5px solid;
        }

        @keyframes slideIn {
            from {
                transform: translateX(100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @keyframes slideOut {
            from {
                transform: translateX(0);
                opacity: 1;
            }
            to {
                transform: translateX(100%);
                opacity: 0;
            }
        }

        .toast-notification.success {
            border-left-color: #4CAF50;
            background: #f1f9f1;
        }

        .toast-notification.error {
            border-left-color: #f44336;
            background: #fef1f0;
        }

        .toast-icon {
            font-size: 24px;
        }

        .toast-icon.success {
            color: #4CAF50;
        }

        .toast-icon.error {
            color: #f44336;
        }

        .toast-content {
            flex: 1;
        }

        .toast-title {
            font-weight: 600;
            font-size: 16px;
            margin-bottom: 4px;
        }

        .toast-title.success {
            color: #2e7d32;
        }

        .toast-title.error {
            color: #c62828;
        }

        .toast-message {
            font-size: 14px;
            color: #555;
        }

        .toast-close {
            background: none;
            border: none;
            font-size: 18px;
            cursor: pointer;
            color: #999;
            padding: 0 5px;
        }

        .toast-close:hover {
            color: #333;
        }

        /* Main Grid */
        .operations-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.8rem;
            margin-bottom: 2.5rem;
        }

        .action-card {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 1.8rem;
            padding: 2rem 1.2rem;
            text-decoration: none;
            color: #1f2a36;
            transition: all 0.25s ease;
            border: 1px solid rgba(255, 220, 150, 0.7);
            box-shadow: 0 12px 25px -10px rgba(0, 0, 0, 0.15);
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .action-card:hover {
            transform: translateY(-6px);
            border-color: #f5c76b;
            box-shadow: 0 20px 35px -12px rgba(210, 170, 30, 0.25);
        }

        .icon-badge {
            width: 65px;
            height: 65px;
            background: #fff5d6;
            border-radius: 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.2rem;
            font-size: 2rem;
            color: #b47d28;
        }

        .action-card h3 {
            font-size: 1.4rem;
            margin-bottom: 0.4rem;
        }

        .sub-hint {
            font-size: 0.85rem;
            color: #5b6f83;
        }

        /* Add Student Special */
        .add-special {
            background: linear-gradient(135deg, #fffaf0, #fff8e7);
            border: 1px solid #ffda88;
        }

        .dropdown-micro {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        .dropdown-micro a {
            text-decoration: none;
            background: #2d3e54;
            padding: 0.5rem 1rem;
            border-radius: 30px;
            font-size: 0.85rem;
            font-weight: 600;
            color: white;
            transition: 0.2s;
        }

        .dropdown-micro a:hover {
            background: #f5b342;
            color: #1d2b38;
        }

        /* Compact Row */
        .row-compact {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 1.5rem;
        }

        .compact-card {
            background: rgba(255,255,255,0.85);
            padding: 1.5rem 1rem;
            border-radius: 1.5rem;
            text-decoration: none;
            color: #212e3c;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.4rem;
            border: 1px solid rgba(250, 215, 140, 0.6);
            transition: 0.2s;
            font-weight: 500;
        }

        .compact-card i {
            font-size: 2rem;
            color: #b78c3a;
        }

        .compact-card:hover {
            background: white;
            border-color: #f3c556;
            transform: scale(1.03);
        }

        @media (max-width: 650px) {
            .glass-panel { padding: 1.8rem; }
            .title-section h1 { font-size: 2rem; }
        }
    </style>
</head>

<body>

<!-- Toast Notification -->
<c:if test="${not empty sessionScope.toastMessage}">
    <div class="toast-notification ${sessionScope.toastType}" id="toast">
        <div class="toast-icon ${sessionScope.toastType}">
            <c:choose>
                <c:when test="${sessionScope.toastType == 'success'}">
                    <i class="fas fa-check-circle"></i>
                </c:when>
                <c:otherwise>
                    <i class="fas fa-exclamation-circle"></i>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="toast-content">
            <div class="toast-title ${sessionScope.toastType}">
                <c:choose>
                    <c:when test="${sessionScope.toastType == 'success'}">Success!</c:when>
                    <c:otherwise>Error!</c:otherwise>
                </c:choose>
            </div>
            <div class="toast-message">${sessionScope.toastMessage}</div>
        </div>
        <button class="toast-close" onclick="closeToast()">&times;</button>
    </div>
    
    <%-- Clear toast attributes after displaying --%>
    <c:remove var="toastMessage" scope="session"/>
    <c:remove var="toastType" scope="session"/>
    
    <script>
        // Auto close after 5 seconds
        setTimeout(closeToast, 5000);
        
        function closeToast() {
            var toast = document.getElementById('toast');
            if (toast) {
                toast.style.animation = 'slideOut 0.3s ease-out forwards';
                setTimeout(() => {
                    if (toast.parentNode) {
                        toast.remove();
                    }
                }, 300);
            }
        }
    </script>
</c:if>

<div class="glass-panel">

    <!-- Header -->
    <div class="welcome-header">
        <div class="title-section">
            <h1>Fee Management System</h1> 
        </div>
    </div>

    <!-- Main Operations -->
    <div class="operations-grid">

        <!-- Add Student -->
        <div class="action-card add-special">
            <div class="icon-badge"><i class="fas fa-user-plus"></i></div>
            <h3>Add Student</h3>
            <div class="sub-hint">Hostalite / Day Scholar</div>

            <div class="dropdown-micro">
                <a href="hostalite-form.jsp">
                    <i class="fas fa-bed"></i> Hostalite
                </a>
                <a href="dayscholar-form.jsp">
                    <i class="fas fa-book-open"></i> Day Scholar
                </a>
            </div>
        </div>

       <!-- Search -->
        <a href="search-students.jsp" class="action-card">
            <div class="icon-badge">
                <i class="fas fa-magnifying-glass"></i>
            </div>
            <h3>Search</h3>
            
            <small style="margin-top:6px; font-size:0.75rem; opacity:0.7;">
                Find any student instantly
            </small>
        </a>
        
        <!-- Fee Check -->
        <a href="fee-check.jsp" class="action-card">
            <div class="icon-badge">
                <i class="fas fa-coins"></i>
            </div>
            <h3>Fee Check</h3>
        
            <small style="margin-top:6px; font-size:0.75rem; opacity:0.7;">
                View complete fee status
            </small>
        </a>

    </div>

    <!-- Compact Row -->
    <div class="row-compact">

        <a href="discount-apply.jsp" class="compact-card">
            <i class="fas fa-tags"></i>
            <span>Apply Discount</span>
           
        </a>

        <a href="hostalite-students" class="compact-card">
            <i class="fas fa-bed"></i>
            <span>Hostalite List</span>
            <small style="font-size:0.75rem;">All Residents</small>
        </a>

        <a href="scholar-students" class="compact-card">
            <i class="fas fa-graduation-cap"></i>
            <span>Scholar List</span>
            <small style="font-size:0.75rem;">Day Scholars</small>
        </a>

    </div>

</div>

</body>
</html>