const express = require('express');
const router = express.Router();
const ctrl = require('../controllers/medico.controller');

/**
 * @swagger
 * /api/medicos:
 *   get:
 *     summary: Obtener médicos
 *     tags: [Medicos]
 *     responses:
 *       200:
 *         description: Lista de médicos
 */
router.get('/', ctrl.obtenerMedicos);

/**
 * @swagger
 * /api/incapacidades:
 *   post:
 *     summary: Crear una nueva incapacidad
 *     tags: [Incapacidades]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - personal_id
 *               - tipo
 *               - fecha_inicio
 *               - fecha_fin
 *             properties:
 *               personal_id:
 *                 type: integer
 *               tipo:
 *                 type: string
 *                 enum: [Enfermedad, Accidente, Maternidad, Otro]
 *               descripcion:
 *                 type: string
 *               fecha_inicio:
 *                 type: string
 *                 format: date
 *               fecha_fin:
 *                 type: string
 *                 format: date
 *     responses:
 *       201:
 *         description: Creado correctamente
 */
router.post('/', ctrl.crearMedico);

module.exports = router;