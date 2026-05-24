const path = require("path");
const swaggerJsdoc = require("swagger-jsdoc");

const options = {
  definition: {
    openapi: "3.0.0",
    info: {
      title: "API Hospital - HR",
      version: "1.0.0",
      description: "API para gestión de pacientes del hospital HR"
    },
    servers: [
      {
        url: "http://localhost:3000",
        description: "Servidor local"
      }
    ]
  },
  apis: [path.join(__dirname, "./routes/*.js")] 
};

const swaggerSpec = swaggerJsdoc(options);

module.exports = swaggerSpec;