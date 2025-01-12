<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Loan Request</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <nav
      class="navbar navbar-expand-sm bg-light navbar-light"
      style="margin-bottom: 20px"
    >
      <div class="container-fluid">
        <a
          class="navbar-brand"
          href="US007.jsp"
        >
          <img
            src="logo.jpg"
            alt="Bank Logo"
            style="width: 80px"
            class="rounded-pill"
          />
          <span
            class="navbar-text text-dark"
            style="font-style: bold; color: black; font-size: 25px"
            ><strong>Loan Management</strong></span
          >
        </a>
      </div>
    </nav>

    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div
            class="row"
            id="emi-container"
            style="display: none; border: 1px solid #ddd; margin-top: 20px; border-radius: 8px; background-color: #f8f9fa; text-align: center;"
          >
            <h5 style="margin: 10px; color: #333;">Your loan calculations are:</h5>
            <p>Total Principal Amount: <span id="total-amount" style="font-weight: bold; color: #007bff;">₹0</span></p>
            <p>Total Interest Payable: <span id="total-interest-payable" style="font-weight: bold; color: #007bff;">₹0</span></p>
            <p>Total Amount Payable: <span id="total-amount-payable" style="font-weight: bold; color: #007bff;">₹0</span></p>
            <h5 style="margin-bottom: 5px; color: #333; font-weight: bold;">EMI: <span id="emi-amount">₹0</span></h5>
            <p style="font-weight: lighter; font-style: italic; margin-top: 10px;">
              <span style="font-weight: bold; font-style: italic;">Disclaimer*:</span>
              Our Loan EMI calculator offers estimated monthly installments which are indicative and tentative and are based upon the details populated by the user. Actual loan terms and eligibility are subject to bank approval. For precise loan details, consult our representatives before decisions based on these estimates.
            </p>
          </div>
        </div>
        <div class="col-md-6">
          <form class="row g-1" id="customer-form">
            <div class="row">
              <div class="col-md-6">
                <label for="inputLCategory" class="form-label">Loan Category</label>
                <select id="inputLCategory" class="form-select">
                  <option selected>Choose Category</option>
                  <option>Home</option>
                  <option>Car</option>
                  <option>Motorcycle</option>
                  <option>Gold</option>
                  <option>Personal</option>
                </select>
              </div>
              <div class="col-md-6">
                <label for="inputLIntR" class="form-label">Interest Rate (%)</label>
                <input
                  type="text"
                  class="form-control"
                  id="inputLIntR"
                  required
                  min="0"
                  disabled
                />
              </div>
            </div>
            <div class="row" style="margin-top: 20px">
              <div class="col-md-6">
                <label for="inputCInc" class="form-label">Monthly Income</label>
                <input
                  type="number"
                  class="form-control"
                  id="inputCInc"
                  required
                  min="0"
                />
              </div>
              <div class="col-md-6">
                <label for="inputLAmt" class="form-label">Loan Amount</label>
                <input
                  type="number"
                  class="form-control"
                  id="inputLAmt"
                  required
                  min="0"
                  value="500000"
                />
              </div>
              <div class="col-md-6" style="margin-top: 20px">
                <label for="inputLDur" class="form-label">Loan Duration</label>
                <input type="range" class="form-range" id="inputLDur" />
                <span id="durationVal"></span>
              </div>
            </div>
            <div class="row" style="margin-top: 10px; margin-bottom: 20px; text-align: center">
              <div class="col-12">
                <button
                  type="submit"
                  class="btn btn-primary"
                  style="width: 250px; margin-top: 28px;"
                  id="submit_btn"
                >
                  Apply
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
    <script src="<%= request.getContextPath() %>/US006.js"></script>
  </body>
</html>
