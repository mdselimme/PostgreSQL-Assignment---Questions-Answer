
--CREATE DATABASE
CREATE DATABASE conservation_db;

-- CREATE rangers TABLE
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(150),
    region VARCHAR(50)
);

--INSERT rangers TABLES DATA
INSERT INTO rangers(name, region) VALUES 
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range'),
('Jhankar Mahbub', 'Los Angeles');

--CREATE species TABLE
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(150),
    scientific_name VARCHAR(300),
    discovery_date DATE,
    conservation_status VARCHAR(50),
    CHECK (conservation_status IN ('Endangered', 'Vulnerable'))
);

--INSERT species TABLE DATA
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status ) VALUES
('Show Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');
-- ('Blue Whale', 'Balaenoptera musculus', '1758-01-01', 'Endangered');

--CREATE sightings TABLE
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY NOT NULL,
    ranger_id INTEGER REFERENCES rangers(ranger_id),
    species_id INTEGER REFERENCES species(species_id),
    location TEXT NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    notes TEXT
);

DROP TABLE rangers;
DROP TABLE species;
DROP TABLE sightings;

SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;

--INSERT DATA sightings TABLE
INSERT INTO sightings(ranger_id, species_id,location, sighting_time, notes) VALUES
(1,1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2,2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3,3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1,2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

--Problem #1 Solve
INSERT INTO rangers(name, region) VALUES 
('Derek Fox', 'Coastal Plains');

--Problem #2 Solve


--Problem #3 Solve
SELECT * FROM sightings WHERE location ILIKE '%Pass%';
