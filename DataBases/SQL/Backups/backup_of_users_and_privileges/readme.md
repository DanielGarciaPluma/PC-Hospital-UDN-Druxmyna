

## 📖 Descripción General

Esta carpeta contiene el respaldo relacionado con la **configuración de usuarios, roles y asignación de privilegios** dentro del motor de base de datos del sistema hospitalario.

El script almacenado aquí permite recrear la estructura de seguridad necesaria para el correcto funcionamiento del módulo de Recursos Humanos.

---

### 1️⃣ Creación de Usuarios

Se crean los usuarios del equipo de desarrollo mediante la instrucción `CREATE USER IF NOT EXISTS`, permitiendo su reutilización sin generar errores si ya existen.

Usuarios incluidos:

* carlos.garcia
* brisa.garcia

---

### 2️⃣ Creación de Roles

Se definen roles del sistema utilizando `CREATE ROLE IF NOT EXISTS`, tales como:

* developer
* patient
* nurse
* medic
* ge_user
* mr_user
* hr_user
* ph_user
* md_user
* ms_user

Estos roles permiten administrar permisos de manera estructurada y escalable.

---

### 3️⃣ Asignación de Roles a Usuarios

Todos los usuarios del equipo tienen asignados los roles:

* developer
* hr_user

Esto se realiza mediante la instrucción `GRANT`.

---

### 4️⃣ Verificación de Permisos

El script incluye consultas `SHOW GRANTS` para:

* Verificar los privilegios de cada usuario
* Confirmar la configuración de roles específicos

Esto permite validar correctamente la configuración tras su ejecución.

---

## 🎯 Objetivo

Permitir la restauración completa de la configuración de seguridad del sistema, asegurando:

✔ Consistencia en entornos de desarrollo
✔ Replicación de accesos en nuevos servidores
✔ Control estructurado de permisos
✔ Seguridad en el módulo de Recursos Humanos

---

## 🛡️ Importancia

La gestión adecuada de usuarios y roles es fundamental para:

* Proteger la información sensible del personal hospitalario
* Evitar accesos no autorizados
* Mantener una arquitectura de seguridad organizada
* Facilitar auditorías y control de permisos

---

## Árbol de la Carpeta

```text
📂backup_of_users_and_privileges
└── README.md
```

---


# 👥 Equipo de Desarrollo

| 👨‍💻 Integrante | 🔗 GitHub | 🛠️ Rol | 📝 Observaciones | Aprobado |
|----------------|-----------|---------|------------------|----------|
| **Carlos Daniel Garcia Pluma** | [@DanielGarciaPluma](https://github.com/DanielGarciaPluma) | Documentador | Sin observaciones | Aprobado ✅ |
| **Brisa Nallely Garcia Gregorio** | [@Brisgregorio](https://github.com/Brisgregorio) | Desarrollador | Sin observaciones | Aprobado ✅ |

---
