# DOCUMENTACIÓN DE MONGO

# 2. MODELO NoSQL (MongoDB)

## 📂 Colecciones

- reclutamiento  
- incapacidades  
- horarios_especificos  

---

## 📌 Schema

### 🔹 Reclutamiento

{
  "persona_id": 1,
  "vacante": "Médico",
  "estado_actual": "Entrevista",
  "etapas": []
}

---

### 🔹 Horarios Específicos

{
  "personal_id": 10,
  "fecha": "2026-04-23",
  "tipo": "Guardia",
  "hora_inicio": "08:00",
  "hora_fin": "16:00"
}

---

## 📊 DD NoSQL

### 🔹 Incapacidades

Campo | Tipo | Descripción
--- | --- | ---
personal_id | Number | Empleado
tipo | String | Motivo
fecha_inicio | Date | Inicio
fecha_fin | Date | Fin

---

# 💾 RESPALDOS NoSQL

## 🔹 Respaldo Manual Completo

mongodump --db hospital_hr_db --out ./backup_completo

---

## 🔹 Respaldo Manual Parcial

mongodump --db hospital_rh_db --collection incapacidades --out ./backup_parcial

---

## 🔹 Script Automatizado NoSQL

mongodump --db hospital_rrhh --out ./backups/auto

---
# 💾 Justificación de la viabilidad de los respaldos

Los respaldos implementados en el sistema son viables porque garantizan la **seguridad, disponibilidad y recuperación de la información** en diferentes escenarios de falla o pérdida de datos.

## 🔹 Respaldo completo
El respaldo completo permite generar una copia total de la base de datos, lo que asegura una recuperación íntegra del sistema en caso de fallos críticos. Es ideal para restauraciones completas o migraciones.

## 🔹 Respaldo parcial
El respaldo parcial es viable porque permite guardar únicamente colecciones específicas, reduciendo el tiempo de ejecución y el espacio utilizado. Es útil para proteger módulos críticos sin necesidad de respaldar todo el sistema.

## 🔹 Respaldo automatizado
La automatización de respaldos mejora la confiabilidad del sistema al eliminar la dependencia de intervención manual. Esto reduce errores humanos y asegura que los datos se respalden de forma periódica y constante.

## 🔹 Conclusión
En conjunto, estos tipos de respaldo permiten una estrategia flexible y robusta, adaptada a distintos niveles de criticidad, volumen de datos y necesidades operativas del sistema.

---

## ⚙️ Automatización

Windows → Task Scheduler

---

## 📌 Justificación

- Maneja datos flexibles (etapas, horarios variables)  
- Escalable  
- Ideal para módulos dinámicos  

---

# 🧾 Bitácora NoSQL

db.bitacora.insertOne({
  usuario: "admin",
  accion: "actualizar",
  modulo: "reclutamiento",
  fecha: new Date()
});

---

# 📊 Monitoreo NoSQL

## 📌 Indicadores

- Tiempo de respuesta API  
- Cantidad de documentos  
- Errores  

## 🛠️ Herramientas

- MongoDB Atlas  
- Logs en Node.js  

---



## NoSQL → usar para:

✔ Procesos dinámicos (reclutamiento)  
✔ Datos variables (horarios específicos)  
✔ Historiales (etapas, incapacidades)  