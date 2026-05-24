const pool = require('../db/connection');
const mongoose = require('mongoose');

// conexión Mongo
mongoose.connect('mongodb://127.0.0.1:27017/hospital_mongo');

// modelos
const Incapacidad = require('../models/incapacidad.model');
const Reclutamiento = require('../models/reclutamiento.model');
const Horario = require('../models/horarioEspecifico.model');

// funciones random
const random = (min, max) => Math.floor(Math.random() * (max - min) + min);

const nombres = ["Juan", "Maria", "Luis", "Ana", "Pedro"];
const apellidos = ["Perez", "Lopez", "Gomez", "Hernandez"];
const puestos = ["Doctor", "Enfermero", "Administrador"];
const tipos = ["Enfermedad", "Accidente", "Maternidad"];

const generarDatos = async () => {
  try {

    console.log("Insertando datos en MySQL...");

    for (let i = 0; i < 10; i++) {

      // 🔥 ID MANUAL (SOLUCIÓN AL ERROR)
      const id_persona = random(1, 1000000);

      // 🟩 PERSONA FISICA
      await pool.query(`
        INSERT INTO tbb_personas_fisicas
        (ID, nombre, primer_apellido, segundo_apellido, genero, fecha_nacimiento, curp, estatus)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
      `, [
        id_persona,
        nombres[random(0, nombres.length)],
        apellidos[random(0, apellidos.length)],
        apellidos[random(0, apellidos.length)],
        "H",
        "1990-01-01",
        "CURP" + random(100000, 999999),
        1
      ]);

      const persona_id = id_persona;

      // 🟨 PERSONAL
      const [personal] = await pool.query(`
        INSERT INTO tbb_personal
        (persona_id, departamento_id, numero_empleado, puesto, tipo_contrato, fecha_ingreso, salario, fecha_registro, estatus)
        VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), ?)
      `, [
        persona_id,
        1, // ⚠️ debe existir
        "EMP" + random(1000, 9999),
        puestos[random(0, puestos.length)],
        "Base",
        "2024-01-01",
        random(8000, 20000),
        1
      ]);

      const personal_id = personal.insertId;

      // 🟥 PERSONAL MEDICO
      await pool.query(`
        INSERT INTO tbb_personal_medico
        (personal_id, cedula_profesional, especialidad, turno, area_id, fecha_registro, estatus)
        VALUES (?, ?, ?, ?, ?, NOW(), ?)
      `, [
        personal_id,
        "CED" + random(1000, 9999),
        "General",
        "Matutino",
        1, // ⚠️ debe existir
        1
      ]);

      // 🟣 INCAPACIDAD (Mongo)
      await Incapacidad.create({
        personal_id,
        tipo: tipos[random(0, tipos.length)],
        descripcion: "Prueba",
        dias_incapacidad: random(1, 5),
        fecha_inicio: new Date(),
        fecha_fin: new Date(),
        estado: "Activa"
      });

      // 🟠 RECLUTAMIENTO (Mongo)
      await Reclutamiento.create({
        persona_id,
        vacante: "Médico",
        estado_actual: "Entrevista",
        etapas: [
          {
            nombre: "CV recibido",
            fecha: new Date(),
            resultado: "Aprobado"
          }
        ]
      });

      // 🔵 HORARIO (Mongo)
      await Horario.create({
        personal_id,
        fecha: new Date(),
        tipo: "Guardia",
        hora_inicio: "08:00",
        hora_fin: "16:00",
        motivo: "Horario normal"
      });

    }

    console.log("✅ Datos generados correctamente");
    process.exit();

  } catch (error) {
    console.error("❌ ERROR:", error);
    process.exit(1);
  }
};

generarDatos();