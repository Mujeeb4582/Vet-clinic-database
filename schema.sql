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

-- Create the specializations table to relete the vet and species tables
CREATE TABLE specializations (
    id SERIAL PRIMARY KEY,
    vet_id INTEGER REFERENCES vets(id) ON UPDATE CASCADE ON DELETE CASCADE,
    species_id INTEGER REFERENCES species(id) ON UPDATE CASCADE ON DELETE CASCADE
);

