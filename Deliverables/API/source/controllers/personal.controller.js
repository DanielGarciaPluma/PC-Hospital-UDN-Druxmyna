const pool = require('../db/connection');


exports.obtenerPersonal = async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM tbb_personal");
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// GET POR ID
exports.obtenerPorId = async (req, res) => {
  try {
    const { id } = req.params;

    const [rows] = await pool.query(
      "SELECT * FROM tbb_personal WHERE id = ?",
      [id]
    );

    if (rows.length === 0) {
      return res.status(404).json({ message: "No encontrado" });
    }

    res.json(rows[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};


exports.crearPersonal = async (req, res) => {
  try {
    const {
      persona_id,
      departamento_id,
      numero_empleado,
      puesto,
      tipo_contrato,
      fecha_ingreso,
      salario
    } = req.body;

    if (!persona_id || !numero_empleado) {
      return res.status(400).json({ message: "Datos incompletos" });
    }

    const [persona] = await pool.query(
      "SELECT id FROM tbb_personas_fisicas WHERE id = ?",
      [persona_id]
    );

    if (persona.length === 0) {
      return res.status(404).json({ message: "Persona no existe" });
    }

    const [existe] = await pool.query(
      "SELECT id FROM tbb_personal WHERE numero_empleado = ?",
      [numero_empleado]
    );

    if (existe.length > 0) {
      return res.status(400).json({ message: "Empleado ya existe" });
    }

    const [result] = await pool.query(
      `INSERT INTO tbb_personal
      (persona_id, departamento_id, numero_empleado, puesto, tipo_contrato, fecha_ingreso, salario, fecha_registro, estatus)
      VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), 1)`,

      [
        persona_id,
        departamento_id || null,
        numero_empleado,
        puesto,
        tipo_contrato,
        fecha_ingreso,
        salario
      ]
    );

    res.json({
      message: "Personal creado",
      id: result.insertId
    });

  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};