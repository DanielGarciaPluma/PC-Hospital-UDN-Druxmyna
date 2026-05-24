const mongoose = require('mongoose');

const horarioSchema = new mongoose.Schema({
    personal_id: {
        type: Number,
        required: true
    },

    fecha: {
        type: Date,
        required: true
    },

    tipo: {
        type: String,
        enum: ['Cambio', 'Guardia', 'Permiso', 'Extra'],
        required: true
    },

    hora_inicio: String,
    hora_fin: String,

    motivo: String

}, { timestamps: true });

module.exports = mongoose.model('HorarioEspecifico', horarioSchema);