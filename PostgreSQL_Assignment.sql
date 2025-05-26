

CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(150),
    region VARCHAR(50)
);

INSERT INTO rangers(name, region) VALUES 
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range'),
('Jhankar Mahbub', 'Los Angeles');


CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(150),
    scientific_name VARCHAR(300),
    discovery_date DATE,
    conservation_status VARCHAR(50),
    CHECK (conservation_status IN ('Endangered', 'Vulnerable'))
);


INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status ) VALUES
('Show Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered'),
('Blue Whale', 'Balaenoptera musculus', '1758-01-01', 'Endangered');


CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY NOT NULL,
    ranger_id FOREIGN KEY(ranger_id) REFERENCES rangers(ranger_id),
    species_id FOREIGN KEY(species_id) REFERENCES species(species_id),
    sighting_time TIMESTAMP NOT NULL,
    location TEXT NOT NULL,
    notes TEXT
);

