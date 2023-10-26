DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS enclosure;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS assignment;

CREATE TABLE enclosure (
    id SERIAL PRIMARY KEY, --REFERENCES animal(enclosure_id),
    name VARCHAR(255),
    capacity INT,
    closedForMaintenance BOOLEAN
);

CREATE TABLE staff (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    employeeNumber INT --REFERENCES animal(id)
);

CREATE TABLE animal (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    age INT,
    enclosure_id INT REFERENCES enclosure(id)
);


CREATE TABLE assignment (
    id SERIAL PRIMARY KEY,
    employeeId INT, --REFERENCES staff(id),
    enclosureId INT, --REFERENCES enclosure(id),
    day VARCHAR(255)
);
INSERT INTO enclosure (name, capacity, closedForMaintenance) VALUES ('big cat field', 20, 'FALSE');
INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Tony', 'Tiger', 59, 1);



INSERT INTO staff (name, employeeNumber) VALUES ('Captain Rik', 12345);

INSERT INTO assignment (employeeId, enclosureId, day) VALUES (1, 1, 'Tuesday');