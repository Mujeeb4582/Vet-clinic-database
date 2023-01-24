DROP DATABASE IF EXISTS clinic;
CREATE DATABASE clinic;

-- Add the patient table
CREATE TABLE patient (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE NOT NULL,
);

-- Add medical histories table
CREATE TABLE medical_histories (
  id INTEGER NOT NULL PRIMARY KEY,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INTEGER NOT NULL REFERENCES patient(id) ON DELETE CASCADE,
  status VARCHAR(100),
);

