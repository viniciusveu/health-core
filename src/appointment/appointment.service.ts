import { Injectable } from '@nestjs/common';
import { CreateAppointmentDto } from './dto/create-appointment.dto';
import { UpdateAppointmentDto } from './dto/update-appointment.dto';
import { DatabaseService } from '../database/database.service';

export const enum AppointmentStatus {
  PENDING = 'PENDING',
  CONFIRMED = 'CONFIRMED',
  CANCELLED = 'CANCELLED',
  IN_PROGRESS = 'IN_PROGRESS',
  FINISHED = 'FINISHED',
}

@Injectable()
export class AppointmentService {
  constructor(private readonly databaseService: DatabaseService) { }

  async create(createAppointmentDto: CreateAppointmentDto) {
    createAppointmentDto.status = AppointmentStatus.PENDING;
    const appointmentCreated = await this.databaseService.appointment.create({
      data: {
        ...createAppointmentDto,
        date_time: new Date(createAppointmentDto.date_time), // Converte string para Date
      },
    });

    console.log({ createAppointmentDto });


    await fetch('http://localhost:3001/', {
      method: 'POST',
      body: JSON.stringify({
        event: "appointment-created",
        patientId: appointmentCreated.patient_id,
        appointmentId: appointmentCreated.id
      })
    })
    return appointmentCreated;
  }

  findAll() {
    return this.databaseService.appointment.findMany();
  }

  findOne(id: number) {
    return this.databaseService.appointment.findUnique({ where: { id } });
  }

  update(id: number, updateAppointmentDto: UpdateAppointmentDto) {
    return this.databaseService.appointment.update({ where: { id }, data: updateAppointmentDto });
  }

  remove(id: number) {
    return this.databaseService.appointment.delete({ where: { id } });
  }
}
