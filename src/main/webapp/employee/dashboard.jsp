<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Employee Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
<style>
        .sidebar {
            background-color: #2c3e50;
            color: white;
            min-height: 100vh;
        }
        .sidebar .nav-link {
            color: white;
            padding: 15px;
            border-radius: 5px;
            margin: 5px 0;
        }
        .sidebar .nav-link:hover {
            background-color: #34495e;
        }
        .sidebar .nav-link.active {
            background-color: #3498db;
        }
        .content-area {
            background-color: #f8f9fa;
            min-height: 100vh;
            padding: 20px;
        }
        .dashboard-card {
            border-radius: 10px;
            outline: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .stat-card {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <%-- Sidebar --%>
        <div class="col-md-3 col-lg-2 sidebar p-3">
            <h4 class="text-center mb-4">Bank Dashboard</h4>
            <nav class="nav flex-column">
                <a class="nav-link active" href="#"><i class="fas fa-home me-2"></i> Dashboard</a>
                <a class="nav-link" href="create-account.jsp"><i class="fas fa-user-plus me-2"></i> Create Account</a>
                <a class="nav-link" href="#"><i class="fas fa-search me-2"></i> Search Account</a>
                <a class="nav-link" href="#"><i class="fas fa-exchange-alt me-2"></i> Transactions</a>
                <a class="nav-link" href="#"><i class="fas fa-hand-holding-usd me-2"></i> Loan Requests</a>
                <a class="nav-link" href="#"><i class="fas fa-sign-out-alt me-2"></i> Logout</a>
            </nav>
        </div>

        <!-- Main Content -->
        <div class="col-md-9 col-lg-10 content-area">
            <div class="row mb-4">
                <div class="col-12">
                    <h2>Welcome, Employee!</h2>
                    <p class="text-muted">Here's your overview for today</p>
                </div>
            </div>

            <!-- Stats Cards -->
            <div class="row mb-4">
                <div class="col-md-4 mb-3">
                    <div class="card stat-card dashboard-card">
                        <div class="card-body">
                            <h5 class="card-title">Total Accounts</h5>
                            <h2>1,234</h2>
                            <p class="mb-0"><i class="fas fa-arrow-up"></i> 12% increase</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card stat-card dashboard-card">
                        <div class="card-body">
                            <h5 class="card-title">Pending Loans</h5>
                            <h2>45</h2>
                            <p class="mb-0"><i class="fas fa-clock"></i> Awaiting Review</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card stat-card dashboard-card">
                        <div class="card-body">
                            <h5 class="card-title">Today's Transactions</h5>
                            <h2>89</h2>
                            <p class="mb-0"><i class="fas fa-chart-line"></i> Active</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Activities -->
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="card dashboard-card">
                        <div class="card-header bg-white">
                            <h5 class="mb-0">Recent Accounts Created</h5>
                        </div>
                        <div class="card-body">
                            <div class="list-group">
                                <a href="#" class="list-group-item list-group-item-action">
                                    <div class="d-flex justify-content-between">
                                        <h6 class="mb-1">John Doe</h6>
                                        <small>2 mins ago</small>
                                    </div>
                                    <p class="mb-1">Account #1234567</p>
                                    <small class="text-muted">Savings Account</small>
                                </a>
                                <a href="#" class="list-group-item list-group-item-action">
                                    <div class="d-flex justify-content-between">
                                        <h6 class="mb-1">Jane Smith</h6>
                                        <small>5 mins ago</small>
                                    </div>
                                    <p class="mb-1">Account #1234568</p>
                                    <small class="text-muted">Current Account</small>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 mb-4">
                    <div class="card dashboard-card">
                        <div class="card-header bg-white">
                            <h5 class="mb-0">Pending Loan Requests</h5>
                        </div>
                        <div class="card-body">
                            <div class="list-group">
                                <div class="list-group-item">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="mb-1">Robert Johnson</h6>
                                            <p class="mb-1">Amount: $25,000</p>
                                            <small class="text-muted">Credit Score: 750</small>
                                        </div>
                                        <div>
                                            <button class="btn btn-success btn-sm me-2">Approve</button>
                                            <button class="btn btn-danger btn-sm">Reject</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="mb-1">Sarah Wilson</h6>
                                            <p class="mb-1">Amount: $15,000</p>
                                            <small class="text-muted">Credit Score: 680</small>
                                        </div>
                                        <div>
                                            <button class="btn btn-success btn-sm me-2">Approve</button>
                                            <button class="btn btn-danger btn-sm">Reject</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>