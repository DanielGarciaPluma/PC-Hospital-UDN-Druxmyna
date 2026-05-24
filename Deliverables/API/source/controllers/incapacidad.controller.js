const Incapacidad = require('../models/incapacidad.model');

// Crear incapacidad
exports.crearIncapacidad = async (req, res) => {
    console.log("POST INCAPACIDAD EJECUTADO");
    console.log(req.body);
    try {
        const { personal_id, tipo, descripcion, fecha_inicio, fecha_fin } = req.body;

        if (!personal_id) return res.status(400).json({ message: "Falta el ID del personal" });
        if (!tipo) return res.status(400).json({ message: "Falta el tipo de incapacidad" });

        if (!['Enfermedad','Accidente','Maternidad','Otro'].includes(tipo)) {
            return res.status(400).json({ message: "Tipo no válido" });
        }

        if (!fecha_inicio) return res.status(400).json({ message: "Falta la fecha de inicio" });
        if (!fecha_fin) return res.status(400).json({ message: "Falta la fecha de fin" });

        const inicio = new Date(fecha_inicio);
        const fin = new Date(fecha_fin);

        if (fin < inicio) {
            return res.status(400).json({ message: "La fecha de fin no puede ser anterior a la de inicio" });
        }

        const nueva = new Incapacidad({
            personal_id: Number(personal_id), // 🔥 IMPORTANTE
            tipo,
            descripcion,
            fecha_inicio,
            fecha_fin
        });

        await nueva.save();

        res.status(201).json({
            message: "Incapacidad creada correctamente",
            data: nueva
        });

    } catch (error) {
        res.status(500).json({
            message: "Error interno",
            error: error.message
        });
    }
};

// Obtener todas
exports.obtenerIncapacidades = async (req, res) => {
    try {
        const incapacidades = await Incapacidad.find();

        res.status(200).json({
            message: "Consulta correcta",
            data: incapacidades
        });

    } catch (error) {
        res.status(500).json({
            message: "Error al obtener incapacidades",
            error: error.message
        });
    }
};

// Obtener por personal
exports.obtenerPorPersonal = async (req, res) => {
    try {
        const { personal_id } = req.params;

        if (!personal_id) {
            return res.status(400).json({ message: "Debe proporcionar el ID del personal" });
        }

        const incapacidades = await Incapacidad.find({
            personal_id: Number(personal_id) 
        });

        res.status(200).json({
            message: "Consulta por personal correcta",
            data: incapacidades
        });

    } catch (error) {
        res.status(500).json({
            message: "Error al buscar incapacidades",
            error: error.message
        });
    }

    
};