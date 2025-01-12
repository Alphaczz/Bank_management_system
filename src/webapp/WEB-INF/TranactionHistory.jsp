<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.model.Transaction"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>Transaction ID</th>
				<th>Account ID</th>
				<th>Type</th>
				<th>Amount</th>
				<th>Date</th>
				<th>Performed By</th>
			</tr>
		</thead>
		<tbody>
			<% 
    List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
    if (transactions != null) {
        for (Transaction transaction : transactions) { 
    %>
			<tr>
				<td><%= transaction.getTransactionId() %></td>
				<td><%= transaction.getAccountId() %></td>
				<td><%= transaction.getTransactionType() %></td>
				<td><%= transaction.getAmount() %></td>
				<td><%= transaction.getTransactionDate() %></td>
				<td><%= transaction.getPerformedBy() != null ? transaction.getPerformedBy() : "Self-Service" %></td>
			</tr>
			<% 
        }
    } 
    %>
		</tbody>
	</table>
</body>
</html>