/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL(10,2) NOT NULL
);

ALTER TABLE animals ADD COLUMN species VARCHAR(50);

--- Create owners table
CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(100),
    age INT  
);

--- Create the species table
CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100)
);

--- Modify the animals table
ALTER TABLE animals
DROP COLUMN species,
ADD COLUMN species_id INT,
ADD COLUMN owner_id INT,
ADD FOREIGN KEY (species_id) REFERENCES species(id),
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

-- Create the vets table 
CREATE TABLE vets (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INTEGER NOT NULL,
    date_of_graduation DATE NOT NULL
);

-- Create the specializations table to relate the vet and species tables
CREATE TABLE specializations (
    id SERIAL PRIMARY KEY,
    vet_id INTEGER REFERENCES vets(id) ON UPDATE CASCADE ON DELETE CASCADE,
    species_id INTEGER REFERENCES species(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the visits table to relate the vet and animals tables
CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    animal_id INTEGER REFERENCES animals(id) ON UPDATE CASCADE ON DELETE CASCADE,
    vet_id INTEGER REFERENCES vets(id) ON UPDATE CASCADE ON DELETE CASCADE,
    visit_date DATE NOT NULL
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Creating indexes
-- SELECT COUNT(*) FROM visits where animal_id = 4;
CREATE INDEX visits_animal_id_asc ON visits(animal_id ASC);
-- SELECT * FROM visits where vet_id = 2;
CREATE INDEX visits_vet_id ON visits(vet_id);
-- SELECT * FROM owners where email = 'owner_18327@mail.com';
CREATE INDEX owners_email_id ON owners(email);

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