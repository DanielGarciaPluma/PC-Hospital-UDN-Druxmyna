const express = require('express');
const router = express.Router();
const ctrl = require('../controllers/incapacidad.controller');

/**
 * @swagger
 * tags:
 *   - name: Incapacidades
 *     description: Gestión de incapacidades
 */

/**
 * @swagger
 * components:
 *   schemas:
 *     Incapacidad:
 *       type: object
 *       properties:
 *         personal_id:
 *           type: integer
 *         tipo:
 *           type: string
 *         descripcion:
 *           type: string
 *         dias_incapacidad:
 *           type: integer
 *         fecha_inicio:
 *           type: string
 *           format: date
 *         fecha_fin:
 *           type: string
 *           format: date
 */

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
 *             $ref: '#/components/schemas/Incapacidad'
 *           example:
 *             personal_id: 1
 *             tipo: "Enfermedad"
 *             descripcion: "Gripe fuerte"
 *             fecha_inicio: "2026-03-01"
 *             fecha_fin: "2026-03-05"
 */
router.post('/', ctrl.crearIncapacidad);

/**
 * @swagger
 * /api/incapacidades:
 *   get:
 *     summary: Obtener todas las incapacidades
 *     tags: [Incapacidades]
 *     responses:
 *       200:
 *         description: Lista de incapacidades
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Incapacidad'
 */
router.get('/', ctrl.obtenerIncapacidades);

/**
 * @swagger
 * /api/incapacidades/personal/{personal_id}:
 *   get:
 *     summary: Obtener incapacidades por personal
 *     tags: [Incapacidades]
 *     parameters:
 *       - in: path
 *         name: personal_id
 *         required: true
 *         description: ID del personal
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Incapacidades del personal
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Incapacidad'
 */
router.get('/personal/:personal_id', ctrl.obtenerPorPersonal);

module.exports = router;