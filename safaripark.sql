DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS enclosure;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS assignment;



CREATE TABLE staff (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    employeeNumber INT --REFERENCES animal(id)
);

CREATE TABLE enclosure (
    id SERIAL PRIMARY KEY REFERENCES staff(id), --REFERENCES animal(enclosure_id),
    name VARCHAR(255),
    capacity INT,
    closedForMaintenance BOOLEAN
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
INSERT INTO enclosure (name, capacity, closedForMaintenance) VALUES ('tiger playground', 20, 'FALSE');
INSERT INTO enclosure (name, capacity, closedForMaintenance) VALUES ('platypus pen', 20, 'TRUE');


INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Tony', 'Tiger', 59, 1);
INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Bob the Platypus', 'Platypus', 60, 3);
INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Choock the Chicken', 'Chicken', 5, 1);


INSERT INTO staff (name, employeeNumber) VALUES ('Captain Rik', 12345);
INSERT INTO staff (name, employeeNumber) VALUES ('Joe Exotic', 23456);
INSERT INTO staff (name, employeeNumber) VALUES ('Carol Baskin', 34565);

INSERT INTO assignment (employeeId, enclosureId, day) VALUES (1, 1, 'Tuesday');
INSERT INTO assignment (employeeId, enclosureId, day) VALUES (2, 1, 'Tuesday');
INSERT INTO assignment (employeeId, enclosureId, day) VALUES (3, 1, 'Tuesday');

-- POSTICO ENQUIRIES:

-- SELECT animal.name, enclosure.name FROM animal LEFT JOIN enclosure ON animal.enclosure_id = enclosure.id;

-- 