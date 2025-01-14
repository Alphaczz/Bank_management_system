<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Transfer Funds</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #fff;
            color: black;
        }
        .card {
            background-color:#d1e3e8 ;
            border: none;
        }
        .btn-primary {
            background-color: #0387DE;
            border-color: #2196F3;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="card">
            <div class="card-body">
                <h3 class="card-title">Transfer Funds</h3>
                
                <form action="transaction" method="post" onsubmit="return validateForm()">
                    <input type="hidden" name="action" value="transfer">
                    
                    <div class="mb-3">
                        <label for="fromAccount" class="form-label">From Account</label>
                        <input type="text" class="form-control" id="fromAccount" name="fromAccount" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="toAccount" class="form-label">To Account</label>
                        <input type="text" class="form-control" id="toAccount" name="toAccount" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="amount" class="form-label">Amount</label>
                        <input type="number" class="form-control" id="amount" name="amount" 
                               min="0.01" step="0.01" required>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Transfer</button>
                </form>
            </div>
        </div>
    </div>
    
    <script>
    function validateForm() {
        var fromAccount = document.getElementById("fromAccount").value;
        var toAccount = document.getElementById("toAccount").value;
        var amount = document.getElementById("amount").value;
        
        if (fromAccount === toAccount) {
            alert("From and To accounts cannot be the same!");
            return false;
        }
        
        if (amount <= 0) {
            alert("Amount must be greater than 0!");
            return false;
        }
        
        return true;
    }
    </script>
</body>
</html>