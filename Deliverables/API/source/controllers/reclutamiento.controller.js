const Reclutamiento = require('../models/reclutamiento.model');

exports.crearProceso = async (req, res) => {
    try {
        const nuevo = new Reclutamiento(req.body);
        await nuevo.save();

        res.status(201).json(nuevo);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.obtenerProcesos = async (req, res) => {
    try {
        const data = await Reclutamiento.find();
        res.json(data);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};