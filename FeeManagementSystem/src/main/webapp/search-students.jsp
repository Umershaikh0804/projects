<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Search</title>

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
        overflow-x: hidden;
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

    h2 {
        font-size: 2rem;
        margin-bottom: 1.5rem;
        color: #1A2A3A;
    }

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

    .filter-panel {
        background: rgba(255,255,255,0.95);
        padding: 20px;
        border-radius: 1.5rem;
        box-shadow: 0 12px 25px -10px rgba(0,0,0,0.15);
        margin-bottom: 25px;
    }

    .filter-section {
        margin-bottom: 15px;
    }

    input, select {
        padding: 6px;
        margin-right: 10px;
        border-radius: 6px;
        border: 1px solid #ccc;
    }

    button {
        background-color: #f5b342;
        border: none;
        padding: 8px 15px;
        border-radius: 30px;
        cursor: pointer;
        font-weight: 600;
    }

    button:hover {
        background-color: #d89c2f;
    }

    .summary {
        background: rgba(255,255,255,0.95);
        padding: 20px;
        border-radius: 1.5rem;
        box-shadow: 0 12px 25px -10px rgba(0,0,0,0.15);
        margin-bottom: 25px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background: white;
        border-radius: 1rem;
        overflow: hidden;
        box-shadow: 0 12px 25px -10px rgba(0,0,0,0.15);
    }

    th {
        background-color: #f5b342;
        padding: 12px;
    }

    td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #eee;
    }

    tr:hover {
        background-color: #fff8e7;
    }

</style>
</head>

<body>

<div class="glass-panel">

    <!-- Back Button -->
    <a href="home-page2.jsp" class="back-btn">
        <i class="fas fa-arrow-left"></i> Back
    </a>

    <h2>Student Search & Filter</h2>

    <!-- ================= FILTER PANEL ================= -->
    <div class="filter-panel">

    <form action="SearchStudentServlet" method="get">

        <div class="filter-section">
            <strong>Student Type:</strong><br>
            <label><input type="checkbox" name="type" value="HOSTALITE"> Hostalite</label>
            <label><input type="checkbox" name="type" value="DAYSCHOLAR"> DayScholar</label>
        </div>

        <div class="filter-section">
            <strong>Location:</strong><br>
            State <input type="text" name="state">
            City <input type="text" name="city">
        </div>

        <div class="filter-section">
            <strong>Course:</strong><br>
            <select name="course">
                <option value="">All</option>
                <option value="BCA">BCA</option>
                <option value="BCOM">BCOM</option>
                <option value="BBACA">BBACA</option>
            </select>
        </div>

        <div class="filter-section">
            <strong>Sorting:</strong><br>
            <select name="sortBy">
                <option value="">None</option>
                <option value="fees">Total Fees</option>
                <option value="name">Name</option>
            </select>

            <select name="order">
                <option value="asc">ASC</option>
                <option value="desc">DESC</option>
            </select>
        </div>

        <div class="filter-section">
            <strong>Top Results:</strong><br>
            <select name="limit">
                <option value="">All</option>
                <option value="3">Top 3</option>
                <option value="5">Top 5</option>
                <option value="10">Top 10</option>
            </select>
        </div>

        <button type="submit">Apply Filters</button>
        <button type="reset">Reset</button>

    </form>
    </div>

    <!-- ================= SUMMARY PANEL ================= -->
    <c:if test="${not empty total}">
    <div class="summary">
        <p>Total Students: ${total}</p>
        <p>Hostalite: ${hostaliteCount}</p>
        <p>DayScholar: ${dayScholarCount}</p>

        <p>Course:</p>
        <ul>
            <c:forEach var="entry" items="${courseCount}">
                <li>${entry.key} (${entry.value} students)</li>
            </c:forEach>
        </ul>
    </div>
    </c:if>

    <!-- ================= RESULT TABLE ================= -->
    <c:if test="${not empty students}">
    <table>
    <tr>
        <th>Roll</th>
        <th>Name</th>
        <th>Type</th>
        <th>Course</th>
        <th>City</th>
        <th>Total Fees</th>
    </tr>

    <c:forEach var="s" items="${students}">
    <tr>
        <td>${s.rno}</td>
        <td>${s.sname}</td>
        <td>${s.studentType}</td>
        <td>${s.course}</td>
        <td>${s.city}</td>
        <td>${s.totalFees}</td>
    </tr>
    </c:forEach>

    </table>
    </c:if>

</div>
</body>
</html>