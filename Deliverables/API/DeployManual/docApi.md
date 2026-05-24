# 🏥 API HIBRIDA 

> Arquitectura híbrida moderna basada en SQL + MongoDB + Node.js + Express

---

#  ARQUITECTURA DEL SISTEMA

🗄️ SQL → datos estructurados (personal, departamentos, relaciones críticas)  
🍃 MongoDB → datos dinámicos (reclutamiento, incapacidades, horarios específicos)  
⚙️ Node.js + Express → capa de integración y lógica del sistema  

---

# 🖥️ ESTRUCTURA DEL PROYECTO

API-HR/
│
├── config/
│   ├── db.sql.js
│   ├── db.mongo.js
│
├── models/
├── controllers/
├── routes/
├── services/
│   └── integracion.service.js
│
├── app.js

---

# 🔌 CONEXIÓN A BASE DE DATOS

## 🗄️ SQL (MySQL / SQL Server)

![TEST-006](/evidencias/sql.png)  



---

## 🍃 MONGODB

const mongoose = require('mongoose');

mongoose.connect('mongodb://127.0.0.1:27017/hospital_rrhh')
  .then(() => console.log('✅ MongoDB conectado correctamente'))
  .catch(err => console.log(err));

module.exports = mongoose;

---

# 🔗 INTEGRACIÓN SQL + NoSQL

const sql = require('../config/db.sql');
const Reclutamiento = require('../models/reclutamiento.model');

exports.obtenerPerfilCompleto = (req, res) => {
  const { persona_id } = req.params;

  sql.query(
    'SELECT * FROM personal WHERE persona_id = ?',
    [persona_id],
    async (err, result) => {
      if (err) return res.status(500).json(err);

      const reclutamiento = await Reclutamiento.find({ persona_id });

      res.json({
        personal: result,
        reclutamiento
      });
    }
  );
};

---

# 🌐 RUTAS DE INTEGRACIÓN

const express = require('express');
const router = express.Router();

const { obtenerPerfilCompleto } = require('../services/integracion.service');

/**
 * @swagger
 * /api/integracion/{persona_id}:
 *   get:
 *     summary: 🔍 Obtener perfil completo del empleado
 *     description: Combina información de SQL y MongoDB
 */
router.get('/:persona_id', obtenerPerfilCompleto);

module.exports = router;

---

# 🚀 APP PRINCIPAL (SERVER)

const express = require('express');
const app = express();

app.use(express.json());

// 🔌 Conexiones
require('./config/db.mongo');
require('./config/db.sql');

// 🌐 Rutas
app.use('/api/integracion', require('./routes/integracion.routes'));

// 📘 Swagger
const swaggerUi = require('swagger-ui-express');
const swaggerJsdoc = require('swagger-jsdoc');

const specs = swaggerJsdoc({
  definition: {
    openapi: '3.0.0',
    info: {
      title: '🏥 API RRHH Hospital',
      version: '1.0.0'
    }
  },
  apis: ['./routes/*.js']
});

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(specs));

app.listen(3000, () => {
  console.log('🚀 Servidor corriendo en http://localhost:3000');
});

---

# 📄 SWAGGER – ENDPOINT DOCUMENTADO

/**
 * @swagger
 * /api/integracion/{persona_id}:
 *   get:
 *     summary: 🔍 Obtener información completa del empleado
 *     description: Combina datos de SQL + MongoDB en una sola respuesta
 *     parameters:
 *       - in: path
 *         name: persona_id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: ✔ Datos combinados correctamente
 */

---

# 🛠️ INSTALACIÓN Y DESPLIEGUE LOCAL

## 📌 Requisitos
- Node.js  
- MongoDB  
- MySQL o SQL Server  

---

## ⚙️ PASOS

### 1️⃣ Clonar proyecto
git clone (Dirección del repo de RH)

---

### 2️⃣ Instalar dependencias
npm install

---

### 3️⃣ Configurar bases de datos
- Crear base: `hospital_rh` en SQL  
- Iniciar MongoDB local  

---

### 4️⃣ Ejecutar servidor
node app.js

---

### 5️⃣ Probar API
🌐 http://localhost:3000/api-docs

---

# 🧠 RESUMEN FINAL

🗄️ SQL → datos estructurados, relaciones y consistencia  
🍃 MongoDB → flexibilidad y datos dinámicos  
⚙️ Node.js → integración y lógica del sistema  
📘 Swagger → documentación interactiva de la API  

---

# ✨ RESULTADO FINAL

✔ Sistema híbrido funcional  
✔ API documentada  
✔ Arquitectura escalable  
✔ Separación clara de responsabilidades  