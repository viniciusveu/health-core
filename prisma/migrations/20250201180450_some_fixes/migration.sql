/*
  Warnings:

  - You are about to drop the column `appointment_id` on the `Ambulance` table. All the data in the column will be lost.
  - You are about to drop the column `ambulance_time` on the `Appointment` table. All the data in the column will be lost.
  - You are about to drop the column `patientId` on the `Appointment` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Ambulance" DROP CONSTRAINT "Ambulance_appointment_id_fkey";

-- DropForeignKey
ALTER TABLE "Appointment" DROP CONSTRAINT "Appointment_patientId_fkey";

-- DropIndex
DROP INDEX "Ambulance_appointment_id_key";

-- DropIndex
DROP INDEX "Feedback_appointment_id_key";

-- AlterTable
ALTER TABLE "Ambulance" DROP COLUMN "appointment_id";

-- AlterTable
ALTER TABLE "Appointment" DROP COLUMN "ambulance_time",
DROP COLUMN "patientId",
ADD COLUMN     "ambulance_id" INTEGER,
ADD COLUMN     "patient_id" INTEGER;

-- AddForeignKey
ALTER TABLE "Appointment" ADD CONSTRAINT "Appointment_ambulance_id_fkey" FOREIGN KEY ("ambulance_id") REFERENCES "Ambulance"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appointment" ADD CONSTRAINT "Appointment_patient_id_fkey" FOREIGN KEY ("patient_id") REFERENCES "Patient"("id") ON DELETE SET NULL ON UPDATE CASCADE;
