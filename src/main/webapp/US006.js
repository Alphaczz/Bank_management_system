// JavaScript source code
const slider = document.getElementById("inputLDur");
const durationVal = document.getElementById("durationVal");
const loanCategory = document.getElementById("inputLCategory");
const loanIntRate = document.getElementById("inputLIntR");
const submit_btn = document.getElementById("submit_btn");
const loan_amt = document.getElementById("inputLAmt");
const totalAmount = document.getElementById("total-amount");
const emiAmount = document.getElementById("emi-amount");
const emiContainer = document.getElementById("emi-container");
const totIntP = document.getElementById("total-interest-payable");
const totAmtP = document.getElementById("total-amount-payable");

const loanDetails = {
  Personal: {
    interestRate: 10.5,
    duration: { min: 6, max: 60, unit: "months" },
  },
  Gold: { interestRate: 12, duration: { min: 6, max: 60, unit: "months" } },
  Home: { interestRate: 8.4, duration: { min: 5, max: 30, unit: "years" } },
  Motorcycle: {
    interestRate: 9,
    duration: { min: 10, max: 84, unit: "months" },
  },
  Car: { interestRate: 10, duration: { min: 10, max: 84, unit: "months" } },
};

// Update loan details based on selected category
loanCategory.addEventListener("change", function () {
  const selectedCategory = loanCategory.value;

  if (selectedCategory === "Choose Category") {
    loanIntRate.value = "";
    slider.min = 0;
    slider.max = 0;
    slider.value = 0;
    durationVal.textContent = "";
    emiContainer.style.display = "none";
    return;
  }

  const details = loanDetails[selectedCategory];
  loanIntRate.value = details.interestRate;
  slider.min = details.duration.min;
  slider.max = details.duration.max;
  slider.value = details.duration.min;
  updateDurationDisplay(slider.value, details.duration.unit);
});

loanCategory.addEventListener("change", function () {
  const selectedCategory = loanCategory.value;
  updateSubmitDisplay(selectedCategory);
});

function updateSubmitDisplay(selectedCategory) {
  if (selectedCategory == "Choose Category") {
    submit_btn.textContent = `${"Apply Now"}`;
  } else {
    submit_btn.textContent = `${"Apply for"} ${selectedCategory} ${"loan"}`;
  }
}

// Update duration display when slider value changes
slider.addEventListener("input", function () {
  const selectedCategory = loanCategory.value;
  const unit = loanDetails[selectedCategory]?.duration.unit || "years";
  updateDurationDisplay(slider.value, unit);
});

function updateDurationDisplay(value, unit) {
  durationVal.textContent = `${value} ${unit}`;
}

// Prevent form submission
document
  .getElementById("customer-form")
  .addEventListener("submit", function (event) {
    event.preventDefault();
  });

// EMI Calculation Function
function calculateEMI(loanAmount, interestRate, tenure) {
  const monthlyRate = interestRate / 12 / 100;
  const tenureMonths =
    tenure.unit === "years" ? tenure.value * 12 : tenure.value;

  const emi =
    (loanAmount * monthlyRate * Math.pow(1 + monthlyRate, tenureMonths)) /
    (Math.pow(1 + monthlyRate, tenureMonths) - 1);

  return Math.round(emi);
}

// Update EMI dynamically
document.getElementById("customer-form").addEventListener("input", function () {
  const selectedCategory = loanCategory.value;
  const loanAmount = Number(loan_amt.value);
  const interestRate = Number(loanIntRate.value);
  const durationValue = Number(slider.value);

  const details = loanDetails[selectedCategory];

  if (loanAmount > 0 && interestRate > 0 && loanDetails[selectedCategory]) {
    const duration = { value: durationValue, unit: details.duration.unit };

    const emi = calculateEMI(loanAmount, interestRate, duration);

    // Calculate total interest
    const tenureMonths =
      duration.unit === "years" ? duration.value * 12 : duration.value;
    const totalInterest = emi * tenureMonths - loanAmount;
    const totalAmountP = loanAmount + totalInterest;

    totalAmount.textContent = `₹${loanAmount.toLocaleString()}`;
    emiAmount.textContent = `₹${Number(emi).toLocaleString()}${"*"}`;
    totIntP.textContent = `₹${totalInterest.toLocaleString()}`;
    totAmtP.textContent = `₹${totalAmountP.toLocaleString()}`;
    emiContainer.style.display = "block";
  } else {
    emiContainer.style.display = "none";
  }
});

// Trigger initial update
loanCategory.dispatchEvent(new Event("change"));
