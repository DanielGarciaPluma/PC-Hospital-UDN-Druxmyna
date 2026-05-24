const Horario = require('../models/horarioEspecifico.model');

exports.crearHorario = async (req, res) => {
    try {
        const nuevo = new Horario(req.body);
        await nuevo.save();

        res.status(201).json(nuevo);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.obtenerHorarios = async (req, res) => {
    try {
        const data = await Horario.find();
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};