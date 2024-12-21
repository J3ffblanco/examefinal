DROP TABLE IF EXISTS Asignaciones;
DROP TABLE IF EXISTS Proyectos;
DROP TABLE IF EXISTS Empleados;
GO

CREATE TABLE Empleados (
    Id INT IDENTITY PRIMARY KEY,
    NumeroCarnet VARCHAR(20) UNIQUE NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Categoria VARCHAR(20) CHECK (Categoria IN ('Administrador', 'Operario', 'Peón')),
    Salario DECIMAL(10, 2) DEFAULT 250000 CHECK (Salario BETWEEN 250000 AND 500000),
    Direccion VARCHAR(200) DEFAULT 'San José',
    Telefono VARCHAR(15),
    Correo VARCHAR(100) UNIQUE NOT NULL
);
GO

CREATE TABLE Proyectos (
    Id INT IDENTITY PRIMARY KEY,
    Codigo VARCHAR(20) UNIQUE NOT NULL,
    Nombre VARCHAR(100) UNIQUE NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE
);
GO

CREATE TABLE Asignaciones (
    Id INT IDENTITY PRIMARY KEY,
    EmpleadoId INT FOREIGN KEY REFERENCES Empleados(Id),
    ProyectoId INT FOREIGN KEY REFERENCES Proyectos(Id),
    FechaAsignacion DATE NOT NULL
);
GO
