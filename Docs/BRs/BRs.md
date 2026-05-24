# 🔹 Reglas de Negocio

---

## 🗄️ Modelo NoSQL (No Relacional)

### 📌 Reclutamiento

- **RN-01:** Todo proceso de reclutamiento debe estar asociado a una vacante  
- **RN-02:** Un candidato debe tener un estado válido:  
  `Postulado | Entrevista | Psicométrico | Contratado | Rechazado`  
- **RN-03:** No se puede contratar a un candidato sin haber pasado por al menos una etapa  
- **RN-04:** Cada proceso debe tener un responsable asignado  

---

### ⏰ Horarios

- **RN-05:** Todo horario debe estar asociado a un miembro del personal  
- **RN-06:** El tipo de horario debe ser uno de los siguientes:  
  `Cambio | Guardia | Permiso | Extra`  
- **RN-07:** Un horario debe tener fecha obligatoria  
- **RN-08:** No se deben asignar horarios duplicados al mismo personal en la misma fecha  

---

### 🏥 Incapacidades

- **RN-09:** Toda incapacidad debe tener fecha de inicio y fin  
- **RN-10:** La fecha de fin debe ser posterior a la fecha de inicio  
- **RN-11:** El estado de la incapacidad debe ser:  
  `Activa | Finalizada`  
- **RN-12:** El número de días de incapacidad debe ser mayor a cero  

---

## 🗄️ Modelo SQL (Relacional)

### 📌 Personas

- **RN-13:** Toda persona debe contar con un identificador único  
- **RN-14:** El nombre completo de la persona es obligatorio  
- **RN-15:** La CURP de una persona física no debe repetirse  
- **RN-16:** Toda persona debe tener un estado válido:  
  `Activo | Inactivo`  

---

### 👤 Personas Físicas

- **RN-17:** Toda persona física debe estar relacionada con una persona registrada  
- **RN-18:** La nacionalidad es obligatoria para personas físicas  
- **RN-19:** La fecha de nacimiento debe ser válida y menor a la fecha actual  
- **RN-20:** El género debe registrarse con valores válidos definidos por el sistema  

---

### 🧑‍⚕️ Personal

- **RN-21:** Todo registro de personal debe estar asociado a una persona física  
- **RN-22:** Todo personal debe pertenecer a un departamento  
- **RN-23:** El número de empleado debe ser único  
- **RN-24:** El estado laboral debe ser válido:  
  `Activo | Suspendido | Baja | Vacaciones`  

---

### 🩺 Personal Médico

- **RN-25:** Todo personal médico debe estar asociado a un registro de personal  
- **RN-26:** La especialidad médica es obligatoria  
- **RN-27:** El número de cédula profesional no debe repetirse  
- **RN-28:** Un médico no puede estar asignado a más de una especialidad principal  

---

### 🏢 Departamentos

- **RN-29:** Todo departamento debe tener un nombre único  
- **RN-30:** Cada departamento debe contar con una clave identificadora  
- **RN-31:** Un departamento debe tener un responsable asignado  
- **RN-32:** El estado del departamento debe ser válido:  
  `Activo | Inactivo`  

---

### ⏰ Horarios Generales

- **RN-33:** Todo horario general debe estar asociado a un departamento o personal  
- **RN-34:** La hora de inicio debe ser menor a la hora de fin  
- **RN-35:** No deben existir horarios traslapados para el mismo personal  
- **RN-36:** El tipo de jornada debe ser válido:  
  `Matutino | Vespertino | Nocturno | Mixto`  

---

### 📞 Medios de Contacto

- **RN-37:** Todo medio de contacto debe estar asociado a una persona  
- **RN-38:** El tipo de contacto debe ser válido:  
  `Teléfono | Celular | Correo | WhatsApp`  
- **RN-39:** No se deben registrar medios de contacto duplicados para la misma persona  
- **RN-40:** El correo electrónico debe tener un formato válido  
---