CREATE TABLE IF NOT EXISTS vets (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30)
);

CREATE INDEX IF NOT EXISTS vets_idx1 on vets (
  last_name
);

CREATE TABLE IF NOT EXISTS specialties (
  id SERIAL PRIMARY KEY,
  name VARCHAR(80)
);

CREATE INDEX IF NOT EXISTS specialties_idx1 on specialties (
  name
);

CREATE TABLE IF NOT EXISTS vet_specialties (
  vet_id INTEGER NOT NULL REFERENCES vets(id),
  specialty_id INTEGER NOT NULL REFERENCES specialties(id),
  UNIQUE (vet_id,specialty_id)
);

CREATE TABLE IF NOT EXISTS types (
  id SERIAL PRIMARY KEY,
  name VARCHAR(80)
);

CREATE INDEX IF NOT EXISTS types_idx1 on types (
  name
);

CREATE TABLE IF NOT EXISTS owners (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  address VARCHAR(255),
  city VARCHAR(80),
  telephone VARCHAR(20)
);

CREATE INDEX IF NOT EXISTS owners_idx1 on owners (
  last_name
);

CREATE TABLE IF NOT EXISTS pets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30),
  birth_date DATE,
  type_id INTEGER NOT NULL REFERENCES types(id),
  owner_id INTEGER NOT NULL REFERENCES owners(id)
);

CREATE INDEX IF NOT EXISTS pets_idx1 on pets (
  name
);

CREATE TABLE IF NOT EXISTS visits (
  id SERIAL PRIMARY KEY,
  pet_id INTEGER NOT NULL REFERENCES pets(id),
  visit_date DATE,
  description VARCHAR(255)
);
