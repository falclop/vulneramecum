-- Crear la base de datos
CREATE DATABASE VulnerabilityDB;
GO

-- Usar la base de datos recién creada
USE VulnerabilityDB;
GO

-- Tabla principal de vulnerabilidades
CREATE TABLE Vulnerabilities (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    Language NVARCHAR(50) NOT NULL,       -- Ej: 'C#', 'JavaScript'
    Severity NVARCHAR(20) NOT NULL,       -- Ej: 'Alta', 'Media', 'Baja'
    Description NVARCHAR(MAX) NOT NULL,
    Solution NVARCHAR(MAX) NOT NULL
);
GO

-- Tabla de imágenes relacionadas con vulnerabilidades
CREATE TABLE VulnerabilityImages (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    VulnerabilityId INT NOT NULL,
    ImagePath NVARCHAR(300) NOT NULL,
    Caption NVARCHAR(200) NULL,
    OrderIndex INT NULL,

    CONSTRAINT FK_VulnerabilityImages_Vulnerabilities FOREIGN KEY (VulnerabilityId)
        REFERENCES Vulnerabilities(Id)
        ON DELETE CASCADE
);
GO

-- Tabla de ejemplos prácticos
CREATE TABLE Examples (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    VulnerabilityId INT NOT NULL,
    PropertyName NVARCHAR(100) NOT NULL,
    ClassName NVARCHAR(100) NOT NULL,
    CommitHash NVARCHAR(100) NOT NULL,
    CommitDate DATE NOT NULL,  -- Solo fecha

    CONSTRAINT FK_Examples_Vulnerabilities FOREIGN KEY (VulnerabilityId)
        REFERENCES Vulnerabilities(Id)
        ON DELETE CASCADE
);
GO
