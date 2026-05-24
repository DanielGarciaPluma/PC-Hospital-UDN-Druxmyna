const pool = require('../db/connection');

// 🔵 GET TODOS LOS MÉDICOS
exports.obtenerMedicos = async (req, res) => {
  try {
    const [rows] = await pool.query(`
      SELECT m.*, p.numero_empleado, p.puesto
      FROM tbb_personal_medico m
      JOIN tbb_personal p ON m.personal_id = p.id
    `);

    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// 🟢 POST (TU CÓDIGO)
exports.crearMedico = async (req, res) => {
  try {
    const {
      personal_id,
      cedula_profesional,
      especialidad,
      turno,
      area_id
    } = req.body;

    if (!personal_id || !cedula_profesional) {
      return res.status(400).json({ message: "Datos incompletos" });
    }

    const [personal] = await pool.query(
      "SELECT id FROM tbb_personal WHERE id = ?",
      [personal_id]
    );

    if (personal.length === 0) {
      return res.status(404).json({ message: "Personal no existe" });
    }

    const [existe] = await pool.query(
      "SELECT id FROM tbb_personal_medico WHERE personal_id = ?",
      [personal_id]
    );

    if (existe.length > 0) {
      return res.status(400).json({ message: "Ya es médico" });
    }

    const [result] = await pool.query(
      `INSERT INTO tbb_personal_medico
      (personal_id, cedula_profesional, especialidad, turno, area_id, fecha_registro, estatus)
      VALUES (?, ?, ?, ?, ?, NOW(), 1)`,

      [
        personal_id,
        cedula_profesional,
        especialidad,
        turno,
        area_id
      ]
    );

    res.json({
      message: "Médico creado",
      id: result.insertId
    });

  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
