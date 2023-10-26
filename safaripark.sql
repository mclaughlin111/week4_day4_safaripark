DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS enclosure;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS assignment;



CREATE TABLE animal (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    age INT,
    enclosure_id INT REFERENCES enclosure(id)
);

CREATE TABLE enclosure (
    id SERIAL PRIMARY KEY REFERENCES animal(enclosure_id),
    name VARCHAR(255),
    capacity INT,
    closedForMaintenance BOOLEAN
);

CREATE TABLE staff (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    employeeNumber INT REFERENCES animal(id)
);

CREATE TABLE assignment (
    id SERIAL PRIMARY KEY,
    employeeId INT REFERENCES staff(id),
    enclosureId INT REFERENCES enclosure(id),
    day VARCHAR(255)
);

