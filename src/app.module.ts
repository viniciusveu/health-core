import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PatientModule } from './patient/patient.module';
import { DatabaseModule } from './database/database.module';
import { PhysicianModule } from './physician/physician.module';
import { SpecialtyModule } from './specialty/specialty.module';
import { ScheduleModule } from './schedule/schedule.module';
import { AppointmentModule } from './appointment/appointment.module';
import { AmbulanceModule } from './ambulance/ambulance.module';

@Module({
  imports: [
    PatientModule,
    DatabaseModule,
    PhysicianModule,
    SpecialtyModule,
    ScheduleModule,
    AppointmentModule,
    AmbulanceModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
