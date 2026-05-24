const express = require('express');
const router = express.Router();
const ctrl = require('../controllers/reclutamiento.controller');

/**
 * @swagger
 * tags:
 *   name: Reclutamiento
 *   description: Procesos de reclutamiento
 */

/**
 * @swagger
 * /api/reclutamiento:
 *   post:
 *     summary: Crear proceso de reclutamiento
 *     tags: [Reclutamiento]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               persona_id:
 *                 type: integer
 *               vacante:
 *                 type: string
 *               departamento_id:
 *                 type: integer
 *               estado_actual:
 *                 type: string
 *               responsable_id:
 *                 type: integer
 *               etapas:
 *                 type: array
 *                 items:
 *                   type: object
 *                   properties:
 *                     nombre:
 *                       type: string
 *                     fecha:
 *                       type: string
 *                       format: date
 *                     resultado:
 *                       type: string
 *                     comentarios:
 *                       type: string
 *             example:
 *               persona_id: 1
 *               vacante: "Médico General"
 *               departamento_id: 2
 *               estado_actual: "Postulado"
 *               responsable_id: 5
 *               etapas:
 *                 - nombre: "Entrevista"
 *                   fecha: "2026-04-20"
 *                   resultado: "Pendiente"
 *                   comentarios: "Primera fase"
 *     responses:
 *       201:
 *         description: Proceso creado correctamente
 */
router.post('/', ctrl.crearProceso);

/**
 * @swagger
 * /api/reclutamiento:
 *   get:
 *     summary: Obtener todos los procesos de reclutamiento
 *     tags: [Reclutamiento]
 *     responses:
 *       200:
 *         description: Lista de procesos
 */
router.get('/', ctrl.obtenerProcesos);

module.exports = router;