const express = require('express');
const router = express.Router();
const ctrl = require('../controllers/personal.controller');

/**
 * @swagger
 * /api/personal:
 *   get:
 *     summary: Obtener todo el personal
 *     tags: [Personal]
 *     responses:
 *       200:
 *         description: Lista de personal
 */
router.get('/', ctrl.obtenerPersonal);

/**
 * @swagger
 * /api/personal/{id}:
 *   get:
 *     summary: Obtener personal por ID
 *     tags: [Personal]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Personal encontrado
 *       404:
 *         description: No encontrado
 */
router.get('/:id', ctrl.obtenerPorId);

/**
 * @swagger
 * /api/personal:
 *   post:
 *     summary: Crear nuevo personal
 *     tags: [Personal]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               persona_id:
 *                 type: integer
 *               departamento_id:
 *                 type: integer
 *               numero_empleado:
 *                 type: string
 *               puesto:
 *                 type: string
 *               tipo_contrato:
 *                 type: string
 *               fecha_ingreso:
 *                 type: string
 *                 format: date
 *               salario:
 *                 type: number
 *             example:
 *               persona_id: 1000
 *               departamento_id: 1
 *               numero_empleado: "EMP900"
 *               puesto: "Enfermero"
 *               tipo_contrato: "Base"
 *               fecha_ingreso: "2024-01-01"
 *               salario: 9000
 *     responses:
 *       200:
 *         description: Personal creado correctamente
 */
router.post('/', ctrl.crearPersonal);

module.exports = router;