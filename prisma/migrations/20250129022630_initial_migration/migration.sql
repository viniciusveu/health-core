/*
  Warnings:

  - The primary key for the `Ambulance` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Ambulance` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `appointment_id` column on the `Ambulance` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Appointment` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `patient_id` on the `Appointment` table. All the data in the column will be lost.
  - The `id` column on the `Appointment` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Appointment_Details` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Appointment_Details` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Feedback` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Feedback` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `MessageLog` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `patient_id` on the `MessageLog` table. All the data in the column will be lost.
  - The `id` column on the `MessageLog` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `appointment_id` column on the `MessageLog` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Patient` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Patient` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Physician` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Physician` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Physician_Specialty` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Specialty` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Specialty` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the `Agenda` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[plate_number]` on the table `Ambulance` will be added. If there are existing duplicate values, this will fail.
  - Changed the type of `physician_id` on the `Appointment` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `appointment_id` on the `Appointment_Details` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `appointment_id` on the `Feedback` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `national_id` on the `Patient` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `physician_id` on the `Physician_Specialty` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `specialty_id` on the `Physician_Specialty` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "Agenda" DROP CONSTRAINT "Agenda_physician_id_fkey";

-- DropForeignKey
ALTER TABLE "Ambulance" DROP CONSTRAINT "Ambulance_appointment_id_fkey";

-- DropForeignKey
ALTER TABLE "Appointment" DROP CONSTRAINT "Appointment_patient_id_fkey";

-- DropForeignKey
ALTER TABLE "Appointment" DROP CONSTRAINT "Appointment_physician_id_fkey";

-- DropForeignKey
ALTER TABLE "Appointment_Details" DROP CONSTRAINT "Appointment_Details_appointment_id_fkey";

-- DropForeignKey
ALTER TABLE "Feedback" DROP CONSTRAINT "Feedback_appointment_id_fkey";

-- DropForeignKey
ALTER TABLE "MessageLog" DROP CONSTRAINT "MessageLog_appointment_id_fkey";

-- DropForeignKey
ALTER TABLE "MessageLog" DROP CONSTRAINT "MessageLog_patient_id_fkey";

-- DropForeignKey
ALTER TABLE "Physician_Specialty" DROP CONSTRAINT "Physician_Specialty_physician_id_fkey";

-- DropForeignKey
ALTER TABLE "Physician_Specialty" DROP CONSTRAINT "Physician_Specialty_specialty_id_fkey";

-- AlterTable
ALTER TABLE "Ambulance" DROP CONSTRAINT "Ambulance_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "appointment_id",
ADD COLUMN     "appointment_id" INTEGER,
ALTER COLUMN "location" DROP NOT NULL,
ADD CONSTRAINT "Ambulance_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Appointment" DROP CONSTRAINT "Appointment_pkey",
DROP COLUMN "patient_id",
ADD COLUMN     "patientId" INTEGER,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "physician_id",
ADD COLUMN     "physician_id" INTEGER NOT NULL,
ALTER COLUMN "ambulance_time" DROP NOT NULL,
ADD CONSTRAINT "Appointment_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Appointment_Details" DROP CONSTRAINT "Appointment_Details_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "appointment_id",
ADD COLUMN     "appointment_id" INTEGER NOT NULL,
ALTER COLUMN "exams" DROP NOT NULL,
ALTER COLUMN "prescriptions" DROP NOT NULL,
ALTER COLUMN "certificates" DROP NOT NULL,
ALTER COLUMN "recomendations" DROP NOT NULL,
ALTER COLUMN "follow_up_date" DROP NOT NULL,
ALTER COLUMN "details" DROP NOT NULL,
ADD CONSTRAINT "Appointment_Details_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Feedback" DROP CONSTRAINT "Feedback_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "appointment_id",
ADD COLUMN     "appointment_id" INTEGER NOT NULL,
ADD CONSTRAINT "Feedback_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "MessageLog" DROP CONSTRAINT "MessageLog_pkey",
DROP COLUMN "patient_id",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "appointment_id",
ADD COLUMN     "appointment_id" INTEGER,
ADD CONSTRAINT "MessageLog_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Patient" DROP CONSTRAINT "Patient_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "national_id",
ADD COLUMN     "national_id" INTEGER NOT NULL,
ADD CONSTRAINT "Patient_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Physician" DROP CONSTRAINT "Physician_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Physician_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Physician_Specialty" DROP CONSTRAINT "Physician_Specialty_pkey",
DROP COLUMN "physician_id",
ADD COLUMN     "physician_id" INTEGER NOT NULL,
DROP COLUMN "specialty_id",
ADD COLUMN     "specialty_id" INTEGER NOT NULL,
ADD CONSTRAINT "Physician_Specialty_pkey" PRIMARY KEY ("physician_id", "specialty_id");

-- AlterTable
ALTER TABLE "Specialty" DROP CONSTRAINT "Specialty_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ALTER COLUMN "description" DROP NOT NULL,
ADD CONSTRAINT "Specialty_pkey" PRIMARY KEY ("id");

-- DropTable
DROP TABLE "Agenda";

-- CreateTable
CREATE TABLE "Schedule" (
    "id" SERIAL NOT NULL,
    "physician_id" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "time_slot" INTEGER NOT NULL,
    "status" TEXT NOT NULL,

    CONSTRAINT "Schedule_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Ambulance_appointment_id_key" ON "Ambulance"("appointment_id");

-- CreateIndex
CREATE UNIQUE INDEX "Ambulance_plate_number_key" ON "Ambulance"("plate_number");

-- CreateIndex
CREATE UNIQUE INDEX "Appointment_Details_appointment_id_key" ON "Appointment_Details"("appointment_id");

-- CreateIndex
CREATE UNIQUE INDEX "Feedback_appointment_id_key" ON "Feedback"("appointment_id");

-- CreateIndex
CREATE UNIQUE INDEX "Patient_national_id_key" ON "Patient"("national_id");

-- AddForeignKey
ALTER TABLE "Physician_Specialty" ADD CONSTRAINT "Physician_Specialty_specialty_id_fkey" FOREIGN KEY ("specialty_id") REFERENCES "Specialty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Physician_Specialty" ADD CONSTRAINT "Physician_Specialty_physician_id_fkey" FOREIGN KEY ("physician_id") REFERENCES "Physician"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ambulance" ADD CONSTRAINT "Ambulance_appointment_id_fkey" FOREIGN KEY ("appointment_id") REFERENCES "Appointment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MessageLog" ADD CONSTRAINT "MessageLog_appointment_id_fkey" FOREIGN KEY ("appointment_id") REFERENCES "Appointment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appointment" ADD CONSTRAINT "Appointment_physician_id_fkey" FOREIGN KEY ("physician_id") REFERENCES "Physician"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appointment" ADD CONSTRAINT "Appointment_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "Patient"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_appointment_id_fkey" FOREIGN KEY ("appointment_id") REFERENCES "Appointment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Schedule" ADD CONSTRAINT "Schedule_physician_id_fkey" FOREIGN KEY ("physician_id") REFERENCES "Physician"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appointment_Details" ADD CONSTRAINT "Appointment_Details_appointment_id_fkey" FOREIGN KEY ("appointment_id") REFERENCES "Appointment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
