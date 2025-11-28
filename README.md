# 🏋️ Base de Datos para Gestión de Gimnasio  

Este proyecto implementa una base de datos relacional completa para la gestión de un gimnasio, incluyendo clientes, monitores, clases, inscripciones, pagos y horarios.  
El objetivo es demostrar habilidades sólidas en **modelado de datos**, **consultas SQL**, **procedimientos almacenados**, **funciones**, **triggers** y buenas prácticas de diseño.

---

## 📂 Estructura del Repositorio

/database
├── schema/
│ ├── 01_create_tables.sql
│ ├── 02_insert_data.sql
│ └── 03_constraints_and_keys.sql
│
├── queries/
│ ├── basic_queries.sql
│ ├── intermediate_queries.sql
│ └── advanced_queries.sql
│
├── procedures/
│ └── sp_inscribir_cliente.sql
│
├── functions/
│ ├── f_edad_cliente.sql
│ └── fn_total_pagado.sql
│
└── triggers/
└── tr_prevenir_duplicados.sql

## 🧱 1. Modelado de Datos

La base de datos contiene las siguientes entidades:

- **Clientes**
- **Monitores**
- **Clases**
- **Inscripciones**
- **Pagos**
- **Cuotas**
- **Horarios**

Incluye claves primarias, claves foráneas, cascadas de actualización, restricciones y validaciones.

---

## 🛠 2. Funcionalidad del Sistema

El sistema permite gestionar:

### ✔ Clientes  
Registro, información personal, historial de clases, pagos y edad calculada dinámicamente.

### ✔ Monitores  
Asociación con clases y horarios semanales.

### ✔ Clases  
Monitores asignados, horarios, y lista de clientes inscritos.

### ✔ Pagos  
Historias, cuotas asociadas y cálculo automático del total abonado.

### ✔ Inscripciones  
Incluye trigger anti-duplicados y procedimiento controlado.

---

## 🧩 3. Objetos SQL Incluidos

### 🟦 TRIGGER: Evitar inscripciones duplicadas  
Archivo: `/triggers/tr_prevenir_duplicados.sql`

- Valida que un cliente no se inscriba dos veces a la misma clase.
- Lanza error personalizado si detecta duplicado.
- Protege la integridad del negocio.

---

### 🟩 FUNCIÓN: Edad del cliente  
Archivo: `/functions/f_edad_cliente.sql`

- Calcula la edad usando `TIMESTAMPDIFF`.
- Útil para reportes, segmentación y filtros.

---

### 🟨 FUNCIÓN: Total pagado  
Archivo: `/functions/fn_total_pagado.sql`

- Retorna el total de dinero pagado por un cliente.
- Devuelve `0` si no existen registros.

---

### 🟥 PROCEDIMIENTO: Inscribir cliente  
Archivo: `/procedures/sp_inscribir_cliente.sql`

- Verifica duplicados antes de insertar.
- Inserta automáticamente con fecha actual.
- Maneja errores con `SIGNAL SQLSTATE`.

---

## 🔍 4. Ejemplos de Consultas Incluidas

En `/queries/` se incluyen consultas como:

- Listado de clientes ordenados por apellido  
- Pagos por cliente  
- Clases y sus monitores  
- Clases con al menos un cliente  
- Monitores sin clases asignadas  
- Clientes sin inscripciones  
- Total pagado por cada cliente  
- Clases con más de 2 inscritos  
- Clientes nacidos después de 1990  
- Ingresos generados por cada clase  

Y muchas más. Esto demuestra dominio de:

- JOIN
- GROUP BY
- HAVING
- LEFT JOIN
- Subconsultas
- Funciones agregadas
- Validaciones de datos

---

## 🚀 5. Cómo ejecutar el proyecto

1. Crear la base de datos:
   Copia y pega `01_create_tables.sql` en tu SQL.
2. Ejecutar las consultas del archivo `consultas.sql`. 

## 📘 6. Tecnologías utilizadas

MySQL 
Modelado relacional
T-SQL para procedimientos, funciones y triggers

## ⭐ 7. Objetivo del Proyecto

Este repositorio forma parte de mi portafolio personal.
Está diseñado para demostrar:
 - Diseño de bases de datos reales
 - Implementación de lógica de negocio dentro del motor SQL
 - Buenas prácticas de normalización
 - Organización profesional de un proyecto SQL
 - Capacidad de producción lista para entorno laboral

🙌 8. Autor

Julia Sidichenko
Estudiante de Base de datos
En búsqueda de prácticas o primeros proyectos profesionales.




