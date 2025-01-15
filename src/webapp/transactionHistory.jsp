<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Transaction" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
    <!-- Sidebar -->
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

    <!-- Main Content -->
    <div class="main-content">
        <!-- Stats Row -->
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="stat-card">
                    <h4>Total Transactions</h4>
                    <div class="number">89</div>
                    <small>Active</small>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="stat-card">
                    <h4>Total Accounts</h4>
                    <div class="number">1,234</div>
                    <small>+15% increase</small>
                </div>
            </div>
        </div>

        <!-- Transaction History Card -->
        <div class="card">
            <div class="card-body">
                <h3 class="card-title mb-4">Transaction History</h3>
                
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Transaction ID</th>
                                <th>Type</th>
                                <th>Amount</th>
                                <th>Balance</th>
                                <th>Description</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            List<Transaction> transactions = (List<Transaction>)request.getAttribute("transactions");
                            if(transactions != null) {
                                for(Transaction transaction : transactions) {
                            %>
                                <tr>
                                    <td><%= transaction.getTransactionDate() %></td>
                                    <td><%= transaction.getTransactionId() %></td>
                                    <td><%= transaction.getTransactionType() %></td>
                                    <td>$<%= String.format("%.2f", transaction.getAmount()) %></td>
                                    <td>$<%= String.format("%.2f", transaction.getBalance()) %></td>
                                    <td><%= transaction.getDescription() %></td>
                                    <td><%= transaction.getStatus() %></td>
                                </tr>
                            <%
                                }
                            } else {
                            %>
                                <tr>
                                    <td colspan="7" class="text-center">No transactions found</td>
                                </tr>
                            <%
                            }
                            %>
                        </tbody>
                    </table>
                </div>

                <div class="mt-3">
                    <a href="transfer.jsp" class="btn btn-primary">New Transaction</a>
                    <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>