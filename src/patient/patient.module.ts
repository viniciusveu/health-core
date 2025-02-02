import { Module } from '@nestjs/common';
import { PatientService } from './patient.service';
import { PatientController } from './patient.controller';
import { DatabaseModule } from 'src/database/database.module';

@Module({
  controllers: [PatientController],
  providers: [PatientService],
  imports: [DatabaseModule],
})
export class PatientModule {}
