CREATE TABLE transactions (
  transaction_id INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
  account_id INT NOT NULL,
  transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  transaction_type CHAR(10) NOT NULL CHECK (transaction_type IN ('Deposit', 'Withdraw')),
  amount DECIMAL(15, 2) NOT NULL,
  performed_by INT,
  PRIMARY KEY (transaction_id)
);
