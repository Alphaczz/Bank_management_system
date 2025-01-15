<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Dashboard - SecureBank</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        /* Include the same root variables and sidebar styles */
        :root {
            --primary-color: #0387DE;
            --secondary-color: #1976D2;
            --background-color: #fff;
            --sidebar-color: #1E2A38;
            --text-color: #FFFFFF;
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
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="logo">SecureBank Admin</div>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="#">
                    <i class="fas fa-tachometer-alt"></i> Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="customer-management.jsp">
                    <i class="fas fa-users"></i> Customer Management
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="loan-requests.jsp">
                    <i class="fas fa-hand-holding-usd"></i> Loan Requests
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="transaction-monitoring.jsp">
                    <i class="fas fa-chart-line"></i> Transaction Monitoring
                </a>
            </li>
            <li class="nav-item mt-auto">
                <a class="nav-link" href="logout">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </li>
        </ul>
    </div>

    <div class="main-content">
        <!-- Statistics Cards -->
        <div class="row mb-4">
            <div class="col-md-3">
                <div class="card bg-primary text-white">
                    <div class="card-body">
                        <h6>Total Customers</h6>
                        <h3>${totalCustomers}</h3>
                        <small>+${newCustomers} this month</small>
                    </div>
                </div>
            </div>
            
            <div class="col-md-3">
                <div class="card bg-warning text-white">
                    <div class="card-body">
                        <h6>Pending Loan Requests</h6>
                        <h3>${pendingLoans}</h3>
                        <small>Updated today</small>
                    </div>
                </div>
            </div>
            
            <div class="col-md-3">
                <div class="card bg-info text-white">
                    <div class="card-body">
                        <h6>Today's Transactions</h6>
                        <h3>${todayTransactions}</h3>
                        <small>$${todayTransactionValue}</small>
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent Customer Activity -->
        <div class="card mb-4">
            <div class="card-body">
                <h5 class="card-title">Recent Customer Activity</h5>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Customer ID</th>
                                <th>Name</th>
                                <th>Activity</th>
                                <th>Date</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${recentActivities}" var="activity">
                                <tr>
                                    <td>${activity.customerId}</td>
                                    <td>${activity.customerName}</td>
                                    <td>${activity.activityType}</td>
                                    <td>${activity.date}</td>
                                    <td>
                                        <span class="badge bg-${activity.status == 'Completed' ? 'success' : 'warning'}">
                                            ${activity.status}
                                        </span>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-primary" onclick="viewDetails('${activity.id}')">
                                            View Details
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="row g-4 mb-4">
            <div class="col-md-4">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title">Create New Account</h5>
                        <p>Register new customer accounts quickly</p>
                        <a href="create-account.jsp" class="btn btn-primary">Create Account</a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title">Process Loan Applications</h5>
                        <p>Review and process pending loan requests</p>
                        <a href="loan-processing.jsp" class="btn btn-primary">Process Loans</a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title">Generate Reports</h5>
                        <p>Create custom reports and analytics</p>
                        <a href="reports.jsp" class="btn btn-primary">Generate Reports</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    <script>
        function viewDetails(activityId) {
            // Implement view details functionality
            window.location.href = `activity-details.jsp?id=${activityId}`;
        }
    </script>
</body>
</html>