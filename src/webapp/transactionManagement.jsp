<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction Management - SecureBank</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Include the same CSS variables and sidebar styles -->
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
</head>
<body>
    <!-- Include the same sidebar structure -->
     <div class="sidebar">
        <div class="logo">Bank Dashboard</div>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="customerDashboard.jsp">
                    <i class="fas fa-home"></i> Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="transactions.jsp">
                    <i class="fas fa-exchange-alt"></i> Transactions
                </a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="transfer.jsp">
                    <i class="fas fa-paper-plane"></i> Transfer
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="LoanApp.jsp">
                    <i class="fas fa-chart-bar"></i> Loan
                </a>
            </li>
            <li class="nav-item mt-auto">
                <a class="nav-link" href="logout.jsp">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </li>
        </ul>
    </div>
    
    <div class="main-content">
        <!-- Transaction Search Filters -->
        <div class="card mb-4">
            <div class="card-body">
                <h5 class="card-title">Transaction Search</h5>
                <form class="row g-3">
                    <div class="col-md-3">
                        <label class="form-label">Transaction ID</label>
                        <input type="text" class="form-control" name="transactionId">
                    </div>
                    
                    <div class="col-md-3">
                        <label class="form-label">Customer ID</label>
                        <input type="text" class="form-control" name="customerId">
                    </div>
                    
                    <div class="col-md-3">
                        <label class="form-label">Date Range</label>
                        <input type="date" class="form-control" name="dateRange">
                    </div>
                    
                    <div class="col-md-3">
                        <label class="form-label">Status</label>
                        <select class="form-select" name="status">
                            <option value="">All</option>
                            <option value="completed">Completed</option>
                            <option value="pending">Pending</option>
                            <option value="failed">Failed</option>
                        </select>
                    </div>
                    
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">Search</button>
                        <button type="reset" class="btn btn-secondary">Reset</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Transaction List -->
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Transaction History</h5>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Transaction ID</th>
                                <th>Customer</th>
                                <th>Type</th>
                                <th>Amount</th>
                                <th>Date</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${transactions}" var="transaction">
                                <tr>
                                    <td>${transaction.id}</td>
                                    <td>${transaction.customerName}</td>
                                    <td>${transaction.type}</td>
                                    <td>$${transaction.amount}</td>
                                    <td>${transaction.date}</td>
                                    <td>
                                        <span class="badge bg-${transaction.status == 'Completed' ? 'success' : 'warning'}">
                                            ${transaction.status}
                                        </span>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-primary" onclick="viewTransaction('${transaction.id}')">
                                            View
                                        </button>
                                        <button class="btn btn-sm btn-warning" onclick="flagTransaction('${transaction.id}')">
                                            Flag
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                
                <!-- Pagination -->
                <nav aria-label="Transaction pagination">
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <a class="page-link" href="#">Previous</a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    <script>
        function viewTransaction(id) {
            window.location.href = `transactionHistory.jsp?id=${id}`;
        }
        
        function flagTransaction(id) {
            // Implement flag transaction functionality
            if(confirm('Are you sure you want to flag this transaction?')) {
                // Add flag transaction logic
            }
        }
    </script>
</body>
</html>