<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Loan Application - SecureBank</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
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
                <a class="nav-link" href="loanApp.jsp">
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
        <div class="card">
            <div class="card-body">
                <h4 class="card-title mb-4">Loan Application Form</h4>
                
                <form id="loanApplicationForm" action="submitLoanApplication" method="post">
                    <!-- Personal Information -->
                    <h5 class="mb-3">Personal Information</h5>
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <label class="form-label">Full Name</label>
                            <input type="text" class="form-control" name="fullName" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Date of Birth</label>
                            <input type="date" class="form-control" name="dob" required>
                        </div>
                    </div>

                    <!-- Employment Details -->
                    <h5 class="mb-3">Employment Details</h5>
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <label class="form-label">Employer Name</label>
                            <input type="text" class="form-control" name="employer">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Monthly Income</label>
                            <input type="number" class="form-control" name="monthlyIncome" required>
                        </div>
                    </div>

                    <!-- Loan Details -->
                    <h5 class="mb-3">Loan Details</h5>
                    <div class="row mb-4">
                        <div class="col-md-4">
                            <label class="form-label">Loan Amount</label>
                            <input type="number" class="form-control" name="loanAmount" required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Loan Term (Years)</label>
                            <select class="form-select" name="loanTerm" required>
                                <option value="1">1 Year</option>
                                <option value="2">2 Years</option>
                                <option value="5">5 Years</option>
                                <option value="10">10 Years</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Purpose of Loan</label>
                            <select class="form-select" name="loanPurpose" required>
                                <option value="personal">Personal</option>
                                <option value="business">Business</option>
                                <option value="education">Education</option>
                                <option value="home">Home</option>
                            </select>
                        </div>
                    </div>

                    <!-- Documents Upload -->
                    <h5 class="mb-3">Required Documents</h5>
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <label class="form-label">Income Proof</label>
                            <input type="file" class="form-control" name="incomePoof" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Identity Proof</label>
                            <input type="file" class="form-control" name="identityProof" required>
                        </div>
                    </div>

                    <!-- Terms and Conditions -->
                    <div class="mb-4">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="termsCheck" required>
                            <label class="form-check-label" for="termsCheck">
                                I agree to the terms and conditions
                            </label>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="text-end">
                        <button type="submit" class="btn btn-primary">Submit Application</button>
                        <button type="reset" class="btn btn-secondary">Reset Form</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    <script>
        // Form validation and submission handling
        document.getElementById('loanApplicationForm').addEventListener('submit', function(e) {
            e.preventDefault();
            // Add form validation logic here
            // Submit form if validation passes
            this.submit();
        });
    </script>
</body>
</html>