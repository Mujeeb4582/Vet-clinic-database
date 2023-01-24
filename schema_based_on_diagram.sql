DROP DATABASE IF EXISTS clinic;
CREATE DATABASE clinic;

-- Create the patient table
CREATE TABLE patient (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE NOT NULL,
);

-- Create medical histories table
CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INTEGER NOT NULL REFERENCES patient(id) ON DELETE CASCADE,
  status VARCHAR(100),
);

-- Create the invoice table
CREATE TABLE invoice (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  total_amount DECIMAL(10,2) NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP NOT NULL,
  medical_history_id INTEGER NOT NULL REFERENCES medical_histories(id) ON UPDATE CASCADE,
);

