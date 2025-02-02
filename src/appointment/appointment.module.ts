import { Module } from '@nestjs/common';
import { AppointmentService } from './appointment.service';
import { AppointmentController } from './appointment.controller';
import { DatabaseModule } from 'src/database/database.module';

@Module({
  controllers: [AppointmentController],
  providers: [AppointmentService],
  imports: [DatabaseModule],
})
export class AppointmentModule {}
