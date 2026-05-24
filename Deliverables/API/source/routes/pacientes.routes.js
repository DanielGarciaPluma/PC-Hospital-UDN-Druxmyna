const express = require("express");
const router = express.Router();
const pacientesController = require("../controllers/pacientes.controller");

/**
 * @swagger
 * /api/pacientes:
 *   get:
 *     summary: Obtener pacientes
 *     description: Devuelve una lista de pacientes registrados
 *     responses:
 *       200:
 *         description: Lista de pacientes obtenida correctamente
 */
router.get("/", pacientesController.verPacientes);


/**
 * @swagger
 * /api/pacientes/generar:
 *   post:
 *     summary: Generar pacientes
 *     description: Ejecuta el procedimiento almacenado para crear pacientes
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               cantidad:
 *                 type: integer
 *                 example: 10
 *               genero:
 *                 type: string
 *                 example: hombre
 *               edad_min:
 *                 type: integer
 *                 example: 18
 *               edad_max:
 *                 type: integer
 *                 example: 60
 *               estado_vida:
 *                 type: string
 *                 example: vivo
 *               estado_medico:
 *                 type: string
 *                 example: Estable
 *               tipo_edad:
 *                 type: string
 *                 example: adulto
 *     responses:
 *       200:
 *         description: Pacientes generados correctamente
 */
router.post("/generar", pacientesController.generarPacientes);


/**
 * @swagger
 * /api/pacientes/{id}:
 *   delete:
 *     summary: Eliminar paciente
 *     description: Elimina un paciente por su ID
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID del paciente
 *         schema:
 *           type: integer
 *           example: 1
 *     responses:
 *       200:
 *         description: Paciente eliminado correctamente
 *       404:
 *         description: Paciente no encontrado
 */
router.delete("/:id", pacientesController.eliminarPaciente);
router.post("/pacientes/generar-masivo", pacientesController.generarPacientesMasivo);

module.exports = router;