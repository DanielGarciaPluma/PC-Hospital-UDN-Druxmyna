const pool = require('../db/connection');
const connectMongo = require('../db/mongodb');
const Incapacidad = require('../models/incapacidad.model');

let faker;

const loadFaker = async () => {
    const fakerModule = await import('@faker-js/faker');
    faker = fakerModule.faker;
};

const BATCH_SIZE = 1000;


const DEPARTAMENTOS_VALIDOS = [1, 2, 3, 4];
const AREAS_VALIDAS = [1, 5, 6, 7];

// ===============================
// GENERADORES
// ===============================

const generarPersona = () => {
    let pais = faker.location.country();
    if (pais.length > 50) {
        pais = pais.substring(0, 50);
    }
    return {
        tipo: faker.helpers.arrayElement(['Fisica', 'Moral']),
        rfc: faker.string.alphanumeric(13).toUpperCase(),
        pais_origen: pais,
        fecha_registro: new Date(),
        fecha_actualizacion: new Date(),
        estatus: 1
    };
};

const generarPersonal = (persona_id) => ({
    persona_id,
    departamento_id: faker.helpers.arrayElement(DEPARTAMENTOS_VALIDOS),
    numero_empleado: faker.string.numeric(6),
    puesto: faker.person.jobTitle(),
    tipo_contrato: faker.helpers.arrayElement(['BASE', 'EVENTUAL', 'HONORARIOS']),
    fecha_ingreso: faker.date.past(),
    fecha_baja: null,
    salario: faker.number.float({ min: 5000, max: 50000 }),
    fecha_registro: new Date(),
    fecha_actualizacion: new Date(),
    estatus: 1
});

const generarMedico = (personal_id) => ({
    personal_id,
    cedula_profesional: faker.string.numeric(8),
    especialidad: faker.person.jobType(),
    turno: faker.helpers.arrayElement(['Matutino', 'Vespertino', 'Nocturno']),
    area_id: faker.helpers.arrayElement(AREAS_VALIDAS),
    fecha_registro: new Date(),
    fecha_actualizacion: new Date(),
    estatus: 1
});

const generarIncapacidad = (personal_id) => {
    const inicio = faker.date.recent();
    const fin = new Date(inicio);
    fin.setDate(fin.getDate() + faker.number.int({ min: 1, max: 10 }));

    return {
        personal_id,
        tipo: faker.helpers.arrayElement(['Enfermedad', 'Accidente', 'Maternidad', 'Otro']),
        descripcion: faker.lorem.sentence(),
        fecha_inicio: inicio,
        fecha_fin: fin
    };
};

// ===============================
// PERSONAS (SQL)
// ===============================

const insertarPersonasBatch = async (cantidad) => {
    let ids = [];

    const [[{ maxId }]] = await pool.query(`SELECT IFNULL(MAX(ID),0) as maxId FROM tbb_personas`);
    let startId = maxId + 1;

    for (let i = 0; i < cantidad; i += BATCH_SIZE) {
        const batch = [];

        for (let j = 0; j < BATCH_SIZE && i + j < cantidad; j++) {
            batch.push(generarPersona());
        }

        const values = batch.map((p, index) => [
            startId + index,
            p.tipo,
            p.rfc,
            p.pais_origen,
            p.fecha_registro,
            p.fecha_actualizacion,
            p.estatus
        ]);

        await pool.query(`
            INSERT INTO tbb_personas
            (ID, tipo, rfc, pais_origen, fecha_registro, fecha_actualizacion, estatus)
            VALUES ?
        `, [values]);

        for (let k = 0; k < values.length; k++) {
            ids.push(startId + k);
        }

        startId += values.length;

        console.log(`👤 Personas: ${ids.length}`);
    }

    return ids;
};

// ===============================
// PERSONAL (SQL)
// ===============================

const insertarPersonalBatch = async (personaIds) => {
    let ids = [];

    for (let i = 0; i < personaIds.length; i += BATCH_SIZE) {
        const batch = personaIds.slice(i, i + BATCH_SIZE);

        const values = batch.map(pid => {
            const p = generarPersonal(pid);
            return [
                p.persona_id,
                p.departamento_id,
                p.numero_empleado,
                p.puesto,
                p.tipo_contrato,
                p.fecha_ingreso,
                p.fecha_baja,
                p.salario,
                p.fecha_registro,
                p.fecha_actualizacion,
                p.estatus
            ];
        });

        const [result] = await pool.query(`
            INSERT INTO tbb_personal
            (persona_id, departamento_id, numero_empleado, puesto, tipo_contrato,
             fecha_ingreso, fecha_baja, salario, fecha_registro, fecha_actualizacion, estatus)
            VALUES ?
        `, [values]);

        let startId = result.insertId;

        for (let k = 0; k < values.length; k++) {
            ids.push(startId + k);
        }

        console.log(`Personal: ${ids.length}`);
    }

    return ids;
};

// ===============================
// MEDICOS (SQL)
// ===============================

const insertarMedicosBatch = async (ids) => {
    for (let i = 0; i < ids.length; i += BATCH_SIZE) {
        const batch = ids.slice(i, i + BATCH_SIZE);

        const values = batch.map(id => {
            const m = generarMedico(id);
            return [
                m.personal_id,
                m.cedula_profesional,
                m.especialidad,
                m.turno,
                m.area_id,
                m.fecha_registro,
                m.fecha_actualizacion,
                m.estatus
            ];
        });

        await pool.query(`
            INSERT INTO tbb_personal_medico
            (personal_id, cedula_profesional, especialidad, turno, area_id,
             fecha_registro, fecha_actualizacion, estatus)
            VALUES ?
        `, [values]);

        console.log(`🩺 Médicos: ${i + batch.length}`);
    }
};

// ===============================
// INCAPACIDADES (Mongo)
// ===============================

const insertarIncapacidadesBatch = async (ids) => {
    for (let i = 0; i < ids.length; i += BATCH_SIZE) {
        const batch = ids.slice(i, i + BATCH_SIZE);

        const docs = batch.map(id => generarIncapacidad(id));

        await Incapacidad.insertMany(docs);

        console.log(` Incapacidades: ${i + batch.length}`);
    }
};

// ===============================
// MAIN
// ===============================

const run = async () => {
    await loadFaker();

    const cantidad = parseInt(process.argv[2]) || 1000;

    console.log(` Generando ${cantidad} registros nuevos`);

    await connectMongo();

    console.time(" Tiempo total");

    const personaIds = await insertarPersonasBatch(cantidad);
    const personalIds = await insertarPersonalBatch(personaIds);

    await insertarMedicosBatch(personalIds);
    await insertarIncapacidadesBatch(personalIds);

    console.timeEnd("Tiempo total");

    console.log(" Finalizado");
    process.exit();
};

run();