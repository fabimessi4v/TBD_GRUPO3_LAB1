--
-- CREACIÓN DE TABLAS - PELUQUERÍA
--
--

-- 1. Comuna (tabla base)
CREATE TABLE Comuna (
    IdComuna SERIAL PRIMARY KEY,
    NombreComuna VARCHAR(100),
    ProvinciaComuna VARCHAR(100),
    RegionComuna VARCHAR(100)
);

-- 2. Peluqueria
CREATE TABLE Peluqueria (
    IdPeluqueria SERIAL PRIMARY KEY,
    NombrePeluqueria VARCHAR(150),
    Direccion VARCHAR(200),
    IdComuna INT NOT NULL,
    FOREIGN KEY (IdComuna) REFERENCES Comuna(IdComuna)
);

-- 3. Cliente
CREATE TABLE Cliente (
    IdCliente SERIAL PRIMARY KEY,
    RutCliente VARCHAR(12) UNIQUE,
    NombreCliente VARCHAR(100),
    ApellidoCliente VARCHAR(100),
    Sexo CHAR(1) CHECK (Sexo IN ('M','F')),
    Telefono VARCHAR(15),
    Correo VARCHAR(100),
    IdComuna INT,
    FOREIGN KEY (IdComuna) REFERENCES Comuna(IdComuna)
);

-- 4. Empleado
CREATE TABLE Empleado (
    IdEmpleado SERIAL PRIMARY KEY,
    RutEmpleado VARCHAR(12) UNIQUE,
    NombreEmpleado VARCHAR(100),
    ApellidoEmpleado VARCHAR(100),
    Cargo VARCHAR(50),
    IdComuna INT,
    IdPeluqueria INT NOT NULL,
    FOREIGN KEY (IdComuna) REFERENCES Comuna(IdComuna),
    FOREIGN KEY (IdPeluqueria) REFERENCES Peluqueria(IdPeluqueria)
);

-- 5. Sueldo
CREATE TABLE Sueldo (
    IdSueldo SERIAL PRIMARY KEY,
    Monto NUMERIC(12,2),
    FechaPago DATE,
    IdEmpleado INT NOT NULL,
    FOREIGN KEY (IdEmpleado) REFERENCES Empleado(IdEmpleado)
);

-- 6. Cliente_Pelu
CREATE TABLE Cliente_Pelu (
    IdCliente INT NOT NULL,
    IdPeluqueria INT NOT NULL,
    FechaRegistro DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (IdCliente, IdPeluqueria),
    FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente),
    FOREIGN KEY (IdPeluqueria) REFERENCES Peluqueria(IdPeluqueria)
);

-- 7. Horario
CREATE TABLE Horario (
    IdHorario SERIAL PRIMARY KEY,
    HoraInicio TIME,
    HoraFin TIME
);

-- 8. Cita
CREATE TABLE Cita (
    IdCita SERIAL PRIMARY KEY,
    IdCliente INT NOT NULL,
	IdPeluqueria INT NOT NULL,
    IdHorario INT NOT NULL,
    FechaCita DATE,
    DuracionMinutos INT,
    FOREIGN KEY (IdCliente, IdPeluqueria) REFERENCES Cliente_Pelu(IdCliente, IdPeluqueria),
    FOREIGN KEY (IdHorario) REFERENCES Horario(IdHorario)
);

-- 9. Empleado_Cita
CREATE TABLE Empleado_Cita (
    IdEmpleado INT NOT NULL,
    IdCita INT NOT NULL,
    PRIMARY KEY (IdEmpleado, IdCita),
    FOREIGN KEY (IdEmpleado) REFERENCES Empleado(IdEmpleado),
    FOREIGN KEY (IdCita) REFERENCES Cita(IdCita)
);

-- 10. Servicio
CREATE TABLE Servicio (
    IdServicio SERIAL PRIMARY KEY,
    NombreServicio VARCHAR(100),
    Descripcion TEXT,
    Precio NUMERIC(12,2)
);

-- 11. Producto
CREATE TABLE Producto (
    IdProducto SERIAL PRIMARY KEY,
    NombreProducto VARCHAR(100),
    Descripcion TEXT,
    Precio NUMERIC(12,2)
);

-- 12. Detalle (ANTES de Pago)
CREATE TABLE Detalle (
    IdDetalle SERIAL PRIMARY KEY,
    IdCita INT NOT NULL,
    IdServicio INT,
    IdProducto INT,
    Cantidad INT DEFAULT 1,
    PrecioUnitario NUMERIC(12,2),
    FOREIGN KEY (IdCita) REFERENCES Cita(IdCita),
    FOREIGN KEY (IdServicio) REFERENCES Servicio(IdServicio),
    FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto)
);

-- 13. Pago (DESPUÉS de Detalle)
CREATE TABLE Pago (
    IdPago SERIAL PRIMARY KEY,
    IdDetalle INT NOT NULL,
    Monto NUMERIC(12,2),
    FechaPago DATE DEFAULT CURRENT_DATE,
    MetodoPago VARCHAR(50),
    FOREIGN KEY (IdDetalle) REFERENCES Detalle(IdDetalle)
);