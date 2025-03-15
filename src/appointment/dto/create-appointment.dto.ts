import { AppointmentStatus } from "../appointment.service";

export class CreateAppointmentDto {
  patient_id: number;
  physician_id: number;
  ambulance_id?: number;
  date_time: string | Date;
  reason: string;
  status?: AppointmentStatus;
}
