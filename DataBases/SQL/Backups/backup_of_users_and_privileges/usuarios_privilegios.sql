-- ===============================
-- 1. CREAR USUARIOS
-- ===============================
CREATE USER IF NOT EXISTS 'carlos.garcia'@'%' IDENTIFIED BY '230187';
CREATE USER IF NOT EXISTS 'brisa.garcia'@'%' IDENTIFIED BY '230362';
CREATE USER IF NOT EXISTS 'sayurid.bautista'@'%' IDENTIFIED BY '230770';
CREATE USER IF NOT EXISTS 'jennifer.bautista'@'%' IDENTIFIED BY '230317';

-- ===============================
-- 2. CREAR ROLES
-- ===============================
CREATE ROLE IF NOT EXISTS 'developer';
CREATE ROLE IF NOT EXISTS 'patient';
CREATE ROLE IF NOT EXISTS 'nurse';
CREATE ROLE IF NOT EXISTS 'medic';
CREATE ROLE IF NOT EXISTS 'ge_user';
CREATE ROLE IF NOT EXISTS 'mr_user';
CREATE ROLE IF NOT EXISTS 'hr_user';
CREATE ROLE IF NOT EXISTS 'ph_user';
CREATE ROLE IF NOT EXISTS 'md_user';
CREATE ROLE IF NOT EXISTS 'ms_user';
-- ===============================
-- 4. ASIGNAR ROLES A USUARIOS
-- (todos pertenecen a developer y hr_user)
-- ===============================
GRANT 'developer', 'hr_user' TO 'carlos.garcia'@'%';
GRANT 'developer', 'hr_user' TO 'brisa.garcia'@'%';
GRANT 'developer', 'hr_user' TO 'sayurid.bautista'@'%';
GRANT 'developer', 'hr_user' TO 'jennifer.bautista'@'%';

-- ===============================
-- 5. ACTIVAR ROLES POR DEFECTO
-- ===============================
SET DEFAULT ROLE 'developer', 'hr_user' TO
'carlos.garcia'@'%',
'brisa.garcia'@'%',
'sayurid.bautista'@'%',
'jennifer.bautista'@'%';

-- ===============================
-- 6. VERIFICAR
-- ===============================
SHOW GRANTS FOR 'carlos.garcia'@'%';
SHOW GRANTS FOR 'brisa.garcia'@'%';
SHOW GRANTS FOR 'sayurid.bautista'@'%';
SHOW GRANTS FOR 'jennifer.bautista'@'%';

SHOW GRANTS FOR 'hr_user';
SHOW GRANTS FOR 'md_user';
SHOW GRANTS FOR 'ms_user';
SHOW GRANTS FOR 'mr_user';