const mongoose = require('mongoose');

const reclutamientoSchema = new mongoose.Schema({
    persona_id: {
        type: Number,
        required: true
    },
    vacante: {
        type: String,
        required: true
    },
    departamento_id: Number,

    estado_actual: {
        type: String,
        enum: ['Postulado', 'Entrevista', 'Psicometrico', 'Contratado', 'Rechazado'],
        default: 'Postulado'
    },

    etapas: [
        {
            nombre: String,
            fecha: Date,
            resultado: String,
            comentarios: String
        }
    ],

    responsable_id: Number

}, { timestamps: true });

module.exports = mongoose.model('Reclutamiento', reclutamientoSchema);