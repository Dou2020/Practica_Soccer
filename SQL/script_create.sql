CREATE TABLE area (
    id INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE teams (
    wyId INT PRIMARY KEY,
    city NVARCHAR(100) NOT NULL,
    name NVARCHAR(100) NOT NULL,
    officialName NVARCHAR(150) NOT NULL,
    area_id INT,
    type NVARCHAR(50),
    FOREIGN KEY (area_id) REFERENCES area(id) ON DELETE SET NULL
);
CREATE TABLE roles (
    code NVARCHAR(3),
    name NVARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE players (
    wyId INT PRIMARY KEY,
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
    FOREIGN KEY (currentTeamId) REFERENCES teams(id) ON DELETE SET NULL,
    FOREIGN KEY (role_code) REFERENCES roles(code) ON DELETE SET NULL
);


CREATE TABLE events (
    id INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE subevents (
    id INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL UNIQUE
);