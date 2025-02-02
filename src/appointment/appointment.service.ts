import { Injectable } from '@nestjs/common';
import { CreateAppointmentDto } from './dto/create-appointment.dto';
import { UpdateAppointmentDto } from './dto/update-appointment.dto';
import { DatabaseService } from 'src/database/database.service';

const enum Status {
  PENDING = 'PENDING',
  CONFIRMED = 'CONFIRMED',
  CANCELLED = 'CANCELLED',
}

@Injectable()
export class AppointmentService {
  constructor(private readonly databaseService: DatabaseService) { }

  create(createAppointmentDto: CreateAppointmentDto) {
    createAppointmentDto.status = Status.PENDING;
    return this.databaseService.appointment.create({
      data: {
        ...createAppointmentDto,
        date_time: new Date(createAppointmentDto.date_time), // Converte string para Date
      },
    });
  }

  findAll() {
    return `This action returns all appointment`;
  }

  findOne(id: number) {
    return `This action returns a #${id} appointment`;
  }

  update(id: number, updateAppointmentDto: UpdateAppointmentDto) {
    return `This action updates a #${id} appointment`;
  }

  remove(id: number) {
    return `This action removes a #${id} appointment`;
  }
}
