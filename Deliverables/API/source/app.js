const express = require("express");
const app = express(); 

//Conexión Mongo
const connectMongo = require('./db/mongodb');
connectMongo();

//Middlewares
app.use(express.json());

//Swagger
const swaggerUi = require("swagger-ui-express");
const swaggerSpec = require("./swagger");
app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerSpec));

//Rutas
const incapacidadRoutes = require('./routes/incapacidad.routes');
const personalRoutes = require('./routes/personal.routes');
const medicoRoutes = require('./routes/medico.routes');
const pacientesRoutes = require("./routes/pacientes.routes");
const reclutamientoRoutes = require('./routes/reclutamiento.routes');
const horarioRoutes = require('./routes/horario.routes');

//Uso de rutas 
app.use("/api/pacientes", pacientesRoutes);
app.use('/api/incapacidades', incapacidadRoutes);
app.use('/api/personal', personalRoutes);
app.use('/api/medicos', medicoRoutes);

app.use('/api/reclutamiento', reclutamientoRoutes);
app.use('/api/horarios-especificos', horarioRoutes);


//Servidor
app.listen(3000, () => {
  console.log("Servidor corriendo en http://localhost:3000");
  console.log("Swagger en http://localhost:3000/api-docs");
});