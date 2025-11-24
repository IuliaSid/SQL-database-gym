
CREATE DATABASE gimnasio;
USE gimnasio;

-- 2. CREACIÓN DE TABLAS
CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    correo VARCHAR(100) UNIQUE,
    fecha_nacimiento DATE,
    telefono VARCHAR(15),
    direccion VARCHAR(255)
);

CREATE TABLE monitores (
    monitor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    especialidad VARCHAR(50)
);

CREATE TABLE clases (
    clase_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_clase VARCHAR(100),
    descripcion TEXT,
    monitor_id INT,
    FOREIGN KEY (monitor_id) REFERENCES monitores(monitor_id)
      ON DELETE RESTRICT       
	  ON UPDATE CASCADE
);

CREATE TABLE cuotas (
    cuota_id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(100),
    monto DECIMAL(10, 2) CHECK (monto > 0),
    frecuencia VARCHAR(50)
);

CREATE TABLE horarios (
    horario_id INT PRIMARY KEY AUTO_INCREMENT,
    clase_id INT,
    dia_semana VARCHAR(20),
    hora_inicio TIME,
    hora_fin TIME,
    CHECK (hora_fin > hora_inicio),
    FOREIGN KEY (clase_id) REFERENCES clases(clase_id)
    ON DELETE RESTRICT       
	ON UPDATE CASCADE
);

CREATE TABLE inscripciones (
    inscripcion_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    clase_id INT,
    fecha_inscripcion DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
     ON DELETE CASCADE        
	 ON UPDATE CASCADE,
    FOREIGN KEY (clase_id) REFERENCES clases(clase_id)
     ON DELETE CASCADE        
	 ON UPDATE CASCADE
);

CREATE TABLE pagos (
    pago_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    cuota_id INT,
    monto DECIMAL(10, 2) CHECK (monto > 0),
    fecha_pago DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
     ON DELETE CASCADE        
	 ON UPDATE CASCADE,
    FOREIGN KEY (cuota_id) REFERENCES cuotas(cuota_id)
     ON DELETE RESTRICT
);
