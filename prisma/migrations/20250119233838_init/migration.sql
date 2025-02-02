-- CreateTable
CREATE TABLE "Specialty" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "is_main" BOOLEAN NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "Specialty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Physician" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "crm" TEXT NOT NULL,
    "status" TEXT NOT NULL,

    CONSTRAINT "Physician_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Physician_Specialty" (
    "physician_id" TEXT NOT NULL,
    "specialty_id" TEXT NOT NULL,

    CONSTRAINT "Physician_Specialty_pkey" PRIMARY KEY ("physician_id","specialty_id")
);

-- CreateTable
CREATE TABLE "Patient" (
    "id" TEXT NOT NULL,
    "national_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "birthdate" TIMESTAMP(3) NOT NULL,
    "gender" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL,
    "is_subscribed" BOOLEAN NOT NULL,

    CONSTRAINT "Patient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ambulance" (
    "id" TEXT NOT NULL,
    "appointment_id" TEXT,
    "plate_number" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "location" TEXT NOT NULL,

    CONSTRAINT "Ambulance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MessageLog" (
    "id" TEXT NOT NULL,
    "patient_id" TEXT NOT NULL,
    "appointment_id" TEXT,
    "msg_type" TEXT NOT NULL,
    "msg_content" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "sent_at" TIMESTAMP(3) NOT NULL,
    "response" TEXT,
    "msg_error" TEXT,

    CONSTRAINT "MessageLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Appointment" (
    "id" TEXT NOT NULL,
    "patient_id" TEXT NOT NULL,
    "physician_id" TEXT NOT NULL,
    "date_time" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "ambulance_time" INTEGER NOT NULL,

    CONSTRAINT "Appointment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Feedback" (
    "id" TEXT NOT NULL,
    "appointment_id" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "note" DOUBLE PRECISION NOT NULL,
    "comment" TEXT,

    CONSTRAINT "Feedback_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Agenda" (
    "id" TEXT NOT NULL,
    "physician_id" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "time_slot" INTEGER NOT NULL,
    "status" TEXT NOT NULL,

    CONSTRAINT "Agenda_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Appointment_Details" (
    "id" TEXT NOT NULL,
    "appointment_id" TEXT NOT NULL,
    "exams" TEXT NOT NULL,
    "prescriptions" TEXT NOT NULL,
    "certificates" TEXT NOT NULL,
    "recomendations" TEXT NOT NULL,
    "follow_up_date" TIMESTAMP(3) NOT NULL,
    "details" JSONB NOT NULL,

    CONSTRAINT "Appointment_Details_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Physician_crm_key" ON "Physician"("crm");

-- CreateIndex
CREATE UNIQUE INDEX "Patient_national_id_key" ON "Patient"("national_id");

-- CreateIndex
CREATE UNIQUE INDEX "Ambulance_appointment_id_key" ON "Ambulance"("appointment_id");

-- CreateIndex
CREATE UNIQUE INDEX "Feedback_appointment_id_key" ON "Feedback"("appointment_id");

-- CreateIndex
CREATE UNIQUE INDEX "Appointment_Details_appointment_id_key" ON "Appointment_Details"("appointment_id");

-- AddForeignKey
ALTER TABLE "Physician_Specialty" ADD CONSTRAINT "Physician_Specialty_specialty_id_fkey" FOREIGN KEY ("specialty_id") REFERENCES "Specialty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Physician_Specialty" ADD CONSTRAINT "Physician_Specialty_physician_id_fkey" FOREIGN KEY ("physician_id") REFERENCES "Physician"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ambulance" ADD CONSTRAINT "Ambulance_appointment_id_fkey" FOREIGN KEY ("appointment_id") REFERENCES "Appointment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MessageLog" ADD CONSTRAINT "MessageLog_patient_id_fkey" FOREIGN KEY ("patient_id") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MessageLog" ADD CONSTRAINT "MessageLog_appointment_id_fkey" FOREIGN KEY ("appointment_id") REFERENCES "Appointment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appointment" ADD CONSTRAINT "Appointment_patient_id_fkey" FOREIGN KEY ("patient_id") REFERENCES "Patient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appointment" ADD CONSTRAINT "Appointment_physician_id_fkey" FOREIGN KEY ("physician_id") REFERENCES "Physician"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_appointment_id_fkey" FOREIGN KEY ("appointment_id") REFERENCES "Appointment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Agenda" ADD CONSTRAINT "Agenda_physician_id_fkey" FOREIGN KEY ("physician_id") REFERENCES "Physician"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appointment_Details" ADD CONSTRAINT "Appointment_Details_appointment_id_fkey" FOREIGN KEY ("appointment_id") REFERENCES "Appointment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
