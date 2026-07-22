<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Apply Discount</title>

<style>

/* ===== RESET ===== */
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Inter',system-ui,-apple-system,sans-serif;
}

/* ===== BODY ===== */
body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:#f2f5f9;
    position:relative;
    padding:20px;
}

body::before{
    content:"";
    position:fixed;
    inset:0;
    background:url('https://images.unsplash.com/photo-1581291518633-83b4ebd1d83e?q=80&w=2070&auto=format&fit=crop') center/cover no-repeat;
    opacity:0.18;
    z-index:0;
}

/* ===== GLASS PANEL ===== */
.glass-panel{
    position:relative;
    z-index:10;
    width:100%;
    max-width:550px;
    background:rgba(255,255,255,0.92);
    backdrop-filter:blur(10px);
    border-radius:2rem;
    box-shadow:0 25px 50px -15px rgba(0,0,0,0.25);
    padding:2.5rem;
}

/* ===== BACK BUTTON ===== */
.back-btn{
    text-decoration:none;
    background:#2d3e54;
    color:white;
    padding:8px 15px;
    border-radius:30px;
    font-size:0.9rem;
    display:inline-block;
    margin-bottom:20px;
    transition:0.2s;
}

.back-btn:hover{
    background:#f5b342;
    color:#1d2b38;
}

/* ===== TITLE ===== */
h2{
    text-align:center;
    margin-bottom:25px;
    color:#1A2A3A;
}

/* ===== INPUT & SELECT ===== */
input,
select{
    padding:10px 12px;
    border-radius:10px;
    border:1px solid #dcdcdc;
    font-size:14px;
    height:42px;
    outline:none;
    transition:0.2s ease-in-out;
    background:white;
}

/* Focus Effect */
input:focus,
select:focus{
    border-color:#f5b342;
    box-shadow:0 0 0 3px rgba(245,179,66,0.2);
}

/* Remove default select arrow style */
select{
    appearance:none;
    -webkit-appearance:none;
    -moz-appearance:none;
    background-image:url("data:image/svg+xml;utf8,<svg fill='%231A2A3A' height='20' viewBox='0 0 24 24' width='20' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/></svg>");
    background-repeat:no-repeat;
    background-position:right 10px center;
    background-size:18px;
    padding-right:35px;
}

/* ===== BUTTON ===== */
button{
    background:#f5b342;
    border:none;
    padding:10px 18px;
    border-radius:30px;
    font-weight:600;
    cursor:pointer;
    transition:0.2s;
    height:42px;
}

button:hover{
    background:#d89c2f;
}

/* ===== SUCCESS & ERROR ===== */
.success{
    color:green;
    text-align:center;
    font-weight:600;
    margin-bottom:15px;
}

.error{
    color:red;
    text-align:center;
    font-weight:600;
    margin-bottom:15px;
}

/* ===== DISCOUNT BOX ===== */
.row-box{
    background:white;
    border-radius:1rem;
    padding:1rem;
    box-shadow:0 5px 15px rgba(0,0,0,0.08);
    margin-top:15px;
}

/* ===== HORIZONTAL FORM ===== */
.horizontal{
    display:flex;
    gap:12px;
    align-items:center;
}

.horizontal input,
.horizontal select{
    flex:1;
}

</style>
</head>

<body>

<div class="glass-panel">

<a href="home-page2.jsp" class="back-btn">← Back</a>

<h2>Apply Discount</h2>

<!-- ERROR -->
<c:if test="${not empty error}">
    <div class="error">${error}</div>
</c:if>

<!-- SUCCESS -->
<c:if test="${not empty message}">
    <div class="success">${message}</div>
</c:if>

<!-- APPLY BY PERCENTAGE -->
<div class="row-box">
    <form action="ApplyByPercentageServlet" method="post" class="horizontal">
        <input type="text" name="roll" placeholder="Enter Roll No" required>

        <select name="percentage" required>
            <option value="">Select Discount</option>
            <option value="10">10% Discount</option>
            <option value="20">20% Discount</option>
        </select>

        <button type="submit">Apply</button>
    </form>
</div>

<!-- APPLY BY FLAT AMOUNT -->
<div class="row-box">
    <form action="ApplyByFlatAmountServlet" method="post" class="horizontal">
        <input type="text" name="roll" placeholder="Enter Roll No" required>
        <input type="text" name="amount" placeholder="Enter Flat Amount (₹)" required>
        <button type="submit">Apply</button>
    </form>
</div>

</div>

</body>
</html>