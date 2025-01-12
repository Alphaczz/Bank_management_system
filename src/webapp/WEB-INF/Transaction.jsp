<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transaction</title>
</head>
<body>
<form action="TransactionServlet" method="post">
    <input type="hidden" name="accountId" value="<%= session.getAttribute("accountId") %>">
    <div class="mb-3">
        <label for="transactionType" class="form-label">Transaction Type</label>
        <select class="form-select" id="transactionType" name="transactionType" required>
            <option value="Deposit">Deposit</option>
            <option value="Withdraw">Withdraw</option>
        </select>
    </div>
    <div class="mb-3">
        <label for="amount" class="form-label">Amount</label>
        <input type="number" step="0.01" class="form-control" id="amount" name="amount" required>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>

</body>
</html>