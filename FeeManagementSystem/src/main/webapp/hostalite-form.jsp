<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Hostalite Student</title>
<link rel="stylesheet" href="form.css">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>

    <div class="glass-panel">

        <a href="home-page2.jsp" class="back-btn"> 
            <i class="fas fa-arrow-left"></i> Back
        </a>

        <h2>Add Hostalite Student</h2>

        <!-- Toast for form errors -->
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
            
            <c:remove var="toastMessage" scope="session"/>
            <c:remove var="toastType" scope="session"/>
            
            <script>
                setTimeout(closeToast, 5000);
                function closeToast() {
                    var toast = document.getElementById('toast');
                    if (toast) {
                        toast.style.animation = 'slideOut 0.3s ease-out forwards';
                        setTimeout(() => toast.remove(), 300);
                    }
                }
            </script>
        </c:if>

        <form action="AddStudentServlet" method="post" class="student-form">

            <div class="form-group">
                <label>Student Name</label> 
                <input type="text" name="sname"
                    value="${sessionScope.sname}" required
                    placeholder="Enter student name">
            </div>

            <div class="form-group">
                <label>Username</label> 
                <input type="text" name="username"
                    value="${sessionScope.username}" required
                    placeholder="Enter username">
            </div>

            <input type="hidden" name="student-type" value="hostalite">

            <div class="form-group">
                <label>State</label> 
                <input type="text" name="state"
                    value="${sessionScope.state}" required placeholder="Enter State">

                <label>City</label> 
                <input type="text" name="city"
                    value="${sessionScope.city}" required placeholder="Enter City">
            </div>

            <div class="form-group">
                <label>Last Grade Percentage</label> 
                <input type="number"
                    name="percentage" value="${sessionScope.percentage}" step="0.01"
                    min="0" max="100" required placeholder="Enter percentage (0-100)">
            </div>

            <div class="form-group">
                <label>Course</label> 
                <select name="course" required>
                    <option value="">Select Course</option>
                    <option value="BBACA">BBACA</option>
                    <option value="BCA">BCA</option>
                    <option value="BCOM">BCOM</option>
                </select>
            </div>

            <button type="submit" class="submit-btn">Submit</button>

        </form>

    </div>
    
    <!-- Add toast styles -->
    <style>
        .toast-notification {
            position: fixed;
            top: 30px;
            right: 30px;
            min-width: 320px;
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
            from { transform: translateX(100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }
        
        @keyframes slideOut {
            from { transform: translateX(0); opacity: 1; }
            to { transform: translateX(100%); opacity: 0; }
        }
        
        .toast-notification.success {
            border-left-color: #4CAF50;
            background: #f1f9f1;
        }
        
        .toast-notification.error {
            border-left-color: #f44336;
            background: #fef1f0;
        }
        
        .toast-icon.success { color: #4CAF50; }
        .toast-icon.error { color: #f44336; }
        .toast-icon { font-size: 24px; }
        
        .toast-content { flex: 1; }
        
        .toast-title {
            font-weight: 600;
            font-size: 16px;
            margin-bottom: 4px;
        }
        
        .toast-title.success { color: #2e7d32; }
        .toast-title.error { color: #c62828; }
        
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
        
        .toast-close:hover { color: #333; }
    </style>
</body>
</html>