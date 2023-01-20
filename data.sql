/* Populate database with sample data. */
INSERT INTO
  animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  ('Agumon', '2020-02-03', 0, true, 10.23),
  ('Gabumon', '2018-11-15', 2, true, 8),
  ('Pikachu', '2021-01-07', 1, false, 15.04),
  ('Devimon', '2017-05-12', 5, true, 11.00);

INSERT INTO
  animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES
  ('Charmander', '2020-02-08', 0, false, -11.00),
  ('Plantmon', '2021-11-15', 2, true, -5.70),
  ('Squirtle', '1993-04-02', 3, false, -12.13),
  ('Angemon', '2005-06-12', 1, true, -45.00),
  ('Boarmon', '2005-06-07', 7, true, 20.40),
  ('Blossom', '1998-10-13', 3, true, 17.00),
  ('Ditto', '2022-05-14', 4, true, 22.00);

--- Insert data into the owners table
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

  -- Insert data into the species table
INSERT INTO species (name) 
VALUES ('Pokemon'),
  ('Digimon');

-- Update the animals table with species_id information
UPDATE animals
SET species_id = (
    SELECT id FROM species WHERE name = (
        CASE
            WHEN animals.name LIKE '%mon' THEN 'Digimon'
            ELSE 'Pokemon'
        END
    )
);

-- Update the animals table with owner_id information
UPDATE animals 
SET owner_id = (
    SELECT id 
    FROM owners 
    WHERE full_name = (
        CASE animals.name 
            WHEN 'Agumon' THEN 'Sam Smith' 
            WHEN 'Gabumon' THEN 'Jennifer Orwell' 
            WHEN 'Pikachu' THEN 'Jennifer Orwell' 
            WHEN 'Devimon' THEN 'Bob' 
            WHEN 'Plantmon' THEN 'Bob' 
            WHEN 'Charmander' THEN 'Melody Pond' 
            WHEN 'Squirtle' THEN 'Melody Pond' 
            WHEN 'Blossom' THEN 'Melody Pond' 
            WHEN 'Angemon' THEN 'Dean Winchester' 
            WHEN 'Boarmon' THEN 'Dean Winchester' 
        END
    )
);

-- insert the specified data into the vets table
INSERT INTO vets (name, age, date_of_graduation)
VALUES
    ('William Tatcher', 45, '2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'),
    ('Jack Harkness', 38, '2008-06-08');

