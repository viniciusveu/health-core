import { Injectable } from '@nestjs/common';
import { DatabaseService } from '../database/database.service';
import { CreateScheduleDto } from './dto/create-schedule.dto';
import { UpdateScheduleDto } from './dto/update-schedule.dto';

@Injectable()
export class ScheduleService {
  constructor(private readonly databaseService: DatabaseService) {}

  create(createScheduleDto: CreateScheduleDto) {
    return this.databaseService.schedule.create({
      data: {
        date: createScheduleDto.date,
        time_slot: createScheduleDto.time_slot,
        status: createScheduleDto.status,
        Physician: { connect: { id: createScheduleDto.phisician_id } },
      },
    });
  }

  findAll() {
    return this.databaseService.schedule.findMany();
  }

  findOne(id: number) {
    return `This action returns a #${id} schedule`;
  }

  update(id: number, updateScheduleDto: UpdateScheduleDto) {
    return `This action updates a #${id} schedule: ${updateScheduleDto}`;
  }

  remove(id: number) {
    return `This action removes a #${id} schedule`;
  }
}
