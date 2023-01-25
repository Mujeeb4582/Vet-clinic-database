DROP DATABASE IF EXISTS clinic;
CREATE DATABASE clinic;

-- Create the patient table
CREATE TABLE patient (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE NOT NULL
);

-- Create medical histories table
CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INTEGER NOT NULL REFERENCES patient(id) ON DELETE CASCADE,
  status VARCHAR(100)
);

-- Create the invoice table
CREATE TABLE invoice (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  total_amount DECIMAL(10,2) NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP NOT NULL,
  medical_history_id INTEGER NOT NULL REFERENCES medical_histories(id) ON UPDATE CASCADE
);

-- Create the treatments table
CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  type VARCHAR(100) NOT NULL,
  name VARCHAR(100) NOT NULL
);
-- Create the invoice_items table
CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  unit_price DECIMAL(10,2) NOT NULL,
  quantity INTEGER NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  invoice_id INTEGER NOT NULL REFERENCES invoice(id) ON UPDATE CASCADE,
  treatment_id INTEGER NOT NULL REFERENCES treatments(id) ON UPDATE CASCADE
);
-- Create the medical_treatment_histories table for many to many relationship
CREATE TABLE medical_treatment_histories (
  medical_history_id INT REFERENCES medical_histories(id) ON UPDATE CASCADE,
  treatment_id INT REFERENCES treatments(id) ON UPDATE CASCADE
);

-- Create Indexes on tables:
CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoices_items (invoice_id);
CREATE INDEX ON invoices_items (treatment_id);
CREATE INDEX ON medical_treatment_histories (medical_history_id);
CREATE INDEX ON medical_treatment_histories (treatment_id);