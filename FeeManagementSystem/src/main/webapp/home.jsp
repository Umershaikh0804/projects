<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>

    <!-- Linking external CSS -->
    <link rel="stylesheet" href="home.css">
</head>
<body>

    <!-- MAIN WRAPPER (full page center alignment) -->
    <div class="wrapper">

        <!-- MAIN CARD BOX -->
        <div class="main-box">

            <!-- BUTTONS LIST -->
          
			 <a href="hostalite-students" class="menu-btn">Hostalite Students</a>
			 <a href="scholar-students" class="menu-btn">Scholar Students</a>
			
			

            <a href="fee-check.jsp" class="menu-btn">Fee Check</a>

            <a href="discount-apply.jsp" class="menu-btn">Apply Discount</a>
            
            <a href="search-students.jsp" class="menu-btn">Search Students</a>

            <!-- DROPDOWN SECTION -->
            <div class="dropdown">

                <!-- MAIN DROPDOWN BUTTON -->
                <button class="menu-btn dropdown-btn">Add Student ▼</button>

                <!-- DROPDOWN CONTENT -->
                <div class="dropdown-content">
                    <a href="hostalite-form.jsp">Hostalite</a>
                    <a href="dayscholar-form.jsp">DayScholar</a>
                </div>

            </div>

        </div>
    </div>

</body>
</html>
