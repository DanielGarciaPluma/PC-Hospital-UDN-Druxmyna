# 🏥 DEFINICIÓN DE USUARIOS, ROLES Y PRIVILEGIOS

# 1. MODELO SQL (RELACIONAL)

## 👥 Usuarios por Área
En el hospital, los usuarios se dividen por funciones:

Área | Usuario
--- | ---
Recursos Humanos | rh_user
Administración | admin_user
Médico | medico_user
Sistemas | sys_user

## 🔐 Roles
CREATE ROLE rol_rh;
CREATE ROLE rol_admin;
CREATE ROLE rol_medico;
CREATE ROLE rol_sistemas;

## 🛡️ Privilegios

👤 Rol Recursos Humanos  
GRANT SELECT, INSERT, UPDATE ON personal TO rol_rh;  
GRANT SELECT, INSERT, UPDATE ON personas TO rol_rh;  
GRANT SELECT, INSERT, UPDATE ON horarios_generales TO rol_rh;  
GRANT SELECT, INSERT, UPDATE ON medios_contacto TO rol_rh;  

Puede:
- Gestionar personal  
- Asignar horarios  
- Administrar reclutamiento

## Rol Administrador  
GRANT ALL PRIVILEGES ON DATABASE hospital_rrhh TO rol_admin;  

Control total del sistema  


## 👨‍⚕️ Rol Médico  
GRANT SELECT ON personal_medico TO rol_medico;  
GRANT SELECT ON horarios_generales TO rol_medico;  

Solo consulta información  

## Rol Sistemas  
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES TO rol_sistemas;  

## Soporte técnico  

## 👤 Asignación de Usuarios
CREATE LOGIN rrhh_user WITH PASSWORD = '1234';  
CREATE USER rrhh_user FOR LOGIN rrhh_user;  
ALTER ROLE rol_rrhh ADD MEMBER rrhh_user;  

## 📌 Recomendaciones SQL
- Usar principio de mínimo privilegio  
- Separar roles por área  
- No usar admin para operaciones diarias  
- Auditar accesos con bitácora  

# 2. MODELO NoSQL (MongoDB)

## 👥 Usuarios por Área
Área | Usuario
--- | ---
HR | rh_user
Admin | admin_user
Médico | medico_user

## 🔐 Creación de Usuarios

👤 HR
---

db.createUser({ user: "rh_user", pwd: "1234", roles: [{ role: "readWrite", db: "hospital_rh" }] });

Admin  
db.createUser({ user: "admin_user", pwd: "1234", roles: ["root"] });

Médico  
db.createUser({ user: "medico_user", pwd: "1234", roles: [{ role: "read", db: "hospital_rh" }] });

---



## 🔒 Control por Colección
Mongo no maneja FK, pero sí control de acceso:

reclutamiento → solo HR
incapacidades → RRHH + médico  
horarios_especificos → HR  

## 📌 Recomendaciones NoSQL
- Separar usuarios por área  
- Usar roles integrados (read, readWrite)  
- No usar root en producción  
- Controlar acceso desde backend (Node.js)  

# 🏥 ENFOQUE HOSPITALARIO

## 🔐 Seguridad de Datos
Datos de personal = sensibles  
Solo HR debe modificarlos  
Médicos solo consultan  

## ⚙️ Mejores prácticas
- Autenticación en API (JWT recomendado)  
- Bitácora de accesos  
- Restricción por endpoints  