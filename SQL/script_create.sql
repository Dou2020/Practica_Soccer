CREATE DATABASE practica_soccer;

USE practica_soccer


CREATE TABLE teams (
    wyId INT PRIMARY KEY,
    city NVARCHAR(100) NOT NULL,
    name NVARCHAR(100) NOT NULL,
    officialName NVARCHAR(150) NOT NULL,
);
CREATE TABLE role (
    code2 NVARCHAR(3) PRIMARY KEY,
    code3 NVARCHAR(4) NOT NULL UNIQUE,
    name NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE area(
    alpha2code NVARCHAR(2) PRIMARY KEY,
    alpha3code NVARCHAR(3) NOT NULL UNIQUE,
    name NVARCHAR(30)
);

CREATE TABLE areaPassport(
    id INT PRIMARY KEY,
    areaPassportId NVARCHAR(2) NOT NULL,
    FOREIGN KEY(areaPassportId) REFERENCES area(alpha2code)
);


CREATE TABLE players (
    wyId INT PRIMARY KEY,
    areaPassportId INT NOT NULL UNIQUE,
    firstName NVARCHAR(100) NOT NULL,
    middleName NVARCHAR(100),
    lastName NVARCHAR(100) NOT NULL,
    shortName NVARCHAR(50),
    birthDate DATE NOT NULL,
    height DECIMAL(5,2),  -- Ejemplo: 1.85 metros
    weight DECIMAL(5,2),  -- Ejemplo: 75.5 kg
    role_code NVARCHAR(3),
    foot NVARCHAR(10),  -- Pie dominante (izquierdo, derecho, ambos)
    currentTeamId INT,
    FOREIGN KEY (areaPassportId) REFERENCES areaPassport(id) ON DELETE SET NULL,
    FOREIGN KEY (currentTeamId) REFERENCES teams(id) ON DELETE SET NULL,
    FOREIGN KEY (role_code) REFERENCES roles(code) ON DELETE SET NULL
);


CREATE TABLE events (
    id INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE subevents (
    subEventId INT PRIMARY KEY,
    subEventName NVARCHAR(100) NOT NULL UNIQUE
);