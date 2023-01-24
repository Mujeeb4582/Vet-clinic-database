DROP DATABASE IF EXISTS clinic;
CREATE DATABASE clinic;

-- Add the patient table
CREATE TABLE patient (
  patient_id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE NOT NULL,
);