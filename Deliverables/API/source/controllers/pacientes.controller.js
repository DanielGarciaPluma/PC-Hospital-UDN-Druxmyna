const db = require("../db/connection");


// ===============================
// GENERAR PACIENTES (SP NORMAL)
// ===============================
exports.generarPacientes = async (req, res) => {

    try {

        const {
            cantidad,
            genero,
            edad_min,
            edad_max,
            estado_vida,
            estado_medico,
            tipo_edad
        } = req.body;

        const [result] = await db.query(
            "CALL sp_poblar_pacientes(?,?,?,?,?,?,?)",
            [cantidad, genero, edad_min, edad_max, estado_vida, estado_medico, tipo_edad]
        );

        res.json({
            mensaje: "Pacientes generados correctamente",
            resultado: result
        });

    } catch (error) {

        console.error(error);

        res.status(500).json({
            error: "Error al generar pacientes"
        });

    }
};


// ===============================
// GENERAR PACIENTES MASIVO (FAST)
// ===============================
exports.generarPacientesMasivo = async (req, res) => {

    try {

        const { cantidad } = req.body;

        if (!cantidad) {
            return res.status(400).json({
                mensaje: "Debe enviar la cantidad de pacientes"
            });
        }

        const [result] = await db.query(
            "CALL sp_poblar_pacientes_fast(?)",
            [cantidad]
        );

        res.json({
            mensaje: "Carga masiva completada",
            pacientes_generados: cantidad,
            resultado: result
        });

    } catch (error) {

        console.error(error);

        res.status(500).json({
            mensaje: "Error en generación masiva",
            detalle: error.message
        });

    }

};


// ===============================
// VER PACIENTES
// ===============================
exports.verPacientes = async (req, res) => {

    try {

        const [rows] = await db.query(`
            SELECT 
                pac.persona_id,
                pf.nombre,
                pf.primer_apellido,
                pf.segundo_apellido,
                pf.edad,
                pf.genero,
                pac.status_medico,
                pac.status_vida
            FROM hospital_rh_db.tbb_pacientes pac
            JOIN hospital_rh_db.tbb_personas p 
                ON p.id = pac.persona_id
            JOIN hospital_rh_db.tbb_personas_fisicas pf 
                ON pf.id = p.id
            ORDER BY pac.persona_id DESC
            LIMIT 100
        `);

        res.json(rows);

    } catch (error) {

        console.error(error);

        res.status(500).json({
            mensaje: "Error al obtener pacientes"
        });

    }
};


// ===============================
// ELIMINAR PACIENTE
// ===============================
exports.eliminarPaciente = async (req, res) => {

    try {

        const { id } = req.params;

        await db.query(`
            DELETE FROM hospital_rh_db.tbb_pacientes
            WHERE persona_id = ?
        `,[id]);

        await db.query(`
            DELETE FROM hospital_rh_db.tbb_personas_fisicas
            WHERE id = ?
        `,[id]);

        await db.query(`
            DELETE FROM hospital_rh_db.tbb_personas
            WHERE id = ?
        `,[id]);

        res.json({
            mensaje: "Paciente eliminado correctamente"
        });

    } catch (error) {

        console.error(error);

        res.status(500).json({
            mensaje: "Error al eliminar paciente"
        });

    }
};