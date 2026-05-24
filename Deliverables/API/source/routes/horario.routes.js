const express = require('express');
const router = express.Router();
const ctrl = require('../controllers/horario.controller');

/**
 * @swagger
 * tags:
 *   name: Horarios Específicos
 *   description: Gestión de cambios y ajustes de horarios
 */

/**
 * @swagger
 * /api/horarios-especificos:
 *   post:
 *     summary: Crear horario específico (guardias, cambios, etc.)
 *     tags: [Horarios Específicos]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               personal_id:
 *                 type: integer
 *               fecha:
 *                 type: string
 *                 format: date
 *               tipo:
 *                 type: string
 *               hora_inicio:
 *                 type: string
 *               hora_fin:
 *                 type: string
 *               motivo:
 *                 type: string
 *             example:
 *               personal_id: 1
 *               fecha: "2026-04-21"
 *               tipo: "Guardia"
 *               hora_inicio: "08:00"
 *               hora_fin: "20:00"
 *               motivo: "Cobertura"
 *     responses:
 *       201:
 *         description: Horario creado correctamente
 */
router.post('/', ctrl.crearHorario);

/**
 * @swagger
 * /api/horarios-especificos:
 *   get:
 *     summary: Obtener todos los horarios específicos
 *     tags: [Horarios Específicos]
 *     responses:
 *       200:
 *         description: Lista de horarios
 */
router.get('/', ctrl.obtenerHorarios);

module.exports = router;