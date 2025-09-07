--
-- POBLACIÓN DE TABLAS - PELUQUERÍA
--

-- 1) COMUNA
INSERT INTO Comuna (NombreComuna, ProvinciaComuna, RegionComuna) VALUES
('Santiago Centro','Santiago','Metropolitana'),
('Providencia','Santiago','Metropolitana'),
('Ñuñoa','Santiago','Metropolitana'),
('Maipú','Santiago','Metropolitana'),
('Las Condes','Santiago','Metropolitana');

-- 2) PELUQUERIA
INSERT INTO Peluqueria (NombrePeluqueria, Direccion, IdComuna) VALUES
('Estilo Chic','Av. Principal 123',1),
('Look & Style','Av. Providencia 1450',2),
('Belleza Total','Diagonal Oriente 789',3);

-- 3) CLIENTE
INSERT INTO Cliente (RutCliente,NombreCliente,ApellidoCliente,Sexo,Telefono,Correo,IdComuna) VALUES
('11.111.111-1','Ana','Pérez','F','987654321','ana@gmail.com',1),
('22.222.222-2','Carlos','Soto','M','912345678','carlos@gmail.com',1),
('33.333.333-3','María','Torres','F','945612378','maria@gmail.com',2),
('44.444.444-4','Diego','Rojas','M','934567890','diego@gmail.com',3),
('55.555.555-5','Lucía','Fernández','F','987111222','lucia@gmail.com',2),
('66.666.666-6','Mateo','Ramírez','M','954333444','mateo@gmail.com',3),
('77.777.777-7','Valentina','Gómez','F','912555666','valentina@gmail.com',1),
('88.888.888-9','Andrés','Morales','M','943777888','andres@gmail.com',2),
('99.999.999-9','Camila','Fuentes','F','932999000','camila@gmail.com',1);

-- 4) EMPLEADO
-- Peluquería 1: 1-4 | Peluquería 2: 5-6 | Peluquería 3: 7-8
INSERT INTO Empleado (RutEmpleado,NombreEmpleado,ApellidoEmpleado,Cargo,IdComuna,IdPeluqueria) VALUES
('7.776.777-2','Laura','Méndez','Peluquero',1,1),
('15.666.666-6','Pedro','Díaz','Peluquero',1,1),
('19.777.777-7','Juan','Díaz','Peluquero',1,1),
('20.777.777-7','Sofía','Herrera','Peluquero',1,1),
('15.888.888-8','Tomás','Luna','Peluquero',2,2),
('12.888.888-8','Noemí','San Martín','Peluquero',2,2),
('20.111.111-7','Camila','Vega','Asistente',3,3),
('21.111.121-6','Catalina','Luna','Peluquero',3,3);

-- 5) SUELDO
INSERT INTO Sueldo (Monto,FechaPago,IdEmpleado) VALUES
(750000,'31-08-2025',1),
(500000,'31-08-2025',2),
(780000,'31-08-2025',3),
(800000,'31-08-2025',4),
(770000,'31-08-2025',5),
(760000,'31-08-2025',6),
(520000,'31-08-2025',7),
(790000,'31-08-2025',8);

-- 6) CLIENTE_PELU
INSERT INTO Cliente_Pelu (IdCliente,IdPeluqueria,FechaRegistro) VALUES
(1,1,'20-08-2015'),
(2,1,'15-02-2015'),
(3,2,'10-11-2015'),
(1,2,'05-05-2015'),
(5,2,'22-09-2015'),
(6,3,'30-01-2015'),
(7,1,'12-03-2015'),
(8,2,'19-07-2015'),
(9,1,'25-12-2015'),
(4,3,'08-06-2015'),
(3,1,'14-04-2015'),
(4,1,'09-09-2015'),
(6,2,'17-01-2015'),
(7,2,'02-08-2015'),
(9,2,'11-11-2015'),
(1,3,'21-03-2015'),
(2,3,'06-07-2015'),
(3,3,'16-12-2015'),
(4,2,'01-02-2015'),
(5,3,'20-08-2015'),
(5,1,'20-08-2015'),
(6,1,'20-08-2015'),
(8,1,'20-08-2015');

-- 7) HORARIO
INSERT INTO Horario (HoraInicio,HoraFin) VALUES
('09:00','10:00'),  -- 1
('10:00','11:00'),  -- 2
('11:30','12:30'),  -- 3
('15:00','16:00'),  -- 4
('16:00','17:00');  -- 5

-- 8) CITA
INSERT INTO Cita (IdCliente, IdPeluqueria, IdHorario, FechaCita, DuracionMinutos) VALUES
(1,1,1,'02-09-2025',60),  -- 1  Ana Estilo Chic (09:00-10:00)
(2,1,2,'02-09-2025',60),  -- 2  Carlos Estilo Chic (10:00-11:00)
(3,2,4,'03-09-2025',60),  -- 3  María Look & Style (15:00-16:00)
(1,2,5,'04-09-2025',60),  -- 4  Ana Look & Style (16:00-17:00)
(5,2,1,'05-09-2025',60),  -- 5  Lucía Look & Style (09:00-10:00)
(6,3,2,'05-09-2025',60),  -- 6  Mateo Belleza Total (10:00-11:00)
(7,1,3,'05-09-2025',60),  -- 7  Valentina Estilo Chic (11:30-12:30)
(8,2,4,'06-09-2025',60),  -- 8  Andrés Look & Style (15:00-16:00)
(9,1,5,'06-09-2025',60),  -- 9  Camila Estilo Chic (16:00-17:00)
(7,1,1,'07-09-2025',60),  -- 10 Valentina Estilo Chic (09:00-10:00)
(9,1,1,'07-09-2025',60),  -- 11 Camila Estilo Chic (09:00-10:00)
(4,3,2,'10-10-2025',60),  -- 12 Diego  Belleza Total (10:00-11:00)
(1,3,4,'11-10-2025',60),  -- 13 Ana    Belleza Total (15:00-16:00)
(3,1,5,'12-10-2025',60),  -- 14 María  Estilo Chic    (16:00-17:00)
(2,1,2,'13-10-2025',60),  -- 15 Carlos Estilo Chic    (10:00-11:00)
-- citas 2018
(2,1,1,'2018-06-15',60),  -- 16 Carlos Estilo Chic    (10:00-11:00)
(3,1,1,'2018-06-10',60),  -- 17 María Look & Style    (10:00-11:00)
(5,1,1,'2018-06-12',60),  -- 19 Sofía Estilo Chic      (09:00-10:00)
(4,1,1,'2018-06-20',90),  -- 18 Diego Belleza Total    (10:00-11:00)
(6,2,4,'2018-04-05',60),  -- 20 Juan Look & Style      (10:00-11:00)
(7,2,4,'2018-04-18',60),  -- 21 Camila Belleza Total   (11:30-12:30)
(8,2,4,'2018-04-02',60),  -- 22 Pedro Estilo Chic      (15:00-16:00)
(9,2,3,'2018-04-25',60),  -- 23 Valentina Look & Style (16:00-17:00)
(1,1,3,'2018-07-30',60), -- 24 Nicolás Estilo Chic    (09:00-10:00)
(1,1,3,'2018-07-15',90), -- 25 Francisca Look & Style (10:00-11:00)
(2,3,5,'2018-08-08',60), -- 26 Andrés Belleza Total   (11:30-12:30)
(3,3,5,'2018-08-20',60), -- 27 Daniela Estilo Chic    (15:00-16:00)
(4,2,2,'2018-08-10',90), -- 28 Tomás Look & Style     (16:00-17:00)

-- citas 2029
(3,1,2,'2029-01-15',60),  -- 29 Diego Estilo Chic      (09:00-10:00)
(4,2,3,'2029-01-10',90),  -- 30 María Look & Style     (10:00-11:00)
(1,3,4,'2029-01-22',60),  -- 31 José Belleza Total     (11:30-12:30)
(5,3,4,'2029-01-05',60),  -- 32 Lucía Belleza Total    (10:00-11:00)
(5,1,2,'2029-01-05',60),  -- 33 Lucía Estilo Chic      (15:00-16:00)
(2,1,2,'2029-01-18',60),  -- 34 Carlos Look & Style    (16:00-17:00)
(6,1,4,'2029-07-27',60),  -- 35 Valentina Estilo Chic  (09:00-10:00)
(7,2,3,'2029-07-14',90),  -- 36 Andrés Look & Style    (10:00-11:00)
(8,1,4,'2029-07-30',60),  -- 37 Daniela Belleza Total  (11:30-12:30)
(9,1,4,'2029-07-09',60),  -- 38 Tomás Estilo Chic      (15:00-16:00)
(1,1,1,'2021-10-25',60),  -- 39 Francisca Look & Style (16:00-17:00)
(2,1,5,'2021-11-20',60),  -- 40 Carlos Look & Style    (10:00-11:00) 
(2,1,5,'2021-11-15',60);  -- 41 Carlos Look & Style    (10:00-11:00) 

-- 9) EMPLEADO_CITA
INSERT INTO Empleado_Cita (IdEmpleado,IdCita) VALUES
(1,1),   -- Laura -> Cita 1 (P1)
(4,2),   -- Sofía -> Cita 2 (P1)
(5,3),   -- Tomás -> Cita 3 (P2)
(6,4),   -- Noemí -> Cita 4 (P2)
(6,5),   -- Noemí -> Cita 5 (P2)
(8,6),   -- Catalina -> Cita 6 (P3)
(3,7),   -- Juan -> Cita 7 (P1)
(5,8),   -- Tomás -> Cita 8 (P2)
(1,9),   -- Laura -> Cita 9 (P1)
(1,10),  -- Laura -> Cita 10 (P1)
(3,11),  -- Juan  -> Cita 11 (P1)
(8,12),  -- Catalina -> Cita 12 (P3)
(7,13),  -- Camila Vega -> Cita 13 (P3)
(4,14),  -- Sofía Herrera -> Cita 14 (P1)
(3,15),  -- Juan Díaz -> Cita 15 (P1)
(1,16), --16
(4,17), --17
(4,18), --18
(1,19), --19
(4,20), --20
(4,21), --21
(1,22), --22
(5,23), --23
(8,24), --24
(8,25), --25
(4,26), --26
(5,27), --27
(1,28), --28
(4,29), --29
(4,30), --30
(2,31), --31
(1,32), --32
(5,33), --33
(8,34), --34
(8,35), --35
(4,36), --36
(5,37), --37
(1,38), --38
(4,39), --39
(1,40), --40
(1,41); --41


-- 10) SERVICIO
INSERT INTO Servicio (NombreServicio,Descripcion,Precio) VALUES
('Corte Mujer','Corte y peinado básico',12000.00),
('Corte Hombre','Corte clásico',9000.00),
('Tinte Completo','Coloración completa',28000.00),
('Peinado','Peinado rápido',8000.00),
('Corte de Barba','Perfilado y recorte de barba',6000.00);

-- 11) PRODUCTO
INSERT INTO Producto (NombreProducto,Descripcion,Precio) VALUES
('Shampoo Nutritivo','500ml',6500.00),
('Acondicionador Suave','500ml',6800.00),
('Tinte Rojo 6.6','Caja 100ml',7500.00);

-- 12) DETALLE (IdDetalle en orden)
-- Cita 1
INSERT INTO Detalle (IdCita,IdServicio,IdProducto,Cantidad,PrecioUnitario) VALUES
(1,1,NULL,1,12000.00),
(1,NULL,1,1,6500.00);
-- Cita 2
INSERT INTO Detalle (IdCita,IdServicio,IdProducto,Cantidad,PrecioUnitario) VALUES
(2,2,NULL,1,9000.00);
-- Cita 3
INSERT INTO Detalle (IdCita,IdServicio,IdProducto,Cantidad,PrecioUnitario) VALUES
(3,3,NULL,1,28000.00),
(3,NULL,3,1,7500.00),
(3,4,NULL,1,8000.00);
-- Cita 4
INSERT INTO Detalle (IdCita,IdServicio,IdProducto,Cantidad,PrecioUnitario) VALUES
(4,4,NULL,1,8000.00);
-- Cita 5
INSERT INTO Detalle (IdCita,IdServicio,IdProducto,Cantidad,PrecioUnitario) VALUES
(5,1,NULL,1,12000.00),
(5,NULL,2,1,6800.00);
-- Cita 6
INSERT INTO Detalle (IdCita,IdServicio,IdProducto,Cantidad,PrecioUnitario) VALUES
(6,2,NULL,1,9000.00);
-- Cita 7
INSERT INTO Detalle (IdCita,IdServicio,IdProducto,Cantidad,PrecioUnitario) VALUES
(7,4,NULL,1,8000.00);
-- Cita 8
INSERT INTO Detalle (IdCita,IdServicio,IdProducto,Cantidad,PrecioUnitario) VALUES
(8,3,NULL,1,28000.00),
(8,NULL,3,1,7500.00),
(8,4,NULL,1,8000.00);
-- Cita 9
INSERT INTO Detalle (IdCita,IdServicio,IdProducto,Cantidad,PrecioUnitario) VALUES
(9,1,NULL,1,12000.00);
-- Cita 10
INSERT INTO Detalle (IdCita,IdServicio,IdProducto,Cantidad,PrecioUnitario) VALUES
(10,1,NULL,1,12000.00);
-- Cita 11
INSERT INTO Detalle (IdCita,IdServicio,IdProducto,Cantidad,PrecioUnitario) VALUES
(11,4,NULL,1,8000.00);
-- Cita 12
INSERT INTO Detalle (IdCita,IdServicio,IdProducto,Cantidad,PrecioUnitario) VALUES
(12,2,NULL,1,9000.00);
-- Cita 13 (Ana) - Peinado
INSERT INTO Detalle (IdCita,IdServicio,IdProducto,Cantidad,PrecioUnitario) VALUES
(13,4,NULL,1,8000.00);
-- Cita 14 (María) - Corte Mujer
INSERT INTO Detalle (IdCita,IdServicio,IdProducto,Cantidad,PrecioUnitario) VALUES
(14,1,NULL,1,12000.00);
-- Cita 15 (Carlos) - Corte Hombre + Corte de Barba
INSERT INTO Detalle (IdCita,IdServicio,IdProducto,Cantidad,PrecioUnitario) VALUES
(15,2,NULL,1,9000.00),
(15,5,NULL,1,6000.00);

-- 13) PAGO
INSERT INTO Pago (IdDetalle,Monto,FechaPago,MetodoPago) VALUES
-- Cita 1
(1,12000.00,'02-09-2025','Tarjeta'),
(2,6500.00,'02-09-2025','Efectivo'),
-- Cita 2
(3,9000.00,'02-09-2025','Tarjeta'),
-- Cita 3
(4,28000.00,'03-09-2025','Tarjeta'),
(5,7500.00,'03-09-2025','Efectivo'),
(6,8000.00,'03-09-2025','Tarjeta'),
-- Cita 4
(7,8000.00,'04-09-2025','Efectivo'),
-- Cita 5
(8,12000.00,'05-09-2025','Tarjeta'),
(9,6800.00,'05-09-2025','Efectivo'),
-- Cita 6
(10,9000.00,'05-09-2025','Tarjeta'),
-- Cita 7
(11,8000.00,'05-09-2025','Efectivo'),
-- Cita 8
(12,28000.00,'06-09-2025','Tarjeta'),
(13,7500.00,'06-09-2025','Efectivo'),
(14,8000.00,'06-09-2025','Tarjeta'),
-- Cita 9
(15,12000.00,'06-09-2025','Efectivo'),
-- Cita 10
(16,12000.00,'07-09-2025','Tarjeta'),
-- Cita 11
(17,8000.00,'07-09-2025','Efectivo'),
-- Cita 12
(18,9000.00,'10-10-2025','Tarjeta'),
-- Cita 13
(19,8000.00,'11-10-2025','Efectivo'),
-- Cita 14
(20,12000.00,'12-10-2025','Tarjeta'),
-- Cita 15
(21,9000.00,'13-10-2025','Tarjeta'),
(22,6000.00,'13-10-2025','Efectivo');