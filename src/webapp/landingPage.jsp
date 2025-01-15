<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SecureBank - Your Trusted Banking Partner</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #0387DE;
            --primary-dark: #0496FF;
            --primary-light: #90e0ef;
            --primary-white: #fff;
        }
        
        .bg-primary {
            background-color: var(--primary-color) !important;
        }
        
        .btn-primary {
            
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        
        .btn-primary:hover {
            background-color: var(--primary-dark);
            border-color: var(--primary-dark);
        }
        
        .text-primary {
            color: var(--primary-color) !important;
        }
        
        .btn-outline-primary {
            color: var(--primary-color);
            border-color: var(--primary-color);
        }
        
        .btn-outline-primary:hover {
            background-color: var(--primary-dark);
            border-color: var(--primary-dark);
        }

        .navbar .btn-outline-light{
            color: var(--primary-white);
        }
        .navbar .btn-outline-light:hover {
            color: var(--primary-color);
        }

        .feature-card {
            transition: transform 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-5px);
        }

        .hero-section {
            background-color: #FFF8F2;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">SecureBank</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link btn btn-outline-light me-2" href="customerLogin.jsp">Customer Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-outline-light " href="employeeLogin.jsp">Employee Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero-section py-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h1 class="display-4 fw-bold text-primary">Welcome to SecureBank</h1>
                    <p class="lead">Your trusted partner for all banking needs</p>
                </div>
                <div class="col-md-6">
                    <img src="https://src.n-ix.com/uploads/2024/08/05/7f0b8224-9584-4711-bfbb-699b905930f8.webp" alt="Banking illustration" class="img-fluid rounded shadow">
                </div>
            </div>
        </div>
    </div>

    <!-- Features Section -->
    <div class="container py-5">
        <h2 class="text-center mb-5 text-primary">Our Services</h2>
        <div class="row g-4">
            <!-- Money Transfer -->
            <div class="col-md-6 col-lg-3">
                <div class="card h-100 shadow-sm feature-card">
                    <div class="card-body text-center">
                        <i class="fas fa-exchange-alt fa-3x text-primary mb-3"></i>
                        <h5 class="card-title">Money Transfer</h5>
                        <p class="card-text">Instant transfers to any account in less than 60 seconds</p>
                    </div>
                </div>
            </div>
            
            <!-- Loan Management -->
            <div class="col-md-6 col-lg-3">
                <div class="card h-100 shadow-sm feature-card">
                    <div class="card-body text-center">
                        <i class="fas fa-hand-holding-usd fa-3x text-primary mb-3"></i>
                        <h5 class="card-title">Loan Management</h5>
                        <p class="card-text">Easy loan applications with competitive interest rates</p>
                    </div>
                </div>
            </div>
            
            <!-- Online Banking -->
            <div class="col-md-6 col-lg-3">
                <div class="card h-100 shadow-sm feature-card">
                    <div class="card-body text-center">
                        <i class="fas fa-laptop fa-3x text-primary mb-3"></i>
                        <h5 class="card-title">Online Banking</h5>
                        <p class="card-text">Secure 24/7 access to your accounts</p>
                    </div>
                </div>
            </div>
            
            <!-- Customer Support -->
            <div class="col-md-6 col-lg-3">
                <div class="card h-100 shadow-sm feature-card">
                    <div class="card-body text-center">
                        <i class="fas fa-headset fa-3x text-primary mb-3"></i>
                        <h5 class="card-title">Customer Support</h5>
                        <p class="card-text">24/7 dedicated support team at your service</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-white py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>SecureBank</h5>
                    <p>Your trusted banking partner</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <p>� 2025 SecureBank. All rights reserved.</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>