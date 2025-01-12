<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Customer Account</title>
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
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 sidebar p-3">
                <h4 class="text-center mb-4">Bank Dashboard</h4>
                <nav class="nav flex-column">
                    <a class="nav-link" href="dashboard.jsp"><i class="fas fa-home me-2"></i> Dashboard</a>
                    <a class="nav-link active" href="create-account.jsp"><i class="fas fa-user-plus me-2"></i> Create Account</a>
                    <a class="nav-link" href="search-account.jsp"><i class="fas fa-search me-2"></i> Search Account</a>
                    <a class="nav-link" href="transactions.jsp"><i class="fas fa-exchange-alt me-2"></i> Transactions</a>
                    <a class="nav-link" href="loan-requests.jsp"><i class="fas fa-hand-holding-usd me-2"></i> Loan Requests</a>
                    <a class="nav-link" href="logout"><i class="fas fa-sign-out-alt me-2"></i> Logout</a>
                </nav>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 content-area">
                <div class="row mb-4">
                    <div class="col-12">
                        <h2>Create New Customer Account</h2>
                        <p class="text-muted">Fill in the customer details below</p>
                    </div>
                </div>

                <form action="customerAccount" method="POST" class="needs-validation">
                    <!-- Personal Information -->
                    <div class="card dashboard-card mb-4">
                        <div class="card-header bg-white">
                            <h5 class="mb-0">Personal Information</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Full Name</label>
                                    <input type="text" class="form-control" name="name" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Email</label>
                                    <input type="email" class="form-control" name="email" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Mobile</label>
                                    <input type="tel" class="form-control" name="mobile" pattern="[0-9]{10}" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">PAN Number</label>
                                    <input type="text" class="form-control" name="pan_number" pattern="[A-Z]{5}[0-9]{4}[A-Z]{1}" required>
                                	<small>Format: 5 letters, 4 digits, 1 letter</small><br><br>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Aadhaar Number</label>
                                    <input type="text" class="form-control" name="aadhaar" pattern="[0-9]{12}" required>
                                	<small>Format: 12 digits</small><br><br>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Marital Status</label>
                                    <select class="form-select" name="marital_status" required>
                                        <option value="">Select Status</option>
                                        <option value="SINGLE">Single</option>
                                        <option value="MARRIED">Married</option>
                                    </select>
                                </div>
                                <div class="col-12 mb-3">
                                    <label class="form-label">Residential Address</label>
                                    <textarea class="form-control" name="address" rows="3" required></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Employment Information -->
                    <div class="card dashboard-card mb-4">
                        <div class="card-header bg-white">
                            <h5 class="mb-0">Employment Information</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Occupation Type</label>
                                    <select class="form-select" name="occupation" required>
                                        <option value="">Select Occupation</option>
                                        <option value="Salaried">Salaried</option>
                                        <option value="Self-Employed">Self-Employed</option>
                                        <option value="Unemployed">Unemployed</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Employer Name</label>
                                    <input type="text" class="form-control" name="employer" required>
                                </div>
                                <div class="col-12 mb-3">
                                    <label class="form-label">Employer Address</label>
                                    <textarea class="form-control" name="employerAddress" rows="3" required></textarea>
                                </div>
                           
                            </div>
                        </div>
                    </div>

                    <!-- Account Details -->
                    <div class="card dashboard-card mb-4">
                        <div class="card-header bg-white">
                            <h5 class="mb-0">Account Details</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Account Type</label>
                                    <select class="form-select" name="accountType" required>
                                        <option value="">Select Account Type</option>
                                        <option value="SAVINGS">Savings</option>
                                        <option value="CURRENT">Current</option>
                                        <option value="FIXED_DEPOSIT">Fixed Deposit</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Initial Balance</label>
                                    <input type="number" class="form-control" name="initialBalance" min="0" required>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="text-end">
                        <button type="reset" class="btn btn-secondary me-2">Reset</button>
                        <button type="submit" class="btn btn-primary">Create Account</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    <script>
        // Form validation
        (() => {
            'use strict'
            const forms = document.querySelectorAll('.needs-validation')
            Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        })()
    </script>
</body>
</html>
