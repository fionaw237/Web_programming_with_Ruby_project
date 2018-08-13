DROP table IF EXISTS bookings;
DROP table IF EXISTS sessions;
DROP table IF EXISTS members;
DROP table IF EXISTS gym_classes;
DROP table IF EXISTS studios;

CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  member_type VARCHAR(255),
  phone_number VARCHAR(255),
  address VARCHAR(255),
  dob VARCHAR(255)
);

CREATE table gym_classes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  capacity INTEGER,
  description VARCHAR(255)
);

CREATE TABLE studios (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE sessions (
  id SERIAL PRIMARY KEY,
  day VARCHAR(255),
  start_time VARCHAR(255),
  end_time VARCHAR(255),
  spaces VARCHAR(255),
  gymclass_id INTEGER REFERENCES gym_classes(id) ON DELETE CASCADE,
  studio_id INTEGER REFERENCES studios(id) ON DELETE CASCADE
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  member_id INTEGER REFERENCES members(id) ON DELETE CASCADE,
  session_id INTEGER REFERENCES sessions(id) ON DELETE CASCADE
);
