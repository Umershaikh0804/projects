<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Scholar Students</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Inter', system-ui, -apple-system, sans-serif;
}

body {
	min-height: 100vh;
	background: #f2f5f9;
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
	background:
		url('https://images.unsplash.com/photo-1581291518633-83b4ebd1d83e?q=80&w=2070&auto=format&fit=crop')
		center/cover no-repeat;
	opacity: 0.18;
	z-index: 0;
}

.glass-panel {
	position: relative;
	z-index: 10;
	width: 100%;
	max-width: 900px;
	background: rgba(255, 255, 255, 0.9);
	backdrop-filter: blur(10px);
	border-radius: 2rem;
	box-shadow: 0 25px 50px -15px rgba(0, 0, 0, 0.25);
	padding: 2.5rem;
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

h2 {
	text-align: center;
	margin-bottom: 25px;
	color: #1A2A3A;
}

table {
	width: 100%;
	border-collapse: collapse;
	background: white;
	border-radius: 1rem;
	overflow: hidden;
	box-shadow: 0 12px 25px -10px rgba(0, 0, 0, 0.15);
}

th {
	background: #f5b342;
	padding: 14px;
	text-align: left;
}

td {
	padding: 12px;
	border-bottom: 1px solid #eee;
}

tr:hover {
	background: #fff8e7;
}
</style>
</head>

<body>

	<div class="glass-panel">

		<a href="home-page2.jsp" class="back-btn"> <i
			class="fas fa-arrow-left"></i> Back
		</a>

		<h2>Scholar Students List</h2>

		<table>
			<thead>
				<tr>
					<th>Student ID</th>
					<th>Name</th>
					<th>Course</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="s" items="${scholarList}">
					<tr>
						<td>${s.rno}</td>
						<td>${s.sname}</td>
						<td>${s.course}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>

	</div>
</body>
</html>