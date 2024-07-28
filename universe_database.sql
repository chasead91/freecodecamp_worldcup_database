CREATE DATABASE universe;

\c universe;

CREATE TABLE galaxy (
    galaxy_id SERIAL NOT NULL PRIMARY KEY,
    galaxy_name VARCHAR(30) NOT NULL UNIQUE,
    distance_from_earth INT,
    mass_sm INT,
    diameter_ly NUMERIC
);

CREATE TABLE star (
    star_id SERIAL NOT NULL PRIMARY KEY,
    star_name VARCHAR(30) NOT NULL UNIQUE,
    star_type TEXT,
    temperature INT,
    milky_way BOOLEAN,
    galaxy_id INT,
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet (
    planet_id SERIAL NOT NULL PRIMARY KEY,
    planet_name VARCHAR(30) NOT NULL UNIQUE,
    planet_type VARCHAR(30),
    orbital_period_ed INT,
    solar_system BOOLEAN,
    star_id INT,
    FOREIGN KEY (star_id) REFERENCES star(star_id)
);

CREATE TABLE moon (
    moon_id SERIAL NOT NULL PRIMARY KEY,
    moon_name VARCHAR(30) NOT NULL UNIQUE,
    moon_type VARCHAR(30),
    radius_km NUMERIC,
    planet_id INT,
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);

CREATE TABLE constellation (
    constellation_id SERIAL NOT NULL PRIMARY KEY,
    constellation_name VARCHAR(30) NOT NULL UNIQUE,
    shape VARCHAR(30),
    brightest_star VARCHAR(30),
    star_id INT,
    FOREIGN KEY (star_id) REFERENCES star(star_id)
);

INSERT INTO galaxy (galaxy_name, distance_from_earth, mass_sm, diameter_ly) VALUES
    ('Andromeda', 300, 200, 2200),
    ('Mily Way', NULL, 2000, 1800),
    ('Triangulum', 300, 5000, 600),
    ('Whirlpool', 2300, 16000, 500),
    ('Sombrero', 2800, 8000, 500),
    ('Large Magellanic Cloud', 1600, 1000, 1400);

INSERT INTO star(star_name, galaxy_id, star_type, temperature, milky_way) VALUES
    ('Sun', 2, 'G2V', 5500, TRUE),
    ('Alpha Centauri A', 2, 'G2V', 5800, TRUE),
    ('Sirius A', 2, 'A1V', 9940, TRUE),
    ('Proxima Centauri', 2, 'M5.5Ve', 3050, TRUE),
    ('Betelgeuse', 2, 'M1-2Ia', 3500, TRUE),
    ('Rigel', 2, 'B8Ia', 11000, TRUE),
    ('Kepler-186', 2, 'M5.5Ve', 2400, TRUE),
    ('Gliese 581', 2, 'M3V', 3500, TRUE),
    ('HD 209458', 2, 'G0V', 5800, TRUE),
    ('TRAPPIST-1', 2, 'M8V', 2500, TRUE);

INSERT INTO planet (planet_name, star_id, planet_type, orbital_period_ed, solar_system) VALUES
    ('Mercury', 1, 'Terrestrial ', 88, TRUE),
    ('Venus', 1, 'Terrestrial', 225, TRUE),
    ('Earth', 1, 'Terrestrial', 365, TRUE),
    ('Mars', 1, 'Terrestrial', 687, TRUE),
    ('Jupiter', 1, 'Gas giant', 4344, TRUE),
    ('Saturn', 1, 'Gas giant', 10768, TRUE),
    ('Uranus', 1, 'Ice giant', 30660, TRUE),
    ('Neptune', 1, 'Ice giant', 60225, TRUE),
    ('Kepler-186f', 7, 'Terrestrial', 130, FALSE),
    ('Gliese 581g', 8, 'Terrestrial', 37, FALSE),
    ('HD 209458b', 9, 'Gas giant', 4, FALSE),
    ('TRAPPIST-1e', 10, 'Terrestrial', 6, FALSE),
    ('Pluto', 1, 'Dwarf', 90560, TRUE);

INSERT INTO moon (moon_name, planet_id, moon_type, radius_km) VALUES
    ('Luna', 3, 'Natural satellite', 1737),
    ('Phobos', 4, 'Natural satellite', 11.1),
    ('Deimos', 4, 'Natural satellite', 6.2),
    ('Europa', 5, 'Natural satellite', 1560),
    ('Io', 5, 'Natural satellite', 1821),
    ('Ganymede', 5, 'Natural satellite', 2634),
    ('Callisto', 5, 'Natural satellite', 2410),
    ('Titan', 6, 'Natural satellite', 2575),
    ('Enceladus', 6, 'Natural satellite', 252),
    ('Mimas', 6, 'Natural satellite', 198.2),
    ('Triton', 8, 'Natural satellite', 1353.4),
    ('Charon', 13, 'Natural satellite', 606),
    ('Phoebe', 6, 'Natural satellite', 106.6),
    ('Miranda', 7, 'Natural satellite', 235.8),
    ('Titania', 7, 'Natural satellite', 788.9),
    ('Oberon', 7, 'Natural satellite', 761.4),
    ('Ariel', 7, 'Natural satellite', 578.9),
    ('Umbriel', 7, 'Natural satellite', 584.7),
    ('Dione', 6, 'Natural satellite', 561.4),
    ('Rhea', 6, 'Natural satellite', 764.5);

INSERT INTO constellation (constellation_name, shape, brightest_star, star_id) VALUES
    ('Centaurus', 'Centaur', 'Alpha Centauri', 2),
    ('Canis Major', 'Dog', 'Sirius', 3),
    ('Orion', 'Hunter', 'Rigel', 5);