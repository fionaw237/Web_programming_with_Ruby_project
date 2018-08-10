DROP table IF EXISTS bookings;
DROP table IF EXISTS stagings;
DROP table IF EXISTS members;
DROP table IF EXISTS classes;
DROP table IF EXISTS studios;

CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  member_type VARCHAR(255),
  phone_number NUMERIC,
  address VARCHAR(255)
);

CREATE table classes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255)
);

CREATE TABLE studios (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE stagings (
  id SERIAL PRIMARY KEY,
  start_time VARCHAR(255),
  end_time VARCHAR(255),
  spaces VARCHAR(255),
  class_id INTEGER REFERENCES classes(id) ON DELETE CASCADE,
  studio_id INTEGER REFERENCES studios(id) ON DELETE CASCADE
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  member_id INTEGER REFERENCES members(id) ON DELETE CASCADE,
  staging_id INTEGER REFERENCES stagings(id) ON DELETE CASCADE
);
