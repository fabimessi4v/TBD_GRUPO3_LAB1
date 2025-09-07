
-- 1
SELECT DISTINCT ON (c.IdPeluqueria)
  c.IdPeluqueria,
  p.NombrePeluqueria,
  h.HoraInicio, h.HoraFin,
  com.NombreComuna,
  COUNT(*) AS TotalCitas
FROM Cita c
JOIN Horario h USING (IdHorario)
JOIN Peluqueria p USING (IdPeluqueria)
JOIN Comuna com USING (IdComuna)
GROUP BY c.IdPeluqueria, p.NombrePeluqueria,
         h.IdHorario, h.HoraInicio, h.HoraFin, com.NombreComuna
ORDER BY c.IdPeluqueria, TotalCitas ASC, h.IdHorario;

-- 2
WITH prom AS (
  SELECT
    ci.IdPeluqueria,
    date_trunc('month', p.FechaPago)::date AS Mes,
    AVG(p.Monto) AS PromedioMesPelu
  FROM Pago p
  JOIN Detalle d USING (IdDetalle)
  JOIN Cita    ci USING (IdCita)
  GROUP BY ci.IdPeluqueria, Mes
)
SELECT
  p.Monto,
  prom.PromedioMesPelu,
  pe.NombrePeluqueria,
  cl.NombreCliente,
  co_pe.NombreComuna AS ComunaPeluqueria,
  co_cl.NombreComuna AS ComunaCliente
FROM Pago p
JOIN Detalle d USING (IdDetalle)
JOIN Cita    ci USING (IdCita)
JOIN prom
  ON prom.IdPeluqueria = ci.IdPeluqueria
 AND prom.Mes = date_trunc('month', p.FechaPago)
JOIN Peluqueria pe  ON pe.IdPeluqueria = ci.IdPeluqueria
JOIN Cliente    cl  ON cl.IdCliente    = ci.IdCliente       
JOIN Comuna     co_pe ON co_pe.IdComuna = pe.IdComuna       
JOIN Comuna     co_cl ON co_cl.IdComuna = cl.IdComuna       
WHERE p.Monto > prom.PromedioMesPelu
ORDER BY ci.IdPeluqueria, p.FechaPago;

-- 3 
WITH sueldos_empleados AS (
  SELECT
    e.IdPeluqueria,
    pe.NombrePeluqueria,
    e.IdEmpleado,
    e.NombreEmpleado,
    date_trunc('month', s.FechaPago)::date AS mes,
    SUM(s.Monto) AS total_mes
  FROM Sueldo s
  JOIN Empleado   e  USING (IdEmpleado)
  JOIN Peluqueria pe ON pe.IdPeluqueria = e.IdPeluqueria
  WHERE s.FechaPago >= (date_trunc('month', current_date) - INTERVAL '3 years')
  GROUP BY e.IdPeluqueria, pe.NombrePeluqueria,
           e.IdEmpleado, e.NombreEmpleado,
           date_trunc('month', s.FechaPago)::date
),
prom AS (
  SELECT
    IdPeluqueria,
    mes,
    AVG(total_mes) AS promedio_mes
  FROM sueldos_empleados
  GROUP BY IdPeluqueria, mes
)
SELECT
  sm.NombrePeluqueria,
  sm.NombreEmpleado,
  sm.total_mes,
  ppm.promedio_mes
FROM sueldos_empleados sm
JOIN prom ppm
  ON ppm.IdPeluqueria = sm.IdPeluqueria
 AND ppm.mes = sm.mes
WHERE sm.total_mes > ppm.promedio_mes
ORDER BY sm.NombrePeluqueria, sm.mes, sm.total_mes DESC;

-- 4
SELECT DISTINCT c.IdCliente, c.NombreCliente, c.ApellidoCliente
FROM Cliente c
JOIN Cita ci       USING (IdCliente)
JOIN Detalle d     USING (IdCita)
JOIN Servicio s    USING (IdServicio)
WHERE c.Sexo = 'M'
  AND s.NombreServicio IN ('Corte Hombre', 'Corte de Barba')
GROUP BY c.IdCliente, c.NombreCliente, c.ApellidoCliente, ci.IdCita
HAVING COUNT(DISTINCT s.NombreServicio) = 2;

-- 5 
SELECT DISTINCT c.IdCliente, c.NombreCliente, c.ApellidoCliente
FROM Cliente c
JOIN Cita ci       USING (IdCliente)
JOIN Detalle d     USING (IdCita)
JOIN Servicio s    USING (IdServicio)
WHERE s.NombreServicio = 'Tinte Completo'
GROUP BY c.IdCliente, c.NombreCliente, c.ApellidoCliente, ci.IdCita

--6)
WITH conteo AS (
  SELECT DATE_TRUNC('month', c.fechacita) AS mes,
         h.idhorario,
         e.idpeluqueria,
         COUNT(*) AS total_citas
  FROM cita c
  JOIN horario h        ON c.idhorario = h.idhorario
  JOIN empleado_cita ec ON ec.idcita = c.idcita
  JOIN empleado e       ON ec.idempleado = e.idempleado
  WHERE EXTRACT(YEAR FROM c.fechacita) IN (2018, 2029)
  GROUP BY e.idpeluqueria, mes, h.idhorario
)
SELECT DISTINCT ON (idpeluqueria, mes) 
       idpeluqueria, mes, idhorario, total_citas
FROM conteo
ORDER BY idpeluqueria, mes, total_citas DESC;

-- 7)
WITH conteo AS (
  SELECT c.idcliente,
         DATE_TRUNC('month', c.fechacita) AS mes,
         e.idpeluqueria,
         SUM(c.duracionminutos) AS total_minutos 
  FROM cita c
  JOIN empleado_cita ec ON ec.idcita = c.idcita
  JOIN empleado e       ON ec.idempleado = e.idempleado
  GROUP BY e.idpeluqueria, mes, c.idcliente
)
SELECT DISTINCT ON (idpeluqueria, mes)
       idpeluqueria, mes, idcliente, total_minutos
FROM conteo
ORDER BY idpeluqueria, mes, total_minutos DESC;

-- 8)
WITH contador AS (
  SELECT e.idpeluqueria,
         s.idservicio,
         s.nombreservicio,
         s.precio
  FROM detalle d
  JOIN servicio s      ON d.idservicio = s.idservicio
  JOIN cita c          ON d.idcita = c.idcita
  JOIN empleado_cita ec ON ec.idcita = c.idcita
  JOIN empleado e       ON ec.idempleado = e.idempleado
)
SELECT DISTINCT ON (idpeluqueria)
       idpeluqueria, idservicio, nombreservicio, precio
FROM contador
ORDER BY idpeluqueria, precio DESC;

--9
WITH conteo AS (
  SELECT 
         ec.idempleado,
         c.idpeluqueria,
         DATE_TRUNC('month', c.fechacita) AS mes,
         COUNT(*) AS total_citas
  FROM cita c
  JOIN empleado_cita ec ON ec.idcita = c.idcita
  JOIN empleado e       ON ec.idempleado = e.idempleado
  WHERE e.cargo = 'Peluquero'
    AND EXTRACT(YEAR FROM c.fechacita) = 2021
  GROUP BY ec.idempleado, c.idpeluqueria, mes
)
SELECT DISTINCT ON (idpeluqueria, mes)
       idpeluqueria, mes, idempleado, total_citas
FROM conteo
ORDER BY idpeluqueria, mes, total_citas DESC;

--10)
SELECT co.idcomuna,
       co.nombrecomuna,
       COUNT(DISTINCT p.idpeluqueria) AS totalpeluquerias,
       COUNT(DISTINCT cl.idcliente) AS totalclientes
FROM comuna co
INNER JOIN peluqueria p ON co.idcomuna = p.idcomuna
INNER JOIN cliente cl   ON co.idcomuna = cl.idcomuna
GROUP BY co.idcomuna, co.nombrecomuna
ORDER BY co.idcomuna; 
