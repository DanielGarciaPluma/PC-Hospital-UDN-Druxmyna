const mongoose = require('mongoose');

const incapacidadSchema = new mongoose.Schema({
    personal_id: {
        type: Number,
        required: true
    },
    tipo: {
        type: String,
        required: true,
        enum: ['Enfermedad', 'Accidente', 'Maternidad', 'Otro']
    },
    descripcion: {
        type: String,
        default: ''
    },
    fecha_inicio: {
        type: Date,
        required: true
    },
    fecha_fin: {
        type: Date,
        required: true
    }
}, {
    collection: 'incapacidades' 
});

module.exports = mongoose.model('Incapacidad', incapacidadSchema);
incapacidadSchema.index({ personal_id: 1 });