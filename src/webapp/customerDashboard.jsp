<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Customer Dashboard - SecureBank</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<style>
:root {
	--primary-color: #0387DE;
	--secondary-color: #1976D2;
	--background-color: #fff;
	--sidebar-color: #1E2A38;
	--card-color: #c7d2d9;
	--text-color: #FFFFFF;
}

body {
	background-color: var(--background-color);
	color: var(--text-color);
	min-height: 100vh;
}

.sidebar {
	background-color: var(--sidebar-color);
	min-height: 100vh;
	padding: 20px;
	position: fixed;
	left: 0;
	top: 0;
	bottom: 0;
	width: 250px;
	box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
}

.main-content {
	margin-left: 250px;
	padding: 20px;
}

.card {
	background-color: var(--card-color);
	border: none;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.table {
	color: var(--text-color);
}

.nav-link {
	color: var(--text-color);
	padding: 10px 15px;
	margin-bottom: 5px;
	border-radius: 5px;
	transition: all 0.3s;
}

.nav-link:hover {
	background-color: var(--primary-color);
	color: var(--text-color);
}

.nav-link.active {
	background-color: var(--primary-color);
	color: var(--text-color);
}

.nav-link i {
	margin-right: 10px;
}

.logo {
	font-size: 24px;
	font-weight: bold;
	color: var(--text-color);
	margin-bottom: 30px;
	padding: 10px 15px;
}

.stat-card {
	background-color: var(--primary-color);
	border-radius: 8px;
	padding: 15px;
	margin-bottom: 20px;
}

.stat-card h4 {
	margin: 0;
	font-size: 14px;
	opacity: 0.9;
}

.stat-card .number {
	font-size: 24px;
	font-weight: bold;
	margin-top: 5px;
}

.btn-primary {
	background-color: var(--primary-color);
	border-color: var(--primary-color);
}

.btn-primary:hover {
	background-color: var(--secondary-color);
	border-color: var(--secondary-color);
}
</style>
<style>
:root {
	--primary-color: #0387DE;
	--secondary-color: #1976D2;
	--background-color: #fff;
	--sidebar-color: #1E2A38;
	--text-color: #FFFFFF;
}

/* Include the same sidebar and main-content styles from transaction.jsp */
.sidebar {
	background-color: var(--sidebar-color);
	min-height: 100vh;
	padding: 20px;
	position: fixed;
	left: 0;
	top: 0;
	bottom: 0;
	width: 250px;
	box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
}

.main-content {
	margin-left: 250px;
	padding: 20px;
}

.account-summary {
	background-color: var(--primary-color);
	color: white;
	border-radius: 10px;
	padding: 20px;
	margin-bottom: 20px;
}

.quick-actions .card {
	transition: transform 0.3s;
}

.quick-actions .card:hover {
	transform: translateY(-5px);
}
</style>
</head>
<body>
	<!-- Include the same sidebar structure -->
	<div class="sidebar">
		<!-- Same sidebar content as transaction.jsp -->
		<div class="sidebar">
			<div class="logo">Bank Dashboard</div>
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link" href="customerDashboard.jsp">
						<i class="fas fa-home"></i> Dashboard
				</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="transactions.jsp"> <i class="fas fa-exchange-alt"></i>
						Transactions
				</a></li>
				
				<li class="nav-item"><a class="nav-link" href="transfer.jsp">
						<i class="fas fa-paper-plane"></i> Transfer
				</a></li>
				<li class="nav-item">
                <a class="nav-link" href="LoanApp.jsp">
                    <i class="fas fa-chart-bar"></i> Loan
                </a>
            </li>
				<li class="nav-item mt-auto"><a class="nav-link"
					href="logout.jsp"> <i class="fas fa-sign-out-alt"></i> Logout
				</a></li>
			</ul>
		</div>
	</div>

	<div class="main-content">
		<!-- Account Summary -->
		<div class="account-summary">
			<h3>Welcome, ${customer.name}</h3>
			<div class="row mt-4">
				<div class="col-md-4">
					<h5>Account Balance</h5>
					<h2>$${accountBalance}</h2>
				</div>
				<div class="col-md-4">
					<h5>Available Credit</h5>
					<h2>$${availableCredit}</h2>
				</div>
				<div class="col-md-4">
					<h5>Pending Transactions</h5>
					<h2>${pendingTransactions}</h2>
				</div>
			</div>
		</div>

		<!-- Quick Actions -->
		<div class="quick-actions">
			<h4 class="mb-4">Quick Actions</h4>
			<div class="row g-4">
				<div class="col-md-3">
					<div class="card h-100">
						<div class="card-body text-center">
							<i class="fas fa-paper-plane fa-2x mb-3 text-primary"></i>
							<h5>Transfer Money</h5>
							<a href="transfer.jsp" class="btn btn-primary mt-3">Transfer</a>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card h-100">
						<div class="card-body text-center">
							<i class="fas fa-history fa-2x mb-3 text-primary"></i>
							<h5>Transaction History</h5>
							<a href="transactions.jsp" class="btn btn-primary mt-3">View</a>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card h-100">
						<div class="card-body text-center">
							<i class="fas fa-hand-holding-usd fa-2x mb-3 text-primary"></i>
							<h5>Apply for Loan</h5>
							<a href="loan-application.jsp" class="btn btn-primary mt-3">Apply</a>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card h-100">
						<div class="card-body text-center">
							<i class="fas fa-user-cog fa-2x mb-3 text-primary"></i>
							<h5>Account Settings</h5>
							<a href="settings.jsp" class="btn btn-primary mt-3">Manage</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Recent Transactions -->
		<div class="card mt-4">
			<div class="card-body">
				<h4 class="mb-4">Recent Transactions</h4>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th>Date</th>
								<th>Description</th>
								<th>Amount</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<!-- Iterate through recent transactions -->
							<c:forEach items="${recentTransactions}" var="transaction">
								<tr>
									<td>${transaction.date}</td>
									<td>${transaction.description}</td>
									<td>$${transaction.amount}</td>
									<td>${transaction.status}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>