INSERT INTO monitores (nombre, apellido, especialidad) VALUES
('Carlos', 'Rodríguez', 'Yoga'),
('Marta', 'Fernández', 'Pilates'),
('Javier', 'Sánchez', 'Entrenamiento Funcional'),
('Laura', 'Jiménez', 'Spinning'),
('Andrés', 'Molina', 'CrossFit'),
('Paula', 'Navarro', 'Zumba'),
('Roberto', 'Ortega', 'Boxeo'),
('Silvia', 'Hernández', 'Natación');

INSERT INTO clientes (nombre, apellido, correo, fecha_nacimiento, telefono, direccion) VALUES
('Nicolas', 'Malnado', 'judo@email.com', '1985-06-15', '555123456', 'Calle Falsa 123'),
('Laura', 'Sofia', 'laura.sofia@email.com', '1990-02-10', '555654321', 'Av. Siempre Viva 456'),
('Rafael', 'Domingo', 'rco@email.com', '1988-08-22', '555789123', 'Calle Sol 789'),
('María', 'López', 'maria.lopez@email.com', '1992-03-12', '555234567', 'Calle Luna 321'),
('Claudia', 'Celestino', 'kcelestino@email.com', '1980-11-09', '555345678', 'Av. Central 890'),
('Lucía', 'Torres', 'lucia.torres@email.com', '1995-09-25', '555456789', 'Calle Jardín 567'),
('Roberto', 'Sanchez', 'rsanchez@email.com', '1987-05-18', '555567890', 'Av. Libertad 234'),
('Julia', 'Tierralos', 'inko@email.com', '1998-12-02', '555678901', 'Calle Río 876');

INSERT INTO clases (nombre_clase, descripcion, monitor_id) VALUES
('Yoga Básico', 'Clase de yoga para principiantes', 1),
('Pilates Avanzado', 'Clase de pilates para niveles avanzados', 2),
('Entrenamiento Funcional', 'Clase de entrenamiento físico integral', 3),
('Spinning Intenso', 'Sesión de ciclismo indoor de alta intensidad', 4),
('CrossFit Intermedio', 'Entrenamiento de fuerza y resistencia funcional', 5),
('Zumba Fitness', 'Clase de baile y cardio al ritmo de música latina', 6),
('Boxeo Recreativo', 'Entrenamiento básico de boxeo y acondicionamiento físico', 7),
('Natación Principiantes', 'Clases básicas de natación y respiración', 8);


INSERT INTO cuotas (descripcion, monto, frecuencia) VALUES
('Cuota Mensual', 50.00, 'Mensual'),
('Cuota Trimestral', 135.00, 'Trimestral'),
('Cuota Anual', 500.00, 'Anual'),
('Cuota Semanal', 20.00, 'Semanal'),
('Cuota Semestral', 270.00, 'Semestral'),
('Cuota Familiar', 800.00, 'Anual'),
('Cuota Premium', 600.00, 'Anual con acceso ilimitado');


INSERT INTO horarios (clase_id, dia_semana, hora_inicio, hora_fin) VALUES
(1, 'Lunes', '08:00:00', '09:00:00'),
(2, 'Miércoles', '10:00:00', '11:00:00'),
(3, 'Viernes', '17:00:00', '18:00:00'),
(4, 'Martes', '18:00:00', '19:00:00'),
(5, 'Jueves', '19:00:00', '20:00:00'),
(6, 'Sábado', '09:00:00', '10:00:00'),
(7, 'Lunes', '19:00:00', '20:00:00'),
(8, 'Miércoles', '08:00:00', '09:00:00');


INSERT INTO inscripciones (cliente_id, clase_id, fecha_inscripcion) VALUES
(1, 1, '2023-10-01'),
(2, 2, '2023-10-05'),
(3, 3, '2023-10-10'),
(4, 4, '2023-11-01'),
(5, 5, '2023-11-03'),
(6, 6, '2023-11-05'),
(7, 7, '2023-11-07'),
(8, 8, '2023-11-09');

INSERT INTO pagos (cliente_id, cuota_id, monto, fecha_pago) VALUES
(1, 1, 50.00, '2023-10-01'),
(2, 2, 135.00, '2023-10-05'),
(3, 1, 50.00, '2023-10-10'),
(4, 1, 50.00, '2023-11-01'),
(5, 4, 600.00, '2023-11-03'),
(6, 5, 20.00, '2023-11-05'),
(7, 2, 135.00, '2023-11-07'),
(8, 3, 500.00, '2023-11-09');
