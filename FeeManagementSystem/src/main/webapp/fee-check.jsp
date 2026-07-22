<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fee Check</title>

<!-- Font Awesome -->
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
}

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
    max-width: 600px;
    background: rgba(255, 255, 255, 0.88);
    backdrop-filter: blur(10px);
    border-radius: 2.5rem;
    box-shadow: 0 25px 50px -15px rgba(0, 0, 0, 0.25);
    padding: 2.5rem;
}

/* Back Button */
.back-btn {
    text-decoration: none;
    background: #2d3e54;
    color: white;
    padding: 8px 15px;
    border-radius: 30px;
    font-size: 0.9rem;
    display: inline-block;
    margin-bottom: 20px;
    transition: 0.2s;
}

.back-btn:hover {
    background: #f5b342;
    color: #1d2b38;
}

/* Title */
h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #1A2A3A;
}

/* Form */
form {
    display: flex;
    gap: 10px;
    margin-bottom: 25px;
}

input {
    flex: 1;
    padding: 10px;
    border-radius: 8px;
    border: 1px solid #ccc;
}

button {
    background-color: #f5b342;
    border: none;
    padding: 10px 18px;
    border-radius: 30px;
    cursor: pointer;
    font-weight: 600;
}

button:hover {
    background-color: #d89c2f;
}

/* Result Box */
.box {
    background: white;
    padding: 20px;
    border-radius: 1.5rem;
    box-shadow: 0 12px 25px -10px rgba(0,0,0,0.15);
}

.box p {
    margin-bottom: 8px;
}

/* Nested Fee Box */
.nested {
    margin-top: 15px;
    padding: 15px;
    background: #fff8e7;
    border-radius: 1rem;
}

/* Messages */
.no-data {
    text-align: center;
    color: #666;
    font-size: 16px;
}

.error-box {
    text-align: center;
    color: red;
    font-size: 16px;
    margin-bottom: 15px;
}

</style>
</head>

<body>

<div class="glass-panel">

    <!-- Back Button -->
    <a href="home-page2.jsp" class="back-btn">
        <i class="fas fa-arrow-left"></i> Back
    </a>

    <h2>Fee Check</h2>

    <form action="FeeCheckServlet" method="post">
        <input type="text" name="roll" placeholder="Enter Roll No / Student ID">
        <button type="submit">Search</button>
    </form>

    <!-- BEFORE ANY SEARCH -->
    <c:if test="${empty student and empty error}">
        <div class="no-data">No Data Yet</div>
    </c:if>

    <!-- ERROR -->
    <c:if test="${not empty error}">
        <div class="error-box">${error}</div>
    </c:if>

    <!-- STUDENT FOUND -->
    <c:if test="${not empty student}">
        <div class="box">
            <p><b>Roll No:</b> ${student.rno}</p>
            <p><b>Name:</b> ${student.sname}</p>
            <p><b>Percentage:</b> ${student.percentage}</p>
            <p><b>Fee Status:</b> ${student.feeStatus}</p>
            <p><b>State:</b> ${student.state}</p>
            <p><b>City:</b> ${student.city}</p>
            <p><b>Course:</b> ${student.course}</p>

            <div class="nested">

                <!-- Hostalite Student -->
                <c:if test="${not empty hostalite}">
                    <p><b>Base Fees:</b> ₹${hostalite.baseFees}</p>
                    <p><b>Food Charges:</b> ₹${hostalite.foodCharges}</p>
                    <p><b>Total Fees:</b> ₹${hostalite.totalFees}</p>
                </c:if>

                <!-- Day Scholar Student -->
                <c:if test="${not empty dayScholar}">
                    <p><b>Base Fees:</b> ₹${dayScholar.baseFees}</p>
                    <p><b>Travel Charges:</b> ₹${dayScholar.busFees}</p>
                    <p><b>Total Fees:</b> ₹${dayScholar.totalFees}</p>
                </c:if>

            </div>
        </div>
    </c:if>

</div>

</body>
</html>