# Docs

## Objetivo de la Carpeta

La carpeta `Docs` tiene como objetivo centralizar y organizar toda la documentación funcional, técnica y de diseño del proyecto, permitiendo definir requisitos, reglas del negocio, interfaces gráficas e historias de usuario necesarias para el desarrollo y mantenimiento del sistema.

---

##  Presentación del Equipo

El **Equipo HR** es el encargado de diseñar y estructurar los cimientos del módulo de **Recursos Humanos** del hospital.

Nuestro compromiso es garantizar un control preciso del personal, sus asignaciones, horarios y estructura organizacional, asegurando una gestión eficiente del capital humano que hace posible la atención médica.

##  Objetivo General
Diseñar y estructurar la base de datos del módulo de **Recursos Humanos** dentro de la plataforma administrativa hospitalaria, con el fin de centralizar, organizar y gestionar de manera eficiente la información del personal, sus asignaciones, horarios y estructura organizacional, permitiendo una administración confiable, escalable e integrada con los demás módulos del sistema hospitalario.


##  Probematica
La gestión del personal hospitalario se realiza de forma dispersa y manual, lo que provoca duplicidad de datos, dificultad para controlar horarios, personal y asignaciones, y falta de una estructura organizacional centralizada que apoye la toma de decisiones.

## Propuesta

Desarrollar dentro de la plataforma administrativa hospitalaria la gestion la información del personal en una base de datos estructurada, permitiendo abarcar departamentos, horarios, personas, personas fisicas, personal, personal medico, medios de contacto y asignaciones de manera integrada.
La solución busca automatizar procesos, reducir errores administrativos y facilitar la consulta y actualización de datos en tiempo real para mejorar la organización y eficiencia del hospital.

---

### Integrantes
- Brisa Nallely Garcia Gregorio | 230362
- Carlos Daniel Garcia Pluma | 230187

---

## Estructura de Subcarpetas

### `BRs/`
Contiene la documentación correspondiente a las reglas de negocio del sistema.

### `FRs/`
Almacena los requerimientos funcionales que describen las funciones y servicios que debe cumplir el sistema.

### `GUIs/`
Contiene los diseños e interfaces gráficas del sistema, incluyendo prototipos y referencias visuales.

### `NFRs/`
Documenta los requerimientos no funcionales como rendimiento, seguridad, escalabilidad y usabilidad.

### `UHs/`
Almacena las historias de usuario que describen las necesidades y expectativas de los usuarios finales.

### `URs/`
Contiene los requerimientos de usuario, especificando las necesidades generales del sistema desde la perspectiva del cliente o usuario final.

---


## Árbol de la Carpeta

```text
📚 Docs
│
├── 📝 BRs
│   └── BRs.md
│   └── README.md
│
├── 📋 FRs
│   └── FRs.md
│   └── README.md
│
├── 🎨 GUIs
│   │
│   ├── ⌚ WearableApp
│   │   └── README.md
│   │
│   ├── 🌐 WebApp
│   │   └── README.md
│   │
│   └── README.md
│
├── 🔒 NFRs
│   └── NFRs.md
│   └── README.md
│
├── 👥 UHS
│   └── UHS.md
│   └── README.md
│
├── 📄 URs
│   └── URs.md
│   └── README.md
│
└── README.md
```
---

## 📑 Fundamentos de Base de Datos

Dentro del esquema general del proyecto, este módulo define y estructura las siguientes entidades clave:

| Prefijo | Tabla | Descripción |
|:--------|:------|:------------|
| `tbb` | `Departamentos` | Catálogo de departamentos del hospital (Administración, Enfermería, Urgencias, etc.). |
| `tbb` | `Personal` | Registro general de empleados activos en la institución. |
| `tbb` | `Personal_Medico` | Información específica del personal médico (especialidad, cédula profesional, turno). |
| `tbb` | `Personas` | Datos generales de identificación de cada colaborador. |
| `tbb` | `Personas_Fisicas` | Información legal y fiscal del empleado. |
| `tbc` | `Areas` | Definición de las áreas físicas donde se asigna el personal. |
| `tbd` | `Horarios` | Gestión de turnos, jornadas laborales y control de asistencia. |

---

# 👥 Equipo de Desarrollo

| 👨‍💻 Integrante | 🔗 GitHub | 🛠️ Rol | 📝 Observaciones | Aprobado |
|----------------|-----------|---------|------------------|----------|
| **Carlos Daniel Garcia Pluma** | [@DanielGarciaPluma](https://github.com/DanielGarciaPluma) | Documentador | Sin observaciones | Aprobado ✅ |
| **Brisa Nallely Garcia Gregorio** | [@Brisgregorio](https://github.com/Brisgregorio) | Desarrollador | Sin observaciones | Aprobado ✅ |

---
